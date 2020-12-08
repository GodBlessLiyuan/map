package com.talentmap.common.mapper;

import com.talentmap.common.pojo.VideoPO;
import org.apache.ibatis.annotations.Mapper;

/**
 * VideoMapper继承基类
 */
@Mapper
public interface VideoMapper extends BaseMapper<VideoPO, Long> {
    VideoPO queryVideo();
}