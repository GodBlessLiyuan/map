package com.talentmap.web.service;

import com.talentmap.common.utils.DTPageInfo;
import com.talentmap.web.vo.LogVO;

import javax.servlet.http.HttpSession;

/**
 * @Author：dangyi
 * @Date: Created in 2020/2/28 20:59
 * @Description:
 */
public interface IManageLogService {
    DTPageInfo<LogVO> queryLog(HttpSession httpSession, int draw, int start, int length, String operator, String startTime, String endTime);
}
