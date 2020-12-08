package com.talentmap.web.controller;

import com.talentmap.common.vo.ResultVO;
import com.talentmap.web.dto.ConfigRoleAuthorityDTO;
import com.talentmap.web.service.IManageRoleService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

/**
 * @Author：dangyi
 * @Date: Created in 2020/2/26 14:35
 * @Description: 角色管理
 */
@RestController
@RequestMapping("manageRole")
public class ManageRoleController {

    @Resource
    private IManageRoleService manageRoleService;

    /**
     * 查询角色名称列表：点击【系统管理--角色管理】
     */
    @RequestMapping("queryRoleNameList")
    public ResultVO queryRoleNameList() {
        return manageRoleService.queryRoleNameList();
    }


    /**
     * 查询角色权限：点击【系统管理--角色管理--某角色】
     */
    @RequestMapping("queryRoleAuthority")
    public ResultVO queryRoleAuthority(@RequestParam("roleId")Long roleId) {
        return manageRoleService.queryRoleAuthority(roleId);
    }

    /**
     * 创建角色
     */
    @PostMapping("createRole")
    public ResultVO createRole(HttpSession session,
                               @RequestParam("roleName")String roleName,
                               @RequestParam("description")String description
    ) {
        return manageRoleService.createRole(session, roleName, description);
    }

    /**
     * 配置角色权限
     */
    @PostMapping("configRoleAuthority")
    public ResultVO configRoleAuthoritySystem(HttpSession session, ConfigRoleAuthorityDTO dto) {
        return manageRoleService.configRoleAuthoritySystem(session, dto);
    }

    /**
     * 删除角色
     */
    @PostMapping("deleteRole")
    public ResultVO deleteRole(HttpSession session,
                               @RequestParam("roleId")long roleId
    ) {
        return manageRoleService.deleteRole(session, roleId);
    }
}
