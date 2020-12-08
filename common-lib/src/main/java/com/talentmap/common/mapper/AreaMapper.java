package com.talentmap.common.mapper;

import com.talentmap.common.pojo.AreaPO;
import org.apache.ibatis.annotations.Mapper;

/**
 * AreaMapper继承基类
 */
@Mapper
public interface AreaMapper extends BaseMapper<AreaPO, Long> {
}