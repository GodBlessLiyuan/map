package com.talentmap.web.controller;

import com.talentmap.web.service.INatureService;
import com.talentmap.web.vo.NatureVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * @author: xiahui
 * @date: Created in 2020/2/28 17:07
 * @description: 人才性质
 * @version: 1.0
 */
@RequestMapping("nature")
@RestController
public class NatureController {
    @Autowired
    private INatureService service;

    @PostMapping("queryAll")
    public List<NatureVO> queryAll() {
        return service.queryAll();
    }
}
