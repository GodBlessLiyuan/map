package com.talentmap.web.controller;

import com.talentmap.common.vo.ResultVO;
import com.talentmap.web.service.IConfigVideoService;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;


/**
 * @Author：dangyi
 * @Date: Created in 2020/3/4 10:36
 * @Description: 视频配置
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

    /**
     * 编辑视频：只有一个视频，第一次上传，后续是更换
     */
    @RequestMapping("editVideo")
    public ResultVO editVideo(HttpSession session,
                              @RequestParam(value = "file") MultipartFile file) {
        return configVideo.editVideo(session, file);
    }
}
