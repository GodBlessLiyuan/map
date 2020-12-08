package com.talentmap.common.mapper;

import com.talentmap.common.pojo.TagPO;
import org.apache.ibatis.annotations.Mapper;

import java.util.HashMap;

/**
 * TagMapper继承基类
 */
@Mapper
public interface TagMapper extends BaseMapper<TagPO, Long> {
    /**
     * 根据tagName返回组织部/学校/商会信息
     * @param tagName
     * @return
     */
    HashMap<String, Object> selectByName(String tagName);

    /**
     * 创建，返回主键id
     * @param tagPO
     * @return
     */
    Long addTag(TagPO tagPO);
}