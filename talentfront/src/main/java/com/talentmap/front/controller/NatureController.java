package com.talentmap.front.controller;

import com.talentmap.front.service.INatureService;
import com.talentmap.front.vo.NatureVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * @author ChenXU
 * @version 1.0
 * @date Created in 2020/03/04 09:12
 * @description Nature枚举
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
