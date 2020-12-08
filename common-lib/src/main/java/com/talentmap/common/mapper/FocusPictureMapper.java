package com.talentmap.common.mapper;

import com.talentmap.common.pojo.FocusPicturePO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * FocusPictureMapper继承基类
 */
@Mapper
public interface FocusPictureMapper extends BaseMapper<FocusPicturePO, Long> {
    /**
     * 批量插入
     *
     * @param pos
     */
    void batchInsert(List<FocusPicturePO> pos);

    /**
     * 批量删除
     *
     * @param delIds
     */
    void batchDelete(List<Long> delIds);
}