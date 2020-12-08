package com.talentmap.web.service.impl;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.Page;
import com.talentmap.common.bo.TalentGenFocusBO;
import com.talentmap.common.bo.TalentGeneralBO;
import com.talentmap.common.constant.ModuleConstant;
import com.talentmap.common.mapper.*;
import com.talentmap.common.pojo.*;
import com.talentmap.common.utils.*;
import com.talentmap.common.vo.ResultVO;
import com.talentmap.common.vo.TalentMapVO;
import com.talentmap.web.dto.TalentGeneralDTO;
import com.talentmap.web.service.ITalentGeneralService;
import com.talentmap.web.utils.TalentUtil;
import com.talentmap.web.vo.Import2VO;
import com.talentmap.web.vo.ImportVO;
import com.talentmap.web.vo.TalentGeneralVO;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.math.BigDecimal;
import java.util.*;
import java.util.concurrent.TimeUnit;

/**
 * @author xiahui
 * @version 1.0
 * @date Created in 2020/2/12 13:00
 * @description 一般乡贤人才
 */
@EnableTransactionManagement
@Service
public class TalentGeneralServiceImpl implements ITalentGeneralService {
    private static Logger logger = LoggerFactory.getLogger(TalentGeneralServiceImpl.class);

    @Resource
    private TalentGeneralMapper talentGeneralMapper;
    @Resource
    private GeneralPictureMapper generalPictureMapper;
    @Resource
    private TalentFocusMapper talentFocusMapper;
    @Resource
    private TalentFamousMapper talentFamousMapper;
    @Resource
    private IsolationMapper isolationMapper;
    @Resource
    private LogMapper logMapper;
    @Autowired
    private TagMapper tagMapper;
    @Autowired
    private StringRedisTemplate template;

    @Value("${file.rootDir}")
    private String rootDir;
    @Value("${file.projectDir}")
    private String projectDir;
    @Value("${file.pictureDir}")
    private String pictureDir;
    @Value("${file.excelDir}")
    private String excelDir;
    @Value("${file.publicPath}")
    private String publicPath;
    @Value("${config.baidu.ak}")
    private String ak;

    private static final String[] EXCEL_TITLE = {"序号", "乡贤类型", "姓名", "性别", "出生年月", "原籍地（详细：市区/县镇村）", "现所在地(详细：省市区县等）", "学历",
            "现工作单位", "职务", "社会兼职", "行业领域", "人才性质", "移动电话", "经度", "纬度", "邮箱/微信", "高中毕业学校"};

