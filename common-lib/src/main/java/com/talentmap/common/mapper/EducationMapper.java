package com.talentmap.common.mapper;

import com.talentmap.common.pojo.EducationPO;
import org.apache.ibatis.annotations.Mapper;

/**
 * EducationMapper继承基类
 */
@Mapper
public interface EducationMapper extends BaseMapper<EducationPO, Integer> {
}