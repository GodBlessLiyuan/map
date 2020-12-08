package com.talentmap.web.service.impl;

import com.github.pagehelper.Page;
import com.talentmap.common.bo.UserBO;
import com.talentmap.common.constant.LoginConstant;
import com.talentmap.common.mapper.*;
import com.talentmap.common.pojo.AreaPO;
import com.talentmap.common.pojo.IsolationPO;
import com.talentmap.common.pojo.TagPO;
import com.talentmap.common.pojo.UserPO;
import com.talentmap.common.utils.DTPageInfo;
import com.talentmap.common.utils.LogUtil;
import com.talentmap.common.utils.Md5Util;
import com.talentmap.common.utils.PageHelper;
import com.talentmap.common.vo.ResultVO;
import com.talentmap.web.dto.UserDTO;
import com.talentmap.web.service.IManageUserService;
import com.talentmap.web.utils.UserUtil;
import com.talentmap.web.vo.AreaVO;
import com.talentmap.web.vo.UserVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.*;

/**
 * @Author：dangyi
 * @Date: Created in 2020/2/28 15:39
 * @Description: 用户管理
 */
@Service
public class ManageUserServiceImpl implements IManageUserService {
    private final static Logger logger = LoggerFactory.getLogger(ManageUserServiceImpl.class);
    @Resource
    private UserMapper userMapper;
    @Resource
    private AreaMapper areaMapper;
    @Resource
    private LogMapper logMapper;
    @Autowired
    private IsolationMapper isolationMapper;
    @Autowired
    private TagMapper tagMapper;

    /**
     * 查询用户
     */
    @Override
    public DTPageInfo<UserVO> queryUser(HttpSession session, int draw, int start, int length, String username, long roleId) {
        //分页
        Page<UserVO> page = PageHelper.startPage(start, length);

        //创建map对象，封装查询条件，作为动态sql语句的参数
        Map<String, Object> map = new HashMap<>(2);
        map.put("username", username);
        map.put("roleId", roleId);

        //从session里取得隔离信息
        IsolationPO isolationPO = (IsolationPO) session.getAttribute("isolationPO");
        map.put("isolationId", isolationPO.getIsolationId());
        map.put("tagId", isolationPO.getTagId());

        //取得自己的角色id，用来sql判断是否是超管，非超管不得看到超管和游客
        Long myRoleId = (Long) session.getAttribute("roleId");
        map.put("myRoleId", myRoleId);

//        学校，工会
        if (isolationPO.getTagId() != null) {
            map.put("isolationType", 2);
//         区级 + 乡镇级
        } else if (isolationPO.getIsolationId() >= 2) {
            map.put("isolationType", 1);
//         市级
        } else {
            map.put("isolationType", 0);
        }

        //联表查询：t_user，t_role，t_area
        List<UserBO> userBOS = userMapper.queryAll(map);
        List<UserVO> userVOS = UserUtil.buildUserVOS(userBOS);
        return new DTPageInfo<>(draw, page.getTotal(), userVOS);
    }


    /**
     * 查询用户：根据userId
     */
    @Override
    public ResultVO queryUserByUserId(Long userId) {
        UserPO po = userMapper.selectByPrimaryKey(userId);
        UserVO vo = UserUtil.buildUserVO(po);
        return new ResultVO(1000, vo);
    }

