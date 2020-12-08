package com.talentmap.common.mapper;

import com.talentmap.common.bo.UserBO;
import com.talentmap.common.pojo.UserPO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

/**
 * UserMapper继承基类
 */
@Mapper
public interface UserMapper extends BaseMapper<UserPO, Long> {
    UserPO queryByPhone(String phone);

    List<UserBO> queryAll(Map<String, Object> map);

    int queryPhoneCount(String phone);

    int queryUserCountByRoleId(Long roleId);
}
