package com.talentmap.common.bo;

import lombok.Data;

/**
 * @Author：dangyi
 * @Date: Created in 2020/2/28 17:08
 * @Description:
 */
@Data
public class UserBO {
    private Long userId;
    private String username;
    private String phone;
    private String roleName;
    private String areaName;
    private String extra;
}
