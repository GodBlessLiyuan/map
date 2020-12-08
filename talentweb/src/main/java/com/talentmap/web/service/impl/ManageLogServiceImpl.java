package com.talentmap.web.service.impl;

import com.github.pagehelper.Page;
import com.talentmap.common.bo.LogBO;
import com.talentmap.common.mapper.LogMapper;
import com.talentmap.common.pojo.IsolationPO;
import com.talentmap.common.utils.DTPageInfo;
import com.talentmap.common.utils.DateUtil;
import com.talentmap.common.utils.PageHelper;
import com.talentmap.web.service.IManageLogService;
import com.talentmap.web.vo.LogVO;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Author：dangyi
 * @Date: Created in 2020/2/28 21:02
 * @Description:
 */
@Service
public class ManageLogServiceImpl implements IManageLogService {

    @Resource
    private LogMapper logMapper;

    @Override
    public DTPageInfo<LogVO> queryLog(HttpSession httpSession, int draw, int start, int length, String operator, String startTime, String endTime) {
        //分页
        Page<LogVO> page = PageHelper.startPage(start, length);

        //创建map对象，封装查询条件，作为动态sql语句的参数
        Map<String, Object> map = new HashMap<>(3);
        map.put("operator", operator);
        map.put("startTime", startTime);
        map.put("endTime", DateUtil.str2str2(endTime));

        //从session里取得隔离信息
        IsolationPO isolationPO = (IsolationPO) httpSession.getAttribute("isolationPO");
        map.put("isolationId", isolationPO.getIsolationId());
        map.put("tagId", isolationPO.getTagId());

//        学校，工会
        if (isolationPO.getTagId() != null) {
            map.put("isolationType", 2);
//         区级 + 乡镇级
        } else if (isolationPO.getIsolationId() >= 2) {
            map.put("isolationType", 1);
//         市级
        } else {
            map.put("isolationType", 0);
        }

        //联表查询日志数据，转换返回结果
        List<LogBO> bos = logMapper.queryAll(map);
        List<LogVO> vos = new ArrayList<>();
        for (LogBO bo : bos) {
            LogVO vo = new LogVO();
            vo.setOperateTime(bo.getCreateTime());
            vo.setOperator(bo.getUsername());
            vo.setIsolation(bo.getIsolation());
            vo.setDescription(bo.getDescription());
            vo.setUrl(bo.getUrl());
            vos.add(vo);
        }
        return new DTPageInfo<>(draw, page.getTotal(), vos);
    }
}
