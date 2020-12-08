package com.talentmap.web.service;

import com.talentmap.common.vo.ResultVO;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Map;

/**
 * @Author：dangyi
 * @Date: Created in 2020/2/26 13:03
 * @Description:
 */
public interface ILoginService {
    String login(HttpSession session, HttpServletResponse response, Map<String, Object> result, String phone, String password, String checkCode);

    ResultVO updatePassword(HttpSession httpSession, String oldPassword, String newPassword);

    String logout(HttpSession httpSession);
}
