package com.talentmap.web.controller;

import com.talentmap.common.utils.DTPageInfo;
import com.talentmap.common.vo.ResultVO;
import com.talentmap.web.dto.UserDTO;
import com.talentmap.web.service.IManageUserService;
import com.talentmap.web.vo.UserVO;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

/**
 * @Author：dangyi
 * @Date: Created in 2020/2/28 15:19
 * @Description: 用户管理
 */
@RestController
@RequestMapping("manageUser")
public class ManageUserController {

    @Resource
    private IManageUserService manageUserService;

    /**
     * 查询用户
     */
    @RequestMapping("queryUser")
    public DTPageInfo<UserVO> queryUser(HttpSession session,
                                        @RequestParam(value = "draw", defaultValue = "1") int draw,
                                        @RequestParam(value = "start", defaultValue = "1") int start,
                                        @RequestParam(value = "length", defaultValue = "10") int length,
                                        @RequestParam(value = "username", required = false) String username,
                                        @RequestParam(value = "roleId", required = false) Long roleId
    ) {
        return manageUserService.queryUser(session, draw, start, length, username, roleId);
    }


    /**
     * 查询用户：根据userId
     */
    @RequestMapping("queryUserByUserId")
    public ResultVO queryUserByUserId(Long userId) {
        return manageUserService.queryUserByUserId(userId);
    }

    /**
     * 根据编辑获取的UserId查询用户的信息，以此自动填充
     */
    @RequestMapping("queryUserInfoByEditUserId")
    public ResultVO queryUserInfoByEditUserId(Long userId) {
        return manageUserService.queryUserByEditUserId(userId);
    }

    /**
     * 编辑用户：创建/修改
     */
    @RequestMapping("editUser")
    public ResultVO editUser(UserDTO dto, HttpSession session) {
        return manageUserService.editUser(dto, session);
    }

    /**
     * 修改用户密码
     */
    @RequestMapping("updateUserPwd")
    public ResultVO updateUserPwd(@RequestParam("userId") long userId,
                                  @RequestParam(value = "password") String password,
                                  HttpSession session){
        return manageUserService.updateUserPwd(userId,password,session);
    }


    /**
     * 删除用户：修改dr=2
     */
    @RequestMapping("deleteUser")
    public ResultVO deleteUser(@RequestParam("userId") long userId, HttpSession session) {
        return manageUserService.deleteUser(userId, session);
    }

    /**
     * 查询区域名
     */
    @RequestMapping("queryArea")
    public ResultVO queryArea() {
        return manageUserService.queryArea();
    }


    /**
     *
     *用户创建初始化
     * @param session
     * @return 一组信息
     */
    @ResponseBody
    @RequestMapping("userCreateInitial")
    public ResultVO userCreateInitial(HttpSession session) {
        return new ResultVO(1000, manageUserService.userCreateInitial(session));
    }


    /**
     *
     * 用户创建查找儿子的隔离信息
     * @param isolationId
     * @return 多组隔离信息
     */
    @ResponseBody
    @RequestMapping("findIsolation")
    public ResultVO findIsolation(@RequestParam("isolationId") long isolationId) {
        return new ResultVO(1000, manageUserService.findIsolation(isolationId));
    }


    /**
     *
     * 用户创建查找爹的隔离信息
     * @param isolationId
     * @return 多组隔离信息
     */
    @ResponseBody
    @RequestMapping("findParent")
    public ResultVO findParent(@RequestParam("isolationId") long isolationId) {
        return new ResultVO(1000, manageUserService.findParent(isolationId));
    }

    /**
     * 根据隔离id，返回隔离id对应的area Name
     * url：/talentmanager/manageUser/findIsolationName
     * @param isolationId
     * @return
     */
    @ResponseBody
    @RequestMapping("findIsolationName")
    public ResultVO findIsolationName(@RequestParam("isolationId") long isolationId) {
        return  new ResultVO(1000, manageUserService.findIsolationName(isolationId));
    }
}
