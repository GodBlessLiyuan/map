package com.talentmap.web.service.impl;

import com.github.pagehelper.Page;
import com.talentmap.common.bo.TalentGeneralBO;
import com.talentmap.common.mapper.*;
import com.talentmap.common.pojo.IsolationPO;
import com.talentmap.common.pojo.TalentFamousPO;
import com.talentmap.common.pojo.TalentFocusPO;
import com.talentmap.common.pojo.TalentGeneralPO;
import com.talentmap.common.utils.DTPageInfo;
import com.talentmap.common.utils.LogUtil;
import com.talentmap.common.utils.PageHelper;
import com.talentmap.common.vo.ResultVO;
import com.talentmap.web.service.ITalentFamousService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author: xiahui
 * @date: Created in 2020/2/27 19:00
 * @description: 展示配置
 * @version: 1.0
 */
@EnableTransactionManagement
@Service
public class TalentFamousServiceImpl implements ITalentFamousService {
    @Resource
    private TalentGeneralMapper talentGeneralMapper;
    @Resource
    private TalentFamousMapper talentFamousMapper;
    @Resource
    private TalentFocusMapper talentFocusMapper;
    @Resource
    private LogMapper logMapper;
    @Autowired
    private TagMapper tagMapper;
    @Value("${file.publicPath}")
    private String publicPath;

    @Override
    public DTPageInfo<HashMap<String, Object>> findFamous(HttpSession httpSession, int draw, int pageNum,
                                                          int pageSize, HashMap<String, Object> hashMap) {
        Page<TalentGeneralBO> page = PageHelper.startPage(pageNum, pageSize);
        //从session里取得隔离信息
        IsolationPO isolationPO = (IsolationPO) httpSession.getAttribute("isolationPO");
        hashMap.put("isolationId", isolationPO.getIsolationId());
////        学校，工会
//        if (isolationPO.getTagId() != null) {
//            hashMap.put("isolationType", 2);
//            TagPO tagPO = tagMapper.selectByPrimaryKey(isolationPO.getTagId());
//            hashMap.put("tagName", tagPO.getName());
////         区级，乡镇级
//        } else if (isolationPO.getIsolationId() >= 2) {
//            hashMap.put("isolationType", 1);
////         市级
//        } else {
//            hashMap.put("isolationType", 0);
//        }
        List<HashMap<String, Object>> list = talentFamousMapper.findFamous(hashMap);

        for (HashMap<String, Object> map : list) {
            if (map.get("avatar") != null) {
                String newPublicPath = publicPath + map.get("avatar");
                map.put("avatar", newPublicPath);
            }
        }
        return new DTPageInfo<>(draw, page.getTotal(), list);
    }


    @Override
    public DTPageInfo<HashMap<String, Object>> findFocus(HttpSession httpSession, int draw, int pageNum,
                                                         int pageSize, HashMap<String, Object> hashMap) {
        Page<TalentGeneralBO> page = PageHelper.startPage(pageNum, pageSize);
        //从session里取得隔离信息
        IsolationPO isolationPO = (IsolationPO) httpSession.getAttribute("isolationPO");
        hashMap.put("isolationId", isolationPO.getIsolationId());
////        学校，工会
//        if (isolationPO.getTagId() != null) {
//            hashMap.put("isolationType", 2);
//            TagPO tagPO = tagMapper.selectByPrimaryKey(isolationPO.getTagId());
//            hashMap.put("tagName", tagPO.getName());
////         区级，乡镇级
//        } else if (isolationPO.getIsolationId() >= 2) {
//            hashMap.put("isolationType", 1);
////         市级
//        } else {
//            hashMap.put("isolationType", 0);
//        }
        List<HashMap<String, Object>> list = talentFocusMapper.findFocus(hashMap);

        for (HashMap<String, Object> map : list) {
            if (map.get("avatar") != null) {
                String newPublicPath = publicPath + map.get("avatar");
                map.put("avatar", newPublicPath);
            }
        }
        return new DTPageInfo<>(draw, page.getTotal(), list);
    }

    @Override
    public ResultVO addFamous(HttpSession httpSession, List<Long> tfIdList) {
        TalentFamousPO talentFamousPO = new TalentFamousPO();
        TalentFocusPO talentFocusPO;
        IsolationPO isolationPO = (IsolationPO) httpSession.getAttribute("isolationPO");
        Integer num = talentFamousMapper.countNum(isolationPO.getIsolationId()) + 1;
        Integer resultNum = 0;
        for (Long id : tfIdList) {
            //focus表里取信息，存到famous表里
            talentFocusPO = talentFocusMapper.selectByPrimaryKey(id);
            talentFamousPO.setIsolationId(talentFocusPO.getIsolationId());
            talentFamousPO.setTfId(talentFocusPO.getTfId());
            talentFamousPO.setTgId(talentFocusPO.getTgId());
            talentFamousPO.setNum(num);
            num++;
            //新增famous表
            Integer result = talentFamousMapper.insertSelective(talentFamousPO);
            if (result != 0) {
                resultNum++;
            }
        }
        /**
         * author: ChenXU
         * 日志：记录用户操作行为
         */
        String description = "增加了乡贤管理 -> 展示配置：" + resultNum + " 重点乡贤数据";
        LogUtil.recordUserOperation(httpSession, description, logMapper);
        return new ResultVO(1000, resultNum);
    }

    @Override
    public ResultVO deleteFamous(HttpSession httpSession, Long tfsId) {
        TalentFamousPO deletePO = talentFamousMapper.selectByPrimaryKey(tfsId);
        TalentGeneralPO deleteGeneralPO = talentGeneralMapper.selectByPrimaryKey(deletePO.getTgId());
        Integer deleteResult = talentFamousMapper.deleteByPrimaryKey(tfsId);
        List<TalentFamousPO> list = talentFamousMapper.findByIsolationId(deletePO.getIsolationId());
        Integer num = 1;
        for (TalentFamousPO talentFamousPO : list) {
            talentFamousPO.setNum(num);
            talentFamousMapper.updateByPrimaryKeySelective(talentFamousPO);
            num++;
        }
        /**
         * author: ChenXU
         * 日志：记录用户操作行为
         */
        String description = "取消了乡贤人才 -> 重点乡贤："+deleteGeneralPO.getName()+" 乡贤数据";
        LogUtil.recordUserOperation(httpSession, description, logMapper);
        return new ResultVO(1000, deleteResult);
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public ResultVO updateNum(HttpSession session, List<Long> tfsIds) {
        List<TalentFamousPO> pos = talentFamousMapper.queryByIds(tfsIds);
        if(null == pos || pos.size() == 0) {
            return new ResultVO(1001);
        }

        Map<Long, TalentFamousPO> famousMap = new HashMap<>();
        int minIndex = Integer.MAX_VALUE;
        for (TalentFamousPO po : pos) {
            minIndex = po.getNum() < minIndex ? po.getNum() : minIndex;
            famousMap.put(po.getTfsId(), po);
        }

        for (Long tfsId : tfsIds) {
            TalentFamousPO po = famousMap.get(tfsId);
            po.setNum(minIndex++);
        }

        talentFamousMapper.batchUpdate(pos);

        return new ResultVO(1000);
    }
}
