package com.talentmap.web.vo;

import lombok.Data;

import java.io.Serializable;

/**
 * @author: xiahui
 * @date: Created in 2020/3/4 16:40
 * @description: 批量导入返回结果
 * @version: 1.0
 */
@Data
public class ImportVO implements Serializable {
    private static final long SerialVersionUID = 1L;

    private Integer total;
    private Integer success;
    private Integer duplicate;
    private String dupUrl;
}
