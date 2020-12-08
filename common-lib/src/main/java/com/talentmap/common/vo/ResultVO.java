package com.talentmap.common.vo;

import lombok.Data;

import java.io.Serializable;

/**
 * @author xiahui
 * @version 1.0
 * @date Created in 2020/2/11 15:36
 * @description
 */
@Data
public class ResultVO<T> implements Serializable {
    private static final long serialVersionUID = 1L;

    private Integer status;

    private T data;

    public ResultVO(Integer status) {
        this(status, null);
    }

    public ResultVO(Integer status, T data) {
        this.status = status;
        this.data = data;
    }
}
