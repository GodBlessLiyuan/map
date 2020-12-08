package com.talentmap.web.service.impl;

import com.talentmap.common.mapper.*;
import com.talentmap.common.pojo.*;
import com.talentmap.common.utils.LogUtil;
import com.talentmap.common.vo.ResultVO;
import com.talentmap.web.dto.ConfigRoleAuthorityDTO;
import com.talentmap.web.service.IManageRoleService;
import com.talentmap.web.utils.RoleUtil;
import com.talentmap.web.vo.RoleAuthorityVO;
import com.talentmap.web.vo.RoleNameListVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

/**
 * @Author：dangyi
 * @Date: Created in 2020/2/26 14:43
 * @Description:
 */
@Service
public class ManageRoleServiceImpl implements IManageRoleService {
    private final static Logger logger = LoggerFactory.getLogger(ManageRoleServiceImpl.class);

    @Resource
    private RoleAuthorityMapper roleAuthorityMapper;
    @Resource
    private RoleMapper roleMapper;
    @Resource
    private AuthorityMapper authorityMapper;
    @Resource
    private LogMapper logMapper;
    @Resource
    private UserMapper userMapper;

    /**
     * 查询现有角色的名称列表
     */
    @Override
    public ResultVO queryRoleNameList() {
        List<RolePO> rolePOS = roleMapper.queryAll();
        List<RoleNameListVO> roleNameListVOS = RoleUtil.buildRoleNameListVOS(rolePOS);
        return new ResultVO(1000, roleNameListVOS);
    }

    /**
     * 查询角色权限
     */
    @Override
    public ResultVO queryRoleAuthority(Long roleId) {
        //t_role_authority：查询该角色所拥有的权限
        List<RoleAuthorityPO> roleAuthorityPOS = roleAuthorityMapper.queryByRoleId(roleId);
        //构建返回结果
        RoleAuthorityVO vo = RoleUtil.buildRoleAuthorityVO(roleAuthorityPOS);
        return new ResultVO(1000, vo);
    }

    /**
     * 创建角色：不允许角色名重复
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public ResultVO createRole(HttpSession session, String roleName, String description) {
        //判断：若角色名重复，拒绝创建
        int roleNameCount = roleMapper.queryRoleNameCount(roleName);
        if (roleNameCount != 0) {
            return new ResultVO(1007, "角色名重复，创建失败");
        }

        //t_role：构建角色对象
        RolePO rolePO = new RolePO();
        rolePO.setRoleName(roleName);
        rolePO.setDescription(description);
        rolePO.setDr((byte)1);
        rolePO.setCreateTime(new Date());
        int result1 = roleMapper.insert(rolePO);
        if (result1 == 0) {
            LogUtil.log(logger, "createRole", "创建角色失败", rolePO);
        }

        //t_authority：从权限表查询所有权限名，每一条权限数据，就是一个对象
        List<AuthorityPO> authorityPOS = authorityMapper.queryAll();

        //t_role_authority：往角色权限表插入数据，多少个权限，就有多少个角色权限对象，批量插入
        List<RoleAuthorityPO> roleAuthorityPOS = RoleUtil.buildRoleAuthorityPOS(rolePO.getRoleId(), authorityPOS);
        int result2 = roleAuthorityMapper.insertBatch(roleAuthorityPOS);
        if (result2 == 0) {
            LogUtil.log(logger, "createRole", "批量插入角色权限数据失败", roleAuthorityPOS);
        }

        //t_log：插入数据，记录用户操作行为
        String descrip = "创建角色：" + roleName;
        int result3 = LogUtil.recordUserOperation(session, descrip, logMapper);
        if (result3 == 0) {
            LogUtil.log(logger, "createRole", "记录操作日志失败");
        }

        //返回结果
        return new ResultVO(1000);
    }

    /**
     * 配置角色权限：系统管理
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public ResultVO configRoleAuthoritySystem(HttpSession session, ConfigRoleAuthorityDTO dto) {

        //t_role_authority：根据roleId，查询出要进行修改的数据对象
        Long roleId = dto.getRoleId();
        List<RoleAuthorityPO> roleAuthorityPOS = roleAuthorityMapper.queryByRoleId(roleId);
        if (roleAuthorityPOS == null || roleAuthorityPOS.size() == 0) {
            return new ResultVO(1001, "应有但未查到");
        }

        //构建要修改的数据对象，批量修改数据
        List<RoleAuthorityPO> newRoleAuthorityPOS = RoleUtil.buildConfigRoleAuthorityPOS(roleAuthorityPOS, dto);
        int result1 = roleAuthorityMapper.updateBatch(newRoleAuthorityPOS);
        if (result1 == 0) {
            LogUtil.log(logger, "configRoleAuthoritySystem", "配置角色权限失败", newRoleAuthorityPOS);
        }

        //t_log：插入数据，记录用户操作行为
        String description = "修改了角色"+ queryRoleNameByRoleId(roleId) +"的权限";
        int result2 = LogUtil.recordUserOperation(session, description, logMapper);
        if (result2 == 0) {
            LogUtil.log(logger, "updateRole", "记录操作日志失败");
        }

        //返回结果
        return new ResultVO(1000);
    }

    /**
     * 删除角色：假删，将dr=2
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public ResultVO deleteRole(HttpSession session, long roleId) {

        //删除角色
        RolePO po = roleMapper.selectByPrimaryKey(roleId);
        if (po == null) {
            return new ResultVO(1001);
        }

        //t_user：如果有用户使用该角色，拒绝删除
        int userCount = userMapper.queryUserCountByRoleId(roleId);
        if (userCount != 0) {
            return new ResultVO(1004, "角色还在使用，拒绝删除");
        }

        po.setDr((byte)2);
        int result1 = roleMapper.updateByPrimaryKey(po);
        if (result1 == 0) {
            LogUtil.log(logger, "deleteRole", "删除角色失败", po);
        }

        //t_log：插入数据，记录用户操作行为
        String description = "删除了角色："+ queryRoleNameByRoleId(roleId);
        int result2 = LogUtil.recordUserOperation(session, description, logMapper);
        if (result2 == 0) {
            LogUtil.log(logger, "deleteRole", "记录操作日志失败");
        }

        //返回结果
        return new ResultVO(1000);
    }


    /**
     * 根据roleId，查询roleName
     */
    private String queryRoleNameByRoleId(long roleId) {
        RolePO po = roleMapper.selectByPrimaryKey(roleId);
        if (po == null) {
            return null;
        }
        return po.getRoleName();
    }
}
