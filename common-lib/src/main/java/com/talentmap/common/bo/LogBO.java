package com.talentmap.common.bo;

import lombok.Data;

import java.util.Date;

/**
 * @Author：dangyi
 * @Date: Created in 2020/2/28 21:45
 * @Description:
 */
@Data
public class LogBO {
    private Date createTime;

    private String username;

    private String isolation;

    private String description;

    private String url;
}
