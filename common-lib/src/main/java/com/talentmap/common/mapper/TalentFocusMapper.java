package com.talentmap.common.mapper;

import com.talentmap.common.bo.TalentGenFocusBO;
import com.talentmap.common.pojo.TalentFocusPO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.HashMap;
import java.util.List;

/**
 * TalentFocusMapper继承基类
 */
@Mapper
public interface TalentFocusMapper extends BaseMapper<TalentFocusPO, Long> {


    /**
     * 重点乡贤查找
     * 前台：展示配置
     * @param hashMap
     * @return
     */
    List<HashMap<String, Object>> findFocus(HashMap<String, Object>hashMap);


    /**
     * 批量插入
     *
     * @param pos
     */
    void batchInsert(List<TalentFocusPO> pos);

    /**
     * 根据一般乡贤ID和隔离ID查询
     *
     * @param tgId
     * @param isolationId
     * @return
     */
    TalentFocusPO queryByTgIdAndIsoId(@Param("tgId") Long tgId, @Param("isolationId") Long isolationId);

    /**
     * 根据一般乡贤ID和隔离ID查询存在的tgId
     *
     * @param tgIds
     * @param isolationId
     * @return
     */
    List<Long> queryExistTgIds(@Param("tgIds") List<Long> tgIds, @Param("isolationId") Long isolationId);

    /**
     * 根据一般乡贤ID删除数据
     *
     * @param tgId
     */
    void deleteByTgId(Long tgId);

    List<TalentGenFocusBO> queryByIsoId(Long isolationId);

    void batchDel(List<TalentFocusPO> upFoucsPo);
}