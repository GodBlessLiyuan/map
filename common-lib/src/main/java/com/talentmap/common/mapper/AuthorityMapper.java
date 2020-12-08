package com.talentmap.common.mapper;

import com.talentmap.common.pojo.AuthorityPO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * AuthorityMapper继承基类
 */
@Mapper
public interface AuthorityMapper extends BaseMapper<AuthorityPO, Long> {
    List<AuthorityPO> queryAll();
}