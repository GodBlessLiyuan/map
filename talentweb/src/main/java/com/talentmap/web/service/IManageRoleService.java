package com.talentmap.web.service;

import com.talentmap.common.vo.ResultVO;
import com.talentmap.web.dto.ConfigRoleAuthorityDTO;

import javax.servlet.http.HttpSession;

/**
 * @Author：dangyi
 * @Date: Created in 2020/2/26 14:42
 * @Description:
 */
public interface IManageRoleService {
    ResultVO queryRoleAuthority(Long roleId);

    ResultVO createRole(HttpSession session, String roleName, String description);

    ResultVO configRoleAuthoritySystem(HttpSession session, ConfigRoleAuthorityDTO dto);

    ResultVO deleteRole(HttpSession session, long roleId);

    ResultVO queryRoleNameList();
}
