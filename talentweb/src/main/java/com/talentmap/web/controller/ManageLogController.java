package com.talentmap.web.controller;

import com.talentmap.common.utils.DTPageInfo;
import com.talentmap.web.service.IManageLogService;
import com.talentmap.web.vo.LogVO;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

/**
 * @Author：dangyi
 * @Date: Created in 2020/2/28 20:50
 * @Description: 用户操作日志
 */
@RestController
@RequestMapping("manageLog")
public class ManageLogController {

    @Resource
    private IManageLogService manageLogService;

    @RequestMapping("queryLog")
    public DTPageInfo<LogVO> queryUser(HttpSession httpSession,
                                       @RequestParam(value = "draw", defaultValue = "1") int draw,
                                       @RequestParam(value = "start", defaultValue = "1") int start,
                                       @RequestParam(value = "length", defaultValue = "10") int length,
                                       @RequestParam(value = "operator", required = false) String operator,
                                       @RequestParam(value = "startTime", required = false) String startTime,
                                       @RequestParam(value = "endTime", required = false) String endTime
    ) {
        return manageLogService.queryLog(httpSession, draw, start, length, operator, startTime, endTime);
    }
}
