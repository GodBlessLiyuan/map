package com.talentmap.common.pojo;

import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * t_log
 * @author 
 */
@Data
public class LogPO implements Serializable {
    private Long logId;

    private String description;

    private String url;

    private Date createTime;

    private Long userId;

    private Long isolationId;

    private static final long serialVersionUID = 1L;
}