package com.talentmap.web.dto;

import lombok.Data;

/**
 * @Author：dangyi
 * @Date: Created in 2020/2/28 17:50
 * @Description:
 */
@Data
public class UserDTO {
    private Long userId;
    private String username;
    private String phone;
    private String password;
    private Long roleId;
    private String extra;
    private Long isolationId;
    private String tagName;
}
