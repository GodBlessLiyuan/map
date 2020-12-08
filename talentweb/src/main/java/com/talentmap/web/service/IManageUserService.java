package com.talentmap.web.service;

import com.talentmap.common.utils.DTPageInfo;
import com.talentmap.common.vo.ResultVO;
import com.talentmap.web.dto.UserDTO;
import com.talentmap.web.vo.UserVO;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;

/**
 * @Author：dangyi
 * @Date: Created in 2020/2/28 15:38
 * @Description:
 */
public interface IManageUserService {
    DTPageInfo<UserVO> queryUser(HttpSession session, int draw, int start, int length, String username, long roleId);

    ResultVO editUser(UserDTO dto, HttpSession session);

    ResultVO deleteUser(long userId, HttpSession session);

    ResultVO queryArea();

    ResultVO queryUserByUserId(Long userId);

    ResultVO queryUserByEditUserId(Long userId);

    HashMap<String, Object> userCreateInitial(HttpSession session);

    List<HashMap<String, Object>> findIsolation(Long isolationId);

    HashMap<String, Object> findParent(Long isolationId);

    String findIsolationName(Long isolationId);

    ResultVO updateUserPwd(long userId,String password,HttpSession session);
}
