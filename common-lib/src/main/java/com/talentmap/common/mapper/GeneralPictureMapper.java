package com.talentmap.common.mapper;

import com.talentmap.common.pojo.GeneralPicturePO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * GeneralPictureMapper继承基类
 */
@Mapper
public interface GeneralPictureMapper extends BaseMapper<GeneralPicturePO, Long> {
    /**
     * 批量插入
     *
     * @param pos
     */
    void batchInsert(List<GeneralPicturePO> pos);

    /**
     * 批量删除
     *
     * @param delIds
     */
    void batchDelete(List<Long> delIds);
}