    @Override
    public DTPageInfo<TalentGeneralVO> query(HttpSession httpSession, int draw, int pageNum, int pageSize, HashMap<String, Object> hashMap) {
        //从session里取得隔离信息
        IsolationPO isolationPO = (IsolationPO) httpSession.getAttribute("isolationPO");
        hashMap.put("isolationId", isolationPO.getIsolationId());
        if (isolationPO.getTagId() != null) {
            hashMap.put("isolationType", 2);
            TagPO tagPO = tagMapper.selectByPrimaryKey(isolationPO.getTagId());
            hashMap.put("tagName", tagPO.getName());
//         区级，乡镇级
        } else if (isolationPO.getIsolationId() >= 2) {
            hashMap.put("isolationType", 1);
//         市级
        } else {
            hashMap.put("isolationType", 0);
        }//        学校，工会

        //添加数据来源的筛选条件
        String sourceName = (String) hashMap.get("sourceName");
        if (sourceName != null && sourceName.trim().length() > 0) {
            List<Long> ISOS = isolationMapper.queryByName(sourceName);
            if (ISOS != null) {
                hashMap.put("source", ISOS);
            }
        }

        Page<TalentGeneralBO> page = PageHelper.startPage(pageNum, pageSize);
        List<TalentGeneralBO> bos = talentGeneralMapper.findGeneral(hashMap);
        return new DTPageInfo<>(draw, page.getTotal(), TalentGeneralVO.convert(bos));

    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public ResultVO edit(HttpSession session, TalentGeneralDTO dto) {
        IsolationPO sessionPO = (IsolationPO) session.getAttribute("isolationPO");

        List<TalentGeneralPO> existPOs = talentGeneralMapper.queryByNameAndIso(dto.getName(), sessionPO.getIsolationId());
        Map<String, TalentGeneralPO> existMap = new HashMap<>();
        for (TalentGeneralPO po : existPOs) {
            existMap.put(po.toString(), po);
        }

        List<IsolationPO> allIsoPOs = isolationMapper.queryAll();
        List<Long> isolationIds = new ArrayList<>();

        boolean isSchool = false;
        //非市级，非学校，非商会
        if (sessionPO.getIsolationId() != 1L && sessionPO.getTagId() == null) {
            isolationIds = isolationMapper.queryIds(sessionPO.getIsolationId());
        }
        //学校商会用户
        if (sessionPO.getIsolationId() != 1L && sessionPO.getTagId() != null) {
            isolationIds = isolationMapper.queryIds(sessionPO.getIsolationId());
            isSchool = true;
        }
        if (null == dto.getId()) {
            // 新增数据
            TalentGeneralPO po = TalentGeneralDTO.convert2PO(dto);
            if (existMap.containsKey(po.toString())) {
                // 已有重复数据
                return new ResultVO(1100);
            }

            po.setCreateTime(new Date());
            po.setDr((byte) 1);
            po.setUserId((Long) session.getAttribute("userId"));
            if (isSchool) {
                po.setIsolationId(sessionPO.getIsolationId());
            } else {
                po.setIsolationId(genIsolationId(sessionPO, allIsoPOs, dto.getTown()));
            }

            po.setChina(isChinaByPO(po.getLongitude(), po.getLatitude()));
            po.setSource(sessionPO.getIsolationId());
            //不允许上传
            if (isolationIds.size() > 0 && !isolationIds.contains(po.getIsolationId())) {
                return new ResultVO(1102);
            }
            updateAvatarAndPicture(po, dto);

            if (dto.getFocus()) {
                TalentFocusPO focusPO = new TalentFocusPO();
                focusPO.setIsolationId(sessionPO.getIsolationId());
                focusPO.setTgId(po.getTgId());
                talentFocusMapper.insert(focusPO);
            }

            /**
             * author: dangyi
             * 用户操作日志
             */
            String description = "手动增加了 乡贤管理->乡贤人才：" + po.getName() + " 乡贤数据";
            LogUtil.recordUserOperation(session, description, logMapper);

            this.deleteAllRedis();
            return new ResultVO(1000);
        }

        // 编辑数据
        TalentGeneralPO po = talentGeneralMapper.selectByPrimaryKey(dto.getId());
        if (null == po) {
            // 数据已删除
            return new ResultVO(1001);
        }
        TalentGeneralDTO.updatePOByDTO(po, dto);

        if (isSchool) {
            po.setIsolationId(sessionPO.getIsolationId());
        } else {
            po.setIsolationId(genIsolationId(sessionPO, allIsoPOs, dto.getTown()));
        }
        //不能修改
        if (isolationIds.size() > 0 && !isolationIds.contains(po.getIsolationId())) {
            return new ResultVO(1102);
        }
        // 更新是否重要
        if (!updateFocus(dto.getId(), dto.getFocus(), sessionPO.getIsolationId())) {
            if (existPOs.size() > 1 && existMap.containsKey(po.toString())) {
                if (!existMap.get(po.toString()).getTgId().equals(po.getTgId())) {
                    // 已有重复数据
                    return new ResultVO(1100);
                }
            }
        }

        po.setUpdateTime(new Date());

        po.setChina(isChinaByPO(po.getLongitude(), po.getLatitude()));
        updateAvatarAndPicture(po, dto);

        /**
         * author: dangyi
         * 日志：记录用户操作行为
         */
        String description = "修改了 乡贤管理->乡贤人才：" + po.getName() + " 乡贤数据";
        LogUtil.recordUserOperation(session, description, logMapper);

        this.deleteAllRedis();
        return new ResultVO(1000);
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public ResultVO batchInsert(HttpSession session, MultipartFile file) {
        long point1 = System.currentTimeMillis();
        String fileName = file.getOriginalFilename();
        if (null == fileName) {
            // 文件内表头信息或文件格式有误，请下载模板文件检查后重新上传！
            return new ResultVO(1100);
        }
        String suffix = fileName.substring(fileName.lastIndexOf("."));
        if (!".xlsx".equals(suffix)) {
            // 文件内表头信息或文件格式有误，请下载模板文件检查后重新上传！
            return new ResultVO(1100);
        }

        IsolationPO sessionPO = (IsolationPO) session.getAttribute("isolationPO");
        // 数据库所有乡贤人才数据
        List<TalentGeneralPO> existPOs = talentGeneralMapper.queryByNameAndIso(null, sessionPO.getIsolationId());
        Map<String, TalentGeneralPO> existMap = new HashMap<>();
        //存储已经上传的乡贤数据
        for (TalentGeneralPO po : existPOs) {
            existMap.put(po.toString(), po);
        }
        //数据库中重点乡贤数据
        List<TalentGenFocusBO> talentGenFocusBOS = talentFocusMapper.queryByIsoId(sessionPO.getIsolationId());
        Map<String, TalentGenFocusBO> existfocusPOMap = new HashMap<>();
        for (TalentGenFocusBO talentGenFocusBO : talentGenFocusBOS) {
            existfocusPOMap.put(talentGenFocusBO.toString(), talentGenFocusBO);
        }

        Map<String, TalentGeneralPO> newGeneralMap = new LinkedHashMap<>();    // 一般乡贤数据
        Map<String, TalentGeneralPO> newFocusMap = new LinkedHashMap<>();  // 重要乡贤数据
        List<XSSFRow> errRows = new LinkedList<>(); // 错误数据
        List<XSSFRow> dupRows = new LinkedList<>(); // 重复数据
        List<XSSFRow> denRows = new LinkedList<>(); // 无权数据
        List<XSSFRow> sucRows = new LinkedList<>(); // 成功数据

        List<TalentFocusPO> upFoucsPo = new ArrayList<>();//更新的重点乡贤
        List<TalentFocusPO> addFocusPOS = new LinkedList<>();//只更新重点乡贤

        //数据库重点、数据库重点插入数据
        try {
            XSSFWorkbook wb = new XSSFWorkbook(file.getInputStream());
            XSSFSheet sheet = null;

            boolean isNormTitle = false;
            for (int i = 0; i < 2; i++) {
                sheet = wb.getSheetAt(i);
                if (ExcelUtil.isNormTitle(sheet.getRow(1), EXCEL_TITLE)) {
                    isNormTitle = true;
                    break;
                }
            }
            if (!isNormTitle) {
                // 文件内表头信息或文件格式有误，请下载模板文件检查后重新上传！
                return new ResultVO(1100);
            }

            Date curDate = new Date();
            Long userId = (Long) session.getAttribute("userId");
            List<IsolationPO> allIsoPOs = isolationMapper.queryAll();
            List<Long> isolationIds = new ArrayList<>();
            if (sessionPO.getIsolationId() != 1L && sessionPO.getTagId() == null) {
                isolationIds = isolationMapper.queryIds(sessionPO.getIsolationId());
            }
            //学校商会用户
            if (sessionPO.getIsolationId() != 1L && sessionPO.getTagId() != null) {
                isolationIds = isolationMapper.queryIds(sessionPO.getIsolationId());
            }
            long point2 = System.currentTimeMillis();
            logger.debug("批量导入准备时间：{}ms", point2 - point1);
            for (int r = 2; r <= sheet.getLastRowNum(); r++) {
                XSSFRow row = sheet.getRow(r);
                if (row == null) {
                    continue;
                }

                TalentGeneralPO po = this.buildPObyRow(row);

                if (po != null) {
                    po.setCreateTime(curDate);
                    po.setUserId(userId);
                    po.setSource(sessionPO.getIsolationId());
                    po.setIsolationId(genIsolationId(sessionPO, allIsoPOs, po.getHometown()));
                }
                if (null == po) {
                    errRows.add(row);
                }//先处理不能上传的，
                else if (sessionPO.getIsolationId() != 1L && sessionPO.getTagId() == null && po.getIsolationId() != 1L && !isolationIds.contains(po.getIsolationId())) {
                    denRows.add(row);
                } else if (existMap.containsKey(po.toString()) || newGeneralMap.containsKey(po.toString()) || newFocusMap.containsKey(po.toString()))
                {
                    String talentType = ExcelUtil.getStringValue(row, 1);
                    if (talentType == null || talentType.trim().equals("")) {
                        denRows.add(row);
                    }
                    if (talentType.equals("一般乡贤")) {
                        if (newGeneralMap.containsKey(po.toString())) {
                            dupRows.add(row);
                        }
                        else {
                            if (existMap.containsKey(po.toString())) {
                                if (existfocusPOMap.containsKey(po.toString())) {
                                    TalentGenFocusBO talentGenFocusBO = existfocusPOMap.get(po.toString());
                                    TalentFocusPO focusPO = new TalentFocusPO();
                                    focusPO.setTfId(talentGenFocusBO.getTfId());
                                    upFoucsPo.add(focusPO);//更新：删除数据库中记录
                                    sucRows.add(row);
                                }
                                else {
                                    dupRows.add(row);
                                }
                            }
                            else {
                                newGeneralMap.put(po.toString(), po);
                                sucRows.add(row);
                            }
                        }

                    }
                    else if (isFocus(talentType))
                    { //重点乡贤
                        if (newFocusMap.containsKey(po.toString())) {
                            dupRows.add(row);
                        }
                        else {
                            if (existMap.containsKey(po.toString())) {
                                if (existfocusPOMap.containsKey(po.toString())) {
                                    dupRows.add(row);
                                }
                                else {
                                    TalentGeneralPO talentGeneralPOTable = existMap.get(po.toString());
                                    TalentFocusPO focusPO = new TalentFocusPO();
                                    focusPO.setIsolationId(sessionPO.getIsolationId());
                                    focusPO.setTgId(talentGeneralPOTable.getTgId());
                                    addFocusPOS.add(focusPO);//新增一条记录
                                    sucRows.add(row);
                                }

                            }
                            else {
                                newFocusMap.put(po.toString(), po);
                                sucRows.add(row);
                            }
                        }
                    }
                }
                else {
                    if (sessionPO.getIsolationId() != 1L && sessionPO.getTagId() == null && po.getIsolationId() != 1L && !isolationIds.contains(po.getIsolationId())) {
                        //代表IsolationPO不是1号，是区级，不是1号，大的区域不包括该po区域；
                        denRows.add(row);

                    } else {
                        sucRows.add(row);
                        if (isFocus(ExcelUtil.getStringValue(row, 1))) {
                            newFocusMap.put(po.toString(), po);
                        } else {
                            newGeneralMap.put(po.toString(), po);
                        }
                    }
                    po.setChina(isChinaByPO(po.getLongitude(), po.getLatitude()));
                }
            }
            long point3 = System.currentTimeMillis();
            logger.debug("批量导入执行时间：{}ms", point3 - point2);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResultVO(1100);
        }

        long point4 = System.currentTimeMillis();
        // 跟新显示数据
        Import2VO vo = new Import2VO();
        vo.setTotal(newGeneralMap.size() + newFocusMap.size() + upFoucsPo.size() + addFocusPOS.size() + dupRows.size() + errRows.size() + denRows.size());
        vo.setSuccess(newGeneralMap.size() + newFocusMap.size());
        vo.setUpSuc( addFocusPOS.size() + upFoucsPo.size());
        vo.setDuplicate(dupRows.size() + errRows.size() + denRows.size());

        if (upFoucsPo.size() > 0) {
            talentFocusMapper.batchDel(upFoucsPo);//
        }

        if (addFocusPOS.size() > 0) {
            talentFocusMapper.batchInsert(addFocusPOS);
        }

        if (newGeneralMap.size() > 0) {
            talentGeneralMapper.batchInsert(new LinkedList<>(newGeneralMap.values()));
        }
        if (newFocusMap.size() > 0) {
            List<TalentGeneralPO> pos = new LinkedList<>(newFocusMap.values());
            talentGeneralMapper.batchInsert(pos);
            List<TalentFocusPO> tfPOs = new LinkedList<>();
            for (TalentGeneralPO po : pos) {
                TalentFocusPO tfPO = new TalentFocusPO();
                tfPO.setTgId(po.getTgId());
                tfPO.setIsolationId(sessionPO.getIsolationId());
                tfPOs.add(tfPO);
            }
            talentFocusMapper.batchInsert(tfPOs);
        }
        if (dupRows.size() > 0 || errRows.size() > 0 || denRows.size() > 0) {
            XSSFWorkbook wb = ExcelUtil.buildDupExcel("衢籍乡贤名册(蓝色：重复, 绿色：不能上传其他地区的人才, 红色：格式不正确（出生年月如出现错误，请检查格式是否为\"yyyy.mm.dd\"如：\"1992\",\"1992.01\",\"1992.02.03\"三种格式，如经纬度出现错误，请检查是否有空格，特殊符号，英文字母等无法识别的字符。）)", EXCEL_TITLE, dupRows, errRows, denRows);
            vo.setDupUrl(publicPath + ExcelUtil.save(wb, rootDir, projectDir, excelDir, ModuleConstant.TALENT_GENERAL + "重复"));
        }

        XSSFWorkbook wb = ExcelUtil.buildDupExcel("衢籍乡贤名册", EXCEL_TITLE, sucRows);
        String sucUrl = publicPath + ExcelUtil.save(wb, rootDir, projectDir, excelDir, ModuleConstant.TALENT_GENERAL + "成功");
        /**
         * author: dangyi
         * 日志：记录用户操作行为
         */
        if((newGeneralMap.size() + newFocusMap.size())>0){
            String description = "批量增加了 乡贤管理->乡贤人才" + (newGeneralMap.size() + newFocusMap.size()) + "个乡贤数据";
            LogUtil.recordUserOperation(session, description, logMapper, sucUrl);
        }
        if((addFocusPOS.size()+upFoucsPo.size())>0){
            String description = "批量编辑了 乡贤管理->乡贤人才" + (addFocusPOS.size()+upFoucsPo.size()) + "个乡贤数据";
            LogUtil.recordUserOperation(session, description, logMapper, sucUrl);
        }
        long point5 = System.currentTimeMillis();
        logger.debug("批量导入收尾时间：{}ms", point5 - point4);
        logger.debug("批量导入总时间：{}ms", point5 - point1);

        this.deleteAllRedis();
        return new ResultVO<>(1000, vo);
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public ResultVO delete(HttpSession session, Long tgId) {
        TalentGeneralPO po = talentGeneralMapper.selectByPrimaryKey(tgId);
        if (null == po) {
            return new ResultVO(1001);
        }
        talentGeneralMapper.deleteByPrimaryKey(tgId);

        talentFamousMapper.deleteByTgId(tgId);
        talentFocusMapper.deleteByTgId(tgId);

        /**
         * author: dangyi
         * 日志：记录用户操作行为
         */
        String description = "删除了 乡贤管理->乡贤人才：" + po.getName() + " 乡贤数据";
        LogUtil.recordUserOperation(session, description, logMapper);

        this.deleteAllRedis();
        return new ResultVO(1000);
    }

    @Override
    public void export(HttpSession session, HashMap<String, Object> hashMap, HttpServletResponse res) {
        //从session里取得隔离信息
        IsolationPO isolationPO = (IsolationPO) session.getAttribute("isolationPO");
        hashMap.put("isolationId", isolationPO.getIsolationId());
//        学校，工会
        if (isolationPO.getTagId() != null) {
            hashMap.put("isolationType", 2);
            TagPO tagPO = tagMapper.selectByPrimaryKey(isolationPO.getTagId());
            hashMap.put("tagName", tagPO.getName());
//         区级，乡镇级
        } else if (isolationPO.getIsolationId() >= 2) {
            hashMap.put("isolationType", 1);
//         市级
        } else {
            hashMap.put("isolationType", 0);
        }
        List<TalentGeneralBO> bos = talentGeneralMapper.findGeneral(hashMap);
        List<Long> tgIds = new ArrayList<>();
        for (TalentGeneralBO bo : bos) {
            tgIds.add(bo.getTgId());
        }

//        IsolationPO isolationPO = (IsolationPO) session.getAttribute("isolationPO");
        List<Long> existTgIds = talentFocusMapper.queryExistTgIds(tgIds, isolationPO.getIsolationId());
        //生成Excel表格
        XSSFWorkbook wb = this.toExcel(bos, existTgIds);
        //发送响应流数据给前端
        ExcelUtil.sendToClient(wb, res);
    }

    @Override
    public ResultVO queryById(HttpSession session, Long id) {
        TalentGeneralVO vo = TalentGeneralVO.convert(talentGeneralMapper.queryById(id));
        TalentFocusPO po = talentFocusMapper.queryByTgIdAndIsoId(vo.getId(), ((IsolationPO) session.getAttribute("isolationPO")).getIsolationId());
        vo.setFocus(po != null);
        return new ResultVO<>(1000, vo);
    }

    @Override
    public ResultVO queryMap(HttpSession session, Byte china) {
        IsolationPO isolationPO = (IsolationPO) session.getAttribute("isolationPO");
        String redisKey = "TalentMap_" + isolationPO.getIsolationId() + "_" + china;
        if (template.hasKey(redisKey)) {
            TalentMapVO vo = JSON.parseObject(template.opsForValue().get(redisKey), TalentMapVO.class);
            return new ResultVO<>(1000, vo);
        }

        List<TalentGeneralPO> pos = talentGeneralMapper.queryByChinaAndIsoId(china, isolationPO.getIsolationId());

        TalentMapVO vo = new TalentMapVO();

        List<String> types = new ArrayList<>();
        for (Map.Entry<Integer, String> entry : TalentUtil.natureISMap.entrySet()) {
            types.add(entry.getValue());
        }
        vo.setTypes(types);

        List<TalentMapVO.Detail> details = new ArrayList<>();
        for (TalentGeneralPO po : pos) {
            TalentMapVO.Detail detail = vo.new Detail();
            detail.setName(po.getName());

            List<Object> values = new ArrayList<>();
            values.add(po.getLongitude());
            values.add(po.getLatitude());
            TalentMapVO.Value value = vo.new Value();
            value.setPosi(po.getPosition());
            value.setType(TalentUtil.natureISMap.get(po.getNatureId()));
            value.setLocal(po.getLocation());
            value.setTown(po.getHometown());
            value.setUnit(po.getWorkunit());
            value.setPhone(po.getPhone());
            values.add(value);

            detail.setValue(values);

            details.add(detail);
        }
        vo.setDetails(details);

        template.opsForValue().set(redisKey, JSON.toJSONString(vo), 5L, TimeUnit.MINUTES);
        return new ResultVO<>(1000, vo);
    }

    @Override
    public ResultVO important(HttpSession session, Long tgId, Boolean focus) {
        IsolationPO sessionPO = (IsolationPO) session.getAttribute("isolationPO");
        updateFocus(tgId, focus, sessionPO.getIsolationId());
        return new ResultVO(1000);
    }

    /**
     * 根据Row创建PO
     *
     * @param row
     * @return
     */
    private TalentGeneralPO buildPObyRow(XSSFRow row) {
        try {
            TalentGeneralPO po = new TalentGeneralPO();

            // 姓名为null 数据作废
            String name = ExcelUtil.getStringValue(row, 2);
            if (null == name || "".equals(name)) {
                return null;
            }

            po.setName(name);
            po.setSex((byte) ("男".equals(ExcelUtil.getStringValue(row, 3)) ? 1 : 2));
            po.setBirth(DateUtil.str2Date(ExcelUtil.getStringValue(row, 4), DateUtil.YM));
            po.setHometown(ExcelUtil.getStringValue(row, 5));
            po.setLocation(ExcelUtil.getStringValue(row, 6));
            po.setEducId(TalentUtil.educMap.get(ExcelUtil.getStringValue(row, 7)));
            po.setWorkunit(ExcelUtil.getStringValue(row, 8));
            po.setPosition(ExcelUtil.getStringValue(row, 9));
            po.setSocialWork(ExcelUtil.getStringValue(row, 10));
            po.setField(ExcelUtil.getStringValue(row, 11));
            po.setNatureId(TalentUtil.natureMap.get(ExcelUtil.getStringValue(row, 12)));
            if (null != row.getCell(13)) {
                po.setPhone(ExcelUtil.getStringValue(row, 13));
            }
            if (null != row.getCell(14) && !"".equals(row.getCell(14).toString())) {
                po.setLongitude(new BigDecimal(ExcelUtil.getStringValue(row, 14)));
            }
            if (null != row.getCell(15) && !"".equals(row.getCell(15).toString())) {
                po.setLatitude(new BigDecimal(ExcelUtil.getStringValue(row, 15)));
            }
            if (null != row.getCell(16) && !"".equals(row.getCell(16).toString())) {
                po.setContact(ExcelUtil.getStringValue(row, 16));
            }
            if (null != row.getCell(17) && !"".equals(row.getCell(17).toString())) {
                po.setHighSchool(ExcelUtil.getStringValue(row, 17));
            }

            po.setDr((byte) 1);

            return po;
        } catch (Exception e) {
            return null;
        }
    }


    /**
     * 生成Excel表格
     *
     * @param bos
     * @param tgIds
     * @return
     */
    private XSSFWorkbook toExcel(List<TalentGeneralBO> bos, List<Long> tgIds) {
        String head = "衢州市一般乡贤人才名单(共" + bos.size() + "人）";
        String[][] content = new String[bos.size()][EXCEL_TITLE.length];
        for (int i = 0; i < bos.size(); i++) {
            String[] data = new String[EXCEL_TITLE.length];
            TalentGeneralBO bo = bos.get(i);
            data[0] = String.valueOf(i + 1);
            data[1] = tgIds.contains(bo.getTgId()) ? "重点乡贤" : "一般乡贤";
            data[2] = bo.getName();
            data[3] = bo.getSex() == 1 ? "男" : bo.getSex() == 2 ? "女" : null;
            data[4] = DateUtil.date2Str(bo.getBirth(), DateUtil.YM);
            data[5] = bo.getHometown();
            data[6] = bo.getLocation();
            data[7] = bo.getEduc();
            data[8] = bo.getWorkunit();
            data[9] = bo.getPosition();
            data[10] = bo.getSocialWork();
            data[11] = bo.getField();
            data[12] = bo.getNature();
            data[13] = bo.getPhone();
            data[14] = null == bo.getLongitude() ? null : String.valueOf(bo.getLongitude());
            data[15] = null == bo.getLongitude() ? null : String.valueOf(bo.getLatitude());
            data[16] = bo.getContact();
            data[17] = bo.getHighSchool();

            content[i] = data;
        }

        return ExcelUtil.buildExcel(head, EXCEL_TITLE, content);
    }

    /**
     * 生成隔离ID
     *
     * @param sessionPO
     * @param allIsoPOs
     * @param hometown
     */
    private Long genIsolationId(IsolationPO sessionPO, List<IsolationPO> allIsoPOs, String hometown) {
        if (sessionPO.getTagId() != null) {
            // 学校/商会
            return sessionPO.getIsolationId();
        }
        Long isolationId = 1L;
        if (isolationId == 1L) {
            isolationId = sessionPO.getIsolationId();
        }
        if (hometown != null) {
            for (IsolationPO isoPO : allIsoPOs) {
                if (hometown.startsWith(isoPO.getName())) {
                    isolationId = isoPO.getIsolationId();
                }
            }
        }
        return isolationId;
    }

    /**
     * 更新头像和图片
     *
     * @param po
     * @param dto
     */
    private void updateAvatarAndPicture(TalentGeneralPO po, TalentGeneralDTO dto) {
        if (null != dto.getAvatar()) {
            po.setAvatar(FileUtil.uploadFile(dto.getAvatar(), rootDir, projectDir, pictureDir, ModuleConstant.TALENT_FOCUS));
        } else if (null != dto.getDelAva()) {
            po.setAvatar(null);
        }
        if (null == dto.getId()) {
            talentGeneralMapper.insert(po);
        } else {
            talentGeneralMapper.updateByPrimaryKey(po);
        }

        // 批量插入图片
        if (null != dto.getPicture() && dto.getPicture().length != 0) {
            Date curDate = new Date();
            List<GeneralPicturePO> pos = new ArrayList<>();
            for (MultipartFile pic : dto.getPicture()) {
                GeneralPicturePO picPO = new GeneralPicturePO();
                picPO.setTgId(po.getTgId());
                picPO.setCreateTime(curDate);
                picPO.setPicture(FileUtil.uploadFile(pic, rootDir, projectDir, pictureDir, ModuleConstant.TALENT_FOCUS));
                pos.add(picPO);
            }

            generalPictureMapper.batchInsert(pos);
        }

        // 批量删除图片
        if (null != dto.getDelIds() && dto.getDelIds().size() != 0) {
            generalPictureMapper.batchDelete(dto.getDelIds());
        }
    }

    /**
     * 更新是否重要
     *
     * @param tgId
     * @param focus
     * @param isolationId
     * @return 是否执行更新
     */
    private boolean updateFocus(Long tgId, boolean focus, Long isolationId) {
        boolean flag = false;
        TalentFocusPO talentFocusPO = talentFocusMapper.queryByTgIdAndIsoId(tgId, isolationId);
        if (null == talentFocusPO && focus) {
            TalentFocusPO focusPO = new TalentFocusPO();
            focusPO.setIsolationId(isolationId);
            focusPO.setTgId(tgId);
            talentFocusMapper.insert(focusPO);
            flag = true;
        } else if (null != talentFocusPO && !focus) {
            talentFamousMapper.deleteByTfId(talentFocusPO.getTfId());
            talentFocusMapper.deleteByPrimaryKey(talentFocusPO.getTfId());
            flag = true;
        }

        return flag;
    }

    /**
     * 判断是否是china
     *
     * @param longitude
     * @param latitude
     * @return
     */
    private Byte isChinaByPO(BigDecimal longitude, BigDecimal latitude) {
        if (null == longitude || null == latitude || "".equals(longitude) || "".equals(latitude)) {
            return null;
        }

        try {
            if (longitude.compareTo(BigDecimal.valueOf(72)) < 0 || longitude.compareTo(BigDecimal.valueOf(136)) > 0
                    || latitude.compareTo(BigDecimal.valueOf(3)) < 0 || latitude.compareTo(BigDecimal.valueOf(54)) > 0) {
                return 2;
            }

            String location = latitude.toString() + "," + longitude.toString();
            // 通过百度Api查询是否是中国
            RestTemplate template = new RestTemplate();
            String res = template.getForObject("http://api.map.baidu.com/reverse_geocoding/v3/?ak={1}&output=json&location={2}", String.class, ak, location);
            JSONObject json = JSONObject.parseObject(res);
            String country = json.getJSONObject("result").getJSONObject("addressComponent").getString("country");
            if ("中国".equals(country)) {
                return 1;
            } else {
                return 2;
            }
        } catch (Exception e) {
            logger.info("TalentGeneralServiceImpl.isChinaByPO: ", e);
            return null;
        }
    }

    /**
     * 删除redis所有数据
     */
    public void deleteAllRedis() {
        Set<String> keys = template.keys("TalentMap*");
        template.delete(keys);
    }


    private boolean isFocus(String str){
        if("重要乡贤".equals(str)){
            return true;
        }else if("重点乡贤".equals(str)){
            return true;
        }
        return false;
    }


}