    /**
     *查询信息，
     */
    public ResultVO queryUserByEditUserId(Long userId) {
        UserPO userPO = userMapper.selectByPrimaryKey(userId);
        return new ResultVO(1000, userPO);
    }
    /**
     * 编辑用户：创建用户，不允许手机号重复
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public ResultVO editUser(UserDTO dto, HttpSession session) {

        //判断：根据查的userPO是否为空，来判断是新建还是更新
        UserPO userPO = userMapper.selectByPrimaryKey(dto.getUserId());
        //判断：如果没给userId，即为新增用户，则不允许手机号重复
        if (userPO == null) {
            //新增用户
            int phoneCount = userMapper.queryPhoneCount(dto.getPhone());
            if (phoneCount != 0) {
                return new ResultVO(1007, "手机号重复");
            }
        } else {
            //不为空""用户更新，手机号可以不变，若变的话不允许重复
            int phoneCount = userMapper.queryPhoneCount(dto.getPhone());
            if (phoneCount != 0 && !dto.getPhone().equals(userPO.getPhone())) {
                return new ResultVO(1007, "手机号重复");
            }
        }

        //根据dto里的tagName是否为空，判断是否是要新增 还是 创建 学校/商会
        String tagName = dto.getTagName();
        if (tagName != null) {
            HashMap<String, Object> hashMap = tagMapper.selectByName(tagName);
            if (hashMap == null) {
                //不存在，需要重新创建，
                // 1. 用tagName新建tag表，
                // 2. 拿到tagId新建隔离表，
                // 3. 然后拿到隔离id放到dto里
                TagPO tagPO = new TagPO();
                tagPO.setName(tagName);
                tagMapper.addTag(tagPO);
                Long tagId = tagPO.getTagId();

                IsolationPO isolationPO = new IsolationPO();
                isolationPO.setTagId(tagId);
                isolationPO.setName(tagName);
                isolationMapper.addIsolation(isolationPO);
                Long isolationId = isolationPO.getIsolationId();

                dto.setIsolationId(isolationId);
            } else {
                //存在，找到隔离id，把隔离id放到dto里
                //BigInteger 转 Long
                dto.setIsolationId(Long.parseLong(hashMap.get("isolationId").toString()));
            }
        }
        //t_user
        UserPO newUserPO = UserUtil.buildUserPO(userPO, dto);
        int result1;
        if (null == userPO) {
            //新建
            newUserPO.setCreateTime(new Date());
            result1 = userMapper.insert(newUserPO);
        } else {
            /**
             * 如果需要给的密码是null，这里需要改成selective！！！！！！！！！！！！！！！！！！！！
             */
            //更新
            result1 = userMapper.updateByPrimaryKey(newUserPO);
        }
        if (result1 == 0) {
            LogUtil.log(logger, "createUser", "编辑用户失败", newUserPO);
        }


        //t_log：插入数据，记录用户操作行为
        String description;
        if (userPO == null) {
            description = "增加了 系统管理->用户管理的" + dto.getUsername() + "用户";
        } else {
            description = "修改了 系统管理->用户管理的" + dto.getUsername() + "用户";
        }
        int result2 = LogUtil.recordUserOperation(session, description, logMapper);
        if (result2 == 0) {
            LogUtil.log(logger, "editUser", "记录操作日志失败");
        }

        //返回结果
        return new ResultVO(1000);
    }

    /**
     * 修改用户密码
     */
    @Transactional(rollbackFor = Exception.class)
    public  ResultVO updateUserPwd(long userId,String password,HttpSession session){
        UserPO po = userMapper.selectByPrimaryKey(userId);
        //对密码加盐处理
        String passwordNew = null;
        try {
            passwordNew = Md5Util.encodeByMd5(LoginConstant.SALT + password);
        } catch (Exception e) {
            e.printStackTrace();
        }
        po.setPassword(passwordNew);
        int result1 = userMapper.updateByPrimaryKey(po);

        //t_log：插入数据，记录用户操作行为
        String description = "编辑了 系统管理->用户管理的：" + po.getUsername() + " 密码";
        int result2 = LogUtil.recordUserOperation(session, description, logMapper);
        if (result2 == 0) {
            LogUtil.log(logger, "updateUserPwd", "记录操作日志失败");
        }

        return new ResultVO(1000);
    }



    /**
     * 删除用户：修改dr=2
     */
    @Override
    public ResultVO deleteUser(long userId, HttpSession session) {
        UserPO po = userMapper.selectByPrimaryKey(userId);
        if (po == null) {
            return new ResultVO(1001);
        }

        //自己不能删除自己
        long currUserId = (long) session.getAttribute("userId");
        if (userId == currUserId) {
            return new ResultVO(1004, "自己不能删除自己");
        }

        //删除用户
        po.setDr((byte) 2);
        po.setUpdateTime(new Date());
        int result1 = userMapper.updateByPrimaryKey(po);
        if (result1 == 0) {
            LogUtil.log(logger, "deleteUser", "删除用户失败", po);
        }

        //t_log：插入数据，记录用户操作行为
        String description = "删除了 系统管理->用户管理的：" + po.getUsername() + " 用户";
        int result2 = LogUtil.recordUserOperation(session, description, logMapper);
        if (result2 == 0) {
            LogUtil.log(logger, "deleteUser", "记录操作日志失败");
        }

        return new ResultVO(1000);
    }

    /**
     * 查询区域名
     */
    @Override
    public ResultVO queryArea() {
        List<AreaPO> pos = areaMapper.queryAll();
        List<AreaVO> vos = new ArrayList<>();
        for (AreaPO po : pos) {
            AreaVO vo = new AreaVO();
//            vo.setAreaId(po.getAreaId());
            vo.setAreaName(po.getName());
            vos.add(vo);
        }
        return new ResultVO(1000, vos);
    }

    @Override
    public HashMap<String, Object> userCreateInitial(HttpSession session) {
        IsolationPO isolationPO = (IsolationPO) session.getAttribute("isolationPO");
        Long roleId = (Long) session.getAttribute("roleId");
        HashMap<String, Object> hashMap = isolationMapper.selectAreaName(isolationPO.getIsolationId());
        hashMap.put("roleId", roleId);
        return hashMap;
    }

    @Override
    public List<HashMap<String, Object>> findIsolation(Long isolationId) {
        ArrayList<HashMap<String, Object>> list = isolationMapper.selectByParent(isolationId);
        return list;
    }

    @Override
    public HashMap<String, Object> findParent(Long isolationId) {
        IsolationPO isolationPO = isolationMapper.selectByPrimaryKey(isolationId);
        HashMap<String, Object> hashMap = isolationMapper.selectAreaName(isolationPO.getBelongs());
        return hashMap;
    }

    @Override
    public String findIsolationName(Long isolationId) {
        String name = (String) isolationMapper.selectAreaName(isolationId).get("name");
        if (name == null || name == "") {
            name = isolationMapper.selectByPrimaryKey(isolationId).getName();
        }
        return name;
    }
}
