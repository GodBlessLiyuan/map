package com.talentmap.common.mapper;

import com.talentmap.common.pojo.NaturePO;
import org.apache.ibatis.annotations.Mapper;

/**
 * NatureMapper继承基类
 */
@Mapper
public interface NatureMapper extends BaseMapper<NaturePO, Integer> {
}