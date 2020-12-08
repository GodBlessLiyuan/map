package com.talentmap.web.controller;

import com.talentmap.web.service.IEducationService;
import com.talentmap.web.vo.EducationVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * @author: xiahui
 * @date: Created in 2020/3/3 11:09
 * @description: TODO
 * @version: 1.0
 */
@RequestMapping("education")
@RestController
public class EducationController {
    @Autowired
    private IEducationService service;

    @PostMapping("queryAll")
    public List<EducationVO> queryAll() {
        return service.queryAll();
    }
}
