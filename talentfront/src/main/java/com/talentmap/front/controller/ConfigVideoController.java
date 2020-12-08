package com.talentmap.front.controller;

import com.talentmap.common.vo.ResultVO;
import com.talentmap.front.service.IConfigVideoService;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

/**
 * @author ChenXU
 * @version 1.0
 * @date Created in 2020/03/10 11:19
 * @description 人才地图前台 查看视频
 */
@RestController
@RequestMapping("configVideo")
public class ConfigVideoController {

    @Resource
    private IConfigVideoService configVideo;

    /**
     * 查看视频
     */
    @RequestMapping("queryVideo")
    public ResultVO queryVideo() {
        return configVideo.queryVideo();
    }

}
