package com.talentmap.web.vo;

import lombok.Data;

import java.util.Date;

/**
 * @Author：dangyi
 * @Date: Created in 2020/2/28 20:54
 * @Description:
 */
@Data
public class LogVO {
    private Date operateTime;
    private String operator;
    private String isolation;
    private String description;
    private String url;
}
