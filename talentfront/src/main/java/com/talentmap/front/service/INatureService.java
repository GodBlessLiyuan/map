package com.talentmap.front.service;

import com.talentmap.front.vo.NatureVO;

import java.util.List;

/**
 * @author ChenXU
 * @version 1.0
 * @date Created in 2020/03/04 09:12
 * @description Nature枚举
 */
public interface INatureService {
    /**
     * 查询所有
     *
     * @return
     */
    List<NatureVO> queryAll();
}
