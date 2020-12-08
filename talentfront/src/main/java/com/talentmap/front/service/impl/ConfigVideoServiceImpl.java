package com.talentmap.front.service.impl;

import com.talentmap.common.mapper.VideoMapper;
import com.talentmap.common.pojo.VideoPO;
import com.talentmap.common.vo.ResultVO;
import com.talentmap.front.service.IConfigVideoService;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * @author ChenXU
 * @version 1.0
 * @date Created in 2020/03/10 11:16
 * @description 人才地图前端模块
 */
@Service
public class ConfigVideoServiceImpl implements IConfigVideoService {
    @Resource
    private VideoMapper videoMapper;
    @Value("${file.publicPath}")
    private String publicPath;
    /**
     * 查看视频
     */
    @Override
    public ResultVO queryVideo() {
        VideoPO po = videoMapper.queryVideo();
        if (po == null || po.getUrl() == null) {
            return new ResultVO(1001);
        }

        //拼接视频路径
        String url = publicPath + po.getUrl();
        return new ResultVO(1000, url);
    }
}
