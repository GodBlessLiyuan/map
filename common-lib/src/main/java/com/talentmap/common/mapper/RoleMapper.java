package com.talentmap.common.mapper;

import com.talentmap.common.pojo.RolePO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * RoleMapper继承基类
 */
@Mapper
public interface RoleMapper extends BaseMapper<RolePO, Long> {
    int queryRoleNameCount(String roleName);

    List<RolePO> queryAll();
}