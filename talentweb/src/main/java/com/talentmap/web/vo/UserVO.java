package com.talentmap.web.vo;

import lombok.Data;

/**
 * @Author：dangyi
 * @Date: Created in 2020/2/28 15:23
 * @Description:
 */
@Data
public class UserVO {
    private Long userId;
    private String username;
    private String phone;
    private String roleName;
    private String areaName;
    private String extra;
    private Long roleId;
    private Long areaId;
}
