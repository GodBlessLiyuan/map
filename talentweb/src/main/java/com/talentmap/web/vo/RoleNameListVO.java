package com.talentmap.web.vo;

import lombok.Data;

/**
 * @Author：dangyi
 * @Date: Created in 2020/2/27 16:03
 * @Description: 点击【系统管理--角色管理】，获取该数据
 */
@Data
public class RoleNameListVO {
    private long roleId;
    private String roleName;
    private String description;
}
