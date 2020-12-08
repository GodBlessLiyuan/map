package com.talentmap.web.utils;

import com.talentmap.common.bo.UserBO;
import com.talentmap.common.constant.LoginConstant;
import com.talentmap.common.pojo.UserPO;
import com.talentmap.common.utils.Md5Util;
import com.talentmap.web.dto.UserDTO;
import com.talentmap.web.vo.UserVO;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @Author：dangyi
 * @Date: Created in 2020/2/28 17:23
 * @Description:
 */
public class UserUtil {

    /**
     * 点击【系统管理--用户管理】：构建查询用户的返回数据
     */
    public static List<UserVO> buildUserVOS(List<UserBO> userBOS) {
        List<UserVO> userVOS = new ArrayList<>();
        for (UserBO bo : userBOS) {
            UserVO vo = new UserVO();
            vo.setUserId(bo.getUserId());
            vo.setUsername(bo.getUsername());
            vo.setPhone(bo.getPhone());
            vo.setExtra(bo.getExtra());
            vo.setRoleName(bo.getRoleName());
            vo.setAreaName(bo.getAreaName());
            userVOS.add(vo);
        }
        return userVOS;
    }

    /**
     * 构建查询某个用户的返回数据
     */
    public static UserVO buildUserVO(UserPO po) {
        UserVO vo = new UserVO();
        vo.setUsername(po.getUsername());
        vo.setPhone(po.getPhone());
        vo.setExtra(po.getExtra());
        vo.setRoleId(po.getRoleId());
//        vo.setAreaId(po.getAreaId());
        return vo;
    }



    /**
     * 编辑：插入/更新，构建用户对象
     * @return
     */
    public static UserPO buildUserPO(UserPO po, UserDTO dto) {
        if (null == po) {
            po = new UserPO();
        }
        po.setUsername(dto.getUsername());
        po.setPhone(dto.getPhone());
        po.setDr((byte)1);
        po.setExtra(dto.getExtra());
        po.setRoleId(dto.getRoleId());
        po.setUpdateTime(new Date());
        po.setIsolationId(dto.getIsolationId());
        //对密码加盐处理
        String password = null;
        try {
            password = Md5Util.encodeByMd5(LoginConstant.SALT + dto.getPassword());
        } catch (Exception e) {
            e.printStackTrace();
        }
        po.setPassword(password);
        //判断角色是否是管理员，2为游客，写死在数据库
        if (dto.getRoleId() == 2) {
            po.setIsManager(false);
        } else {
            po.setIsManager(true);
        }
        return po;
    }
}
