package com.talentmap.common.pojo;

import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * t_user
 * @author 
 */
@Data
public class UserPO implements Serializable {
    private Long userId;

    private String username;

    private String phone;

    private String password;

    private Boolean isManager;

    private String extra;

    /**
     * 1未删除    2已删除
     */
    private Byte dr;

    private Date createTime;

    private Date updateTime;

    private Long roleId;

    private Long isolationId;

    private static final long serialVersionUID = 1L;
}