package com.talentmap.common.mapper;

import com.talentmap.common.bo.LogBO;
import com.talentmap.common.pojo.LogPO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

/**
 * LogMapper继承基类
 */
@Mapper
public interface LogMapper extends BaseMapper<LogPO, Long> {
    List<LogBO> queryAll(Map<String, Object> map);
}