package com.talentmap.web.service;

import com.talentmap.web.vo.NatureVO;

import java.util.List;

/**
 * @author: xiahui
 * @date: Created in 2020/2/28 17:10
 * @description: TODO
 * @version: 1.0
 */
public interface INatureService {
    /**
     * 查询所有
     *
     * @return
     */
    List<NatureVO> queryAll();
}
