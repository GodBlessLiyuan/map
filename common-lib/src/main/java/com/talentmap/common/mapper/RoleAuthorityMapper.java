package com.talentmap.common.mapper;

import com.talentmap.common.pojo.RoleAuthorityPO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * RoleAuthorityMapper继承基类
 */
@Mapper
public interface RoleAuthorityMapper extends BaseMapper<RoleAuthorityPO, Long> {
    List<RoleAuthorityPO> queryByRoleId(long roleId);

    int insertBatch(List<RoleAuthorityPO> roleAuthorityPOS);

    int updateBatch(List<RoleAuthorityPO> newRoleAuthorityPOS);

    int deleteByRoleId(long roleId);
}