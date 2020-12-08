package com.talentmap.common.mapper;

import com.talentmap.common.pojo.IsolationPO;
import org.apache.ibatis.annotations.Mapper;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 * IsolationMapper继承基类
 */
@Mapper
public interface IsolationMapper extends BaseMapper<IsolationPO, Long> {
    /**
     * ChenXU
     *
     * @param userId
     * @return IsolationPO
     */
    IsolationPO selectByUser(Long userId);

    ArrayList<HashMap<String, Object>> selectByParent(Long isolationId);

    /**
     * 创建用户时，第一次请求，根据隔离id查找对应的areaName
     *
     * @param isolationId
     * @return HashMap
     */
    HashMap<String, Object> selectAreaName(Long isolationId);

    /**
     * 根据现有隔离ID,查询自己及下级ID
     *
     * @param isolationId
     * @return
     */
    List<Long> queryIds(Long isolationId);

    /**
     * 创建，返回主键id
     * @param isolationPO
     * @return
     */
    Long addIsolation (IsolationPO isolationPO);

    List<Long>  queryByName(String sourceName);
}