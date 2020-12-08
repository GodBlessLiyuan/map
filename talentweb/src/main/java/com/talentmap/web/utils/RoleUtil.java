package com.talentmap.web.utils;

import com.talentmap.common.pojo.AuthorityPO;
import com.talentmap.common.pojo.RoleAuthorityPO;
import com.talentmap.common.pojo.RolePO;
import com.talentmap.web.dto.ConfigRoleAuthorityDTO;
import com.talentmap.web.vo.RoleAuthorityVO;
import com.talentmap.web.vo.RoleNameListVO;

import java.util.ArrayList;
import java.util.List;

/**
 * @Author：dangyi
 * @Date: Created in 2020/2/26 20:17
 * @Description:
 */
public class RoleUtil {

    /**
     * 点击【系统管理--角色管理】，返回现有所有角色名称列表
     */
    public static List<RoleNameListVO> buildRoleNameListVOS(List<RolePO> rolePOS) {
        List<RoleNameListVO> list = new ArrayList<>();
        for (RolePO po : rolePOS) {
            RoleNameListVO vo = new RoleNameListVO();
            vo.setRoleId(po.getRoleId());
            vo.setRoleName(po.getRoleName());
            vo.setDescription(po.getDescription());
            list.add(vo);
        }
        return list;
    }


    /**
     * 进入角色管理模块，点击某一角色名称，返回该角色所享有权限
     */
    public static RoleAuthorityVO buildRoleAuthorityVO(List<RoleAuthorityPO> pos) {
        RoleAuthorityVO vo = new RoleAuthorityVO();
        for (RoleAuthorityPO po : pos) {
            switch (po.getAuthorityName()) {
                case "roleQuery": vo.setRole_query(po.getStatus());break;
                case "roleCreate": vo.setRole_create(po.getStatus());break;
                case "roleUpdate": vo.setRole_update(po.getStatus());break;
                case "roleDelete": vo.setRole_delete(po.getStatus());break;
                case "userQuery": vo.setUser_query(po.getStatus());break;
                case "userCreate": vo.setUser_create(po.getStatus());break;
                case "userUpdate": vo.setUser_update(po.getStatus());break;
                case "userDelete": vo.setUser_delete(po.getStatus());break;
                case "logQuery": vo.setLog_query(po.getStatus());break;
                case "logDownload": vo.setLog_download(po.getStatus());break;
                case "generalTalentQuery": vo.setGeneral_query(po.getStatus());break;
                case "generalTalentCreateSingle": vo.setGeneral_single(po.getStatus());break;
                case "generalTalentCreateBatch": vo.setGeneral_batch(po.getStatus());break;
                case "generalTalentExport": vo.setGeneral_export(po.getStatus());break;
                case "generalTalentUpdate": vo.setGeneral_update(po.getStatus());break;
                case "generalTalentDelete": vo.setGeneral_delete(po.getStatus());break;
                case "showQuery": vo.setShow_query(po.getStatus());break;
                case "showCreate": vo.setShow_create(po.getStatus());break;
                case "showUpdate": vo.setShow_update(po.getStatus());break;
                case "showDelete": vo.setShow_delete(po.getStatus());break;
                case "showSort": vo.setShow_sort(po.getStatus());break;
                case "videoQuery": vo.setVideo_query(po.getStatus());break;
                case "videoUpload": vo.setVideo_upload(po.getStatus());break;
            }
        }
        return vo;
    }


    /**
     * 创建角色伊始，所有权限关闭
     */
    public static List<RoleAuthorityPO> buildRoleAuthorityPOS(Long roleId, List<AuthorityPO> authorityPOS) {
       List<RoleAuthorityPO> lists = new ArrayList<>();
       for (AuthorityPO authorityPO : authorityPOS) {
            RoleAuthorityPO po = new RoleAuthorityPO();
            po.setRoleId(roleId);
            po.setAuthorityId(authorityPO.getAuthorityId());
            po.setAuthorityName(authorityPO.getAuthorityName());
            po.setStatus((byte)1);
            lists.add(po);
        }
        return lists;
    }


    /**
     * 配置角色权限：构建t_role_authority数据对象
     */
    public static List<RoleAuthorityPO> buildConfigRoleAuthorityPOS(List<RoleAuthorityPO> roleAuthorityPOS, ConfigRoleAuthorityDTO dto) {
        for (RoleAuthorityPO po : roleAuthorityPOS) {
            switch (po.getAuthorityName()) {
                case "roleQuery": po.setStatus(dto.getRole_query());break;
                case "roleCreate": po.setStatus(dto.getRole_create());break;
                case "roleUpdate": po.setStatus(dto.getRole_update());break;
                case "roleDelete": po.setStatus(dto.getRole_delete());break;
                case "userQuery": po.setStatus(dto.getUser_query());break;
                case "userCreate": po.setStatus(dto.getUser_create());break;
                case "userUpdate": po.setStatus(dto.getUser_update());break;
                case "userDelete": po.setStatus(dto.getUser_delete());break;
                case "logQuery": po.setStatus(dto.getLog_query());break;
                case "logDownload": po.setStatus(dto.getLog_download());break;
                case "generalTalentQuery": po.setStatus(dto.getGeneral_query());break;
                case "generalTalentCreateSingle": po.setStatus(dto.getGeneral_single());break;
                case "generalTalentCreateBatch": po.setStatus(dto.getGeneral_batch());break;
                case "generalTalentExport": po.setStatus(dto.getGeneral_export());break;
                case "generalTalentUpdate": po.setStatus(dto.getGeneral_update());break;
                case "generalTalentDelete": po.setStatus(dto.getGeneral_delete());break;
                case "showQuery": po.setStatus(dto.getShow_query());break;
                case "showCreate": po.setStatus(dto.getShow_create());break;
                case "showUpdate": po.setStatus(dto.getShow_update());break;
                case "showDelete": po.setStatus(dto.getShow_delete());break;
                case "showSort": po.setStatus(dto.getShow_sort());break;
                case "videoQuery": po.setStatus(dto.getVideo_query());break;
                case "videoUpload": po.setStatus(dto.getVideo_upload());break;
            }
        }
        return roleAuthorityPOS;
    }
}
