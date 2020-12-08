package com.talentmap.web.service;

import com.talentmap.web.vo.EducationVO;

import java.util.List;

/**
 * @author: xiahui
 * @date: Created in 2020/3/3 11:10
 * @description: TODO
 * @version: 1.0
 */
public interface IEducationService {
    /**
     * 查询所有
     *
     * @return
     */
    List<EducationVO> queryAll();
}
