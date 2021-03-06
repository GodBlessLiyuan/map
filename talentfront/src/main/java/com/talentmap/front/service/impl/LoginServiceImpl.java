package com.talentmap.front.service.impl;

import com.talentmap.common.constant.LoginConstant;
import com.talentmap.common.mapper.IsolationMapper;
import com.talentmap.common.mapper.UserMapper;
import com.talentmap.common.pojo.IsolationPO;
import com.talentmap.common.pojo.UserPO;
import com.talentmap.common.utils.LogUtil;
import com.talentmap.common.utils.Md5Util;
import com.talentmap.common.vo.ResultVO;
import com.talentmap.front.service.ILoginService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Map;

/**
 * @Author：dangyi
 * @Date: Created in 2020/2/24 20:09
 * @Description:
 */
@Service
public class LoginServiceImpl implements ILoginService {
    private final static Logger logger = LoggerFactory.getLogger(LoginServiceImpl.class);

    @Resource
    private UserMapper userMapper;
    @Autowired
    private IsolationMapper isolationMapper;

    @Override
    public String login(HttpSession session, HttpServletResponse response, Map<String, Object> result, String phone, String password, String checkCode) {

        //先校验验证码：从session中获取验证码
        String sessionCheckCode = (String) session.getAttribute(LoginConstant.CHECK_CODE);

        //验证码为空
//        if (checkCode == null || checkCode.length() < 1) {
//            result.put("msg", "验证码为空");
//            return "forward:/login";
//        }
//
//        //验证码获取失败
//        if (null == sessionCheckCode) {
//            //result.put("msg", "请重新获取验证码");
//            return "forward:/login";
//        }
//        //验证码错误
//        if (!sessionCheckCode.equalsIgnoreCase(checkCode)) {
//            result.put("msg", "验证码错误");
//            return "forward:/login";
//        }

        // 手机号码判空
        if( phone == null || phone == ""){
            result.put("msg", "手机号不能为空");
            return "forward:/login";
        }

        //再校验手机号码

        UserPO userPO = userMapper.queryByPhone(phone);
        //手机号错误
        if (null == userPO) {
            result.put("msg", "手机号错误");
            return "forward:/login";
        }


        //最后校验密码
        //先对输入的密码加盐加密，之后再与数据库对比
        if( password == null || password == ""){
            result.put("msg", "密码不能为空");
            return "forward:/login";
        }
        try {
            password = Md5Util.encodeByMd5(LoginConstant.SALT + password);
        } catch (Exception e) {
            e.printStackTrace();
            return "forward:login";
        }
        //密码错误
        if ( !password.equals(userPO.getPassword())) {
            result.put("msg", "密码错误");
            return "forward:/login";
        }


        if (checkCode == null || checkCode.length() < 1) {
            result.put("msg", "验证码不能为空");
            return "forward:/login";
        }

        //验证码获取失败
        if (null == sessionCheckCode) {
            //result.put("msg", "请重新获取验证码");
            return "forward:/login";
        }
        //验证码错误
        if (!sessionCheckCode.equalsIgnoreCase(checkCode)) {
            result.put("msg", "验证码错误");
            return "forward:/login";
        }



        //以上校验通过，登录成功：手机号存入session，设置有效时间
        session.setAttribute("username", userPO.getUsername());
        session.setAttribute("phone", phone);
        session.setMaxInactiveInterval(60 * 60 * 2);

        //查找隔离表信息和roleId，放到session中
        IsolationPO isolationPO = isolationMapper.selectByUser(userPO.getUserId());
        session.setAttribute("roleId", userPO.getRoleId());
        session.setAttribute("isolationPO", isolationPO);

        /**
         * 2小时内免密登录设置
         * 获取服务器自动为session对象所生成的ID，显式命名为JSESSIONID，创建成cookie对象
         * 设置该cookie对象的有效时间，与服务器中session对象的有效时间保持一致
         * 浏览器来访，就靠该JSESSIONID来服务器中寻找到唯一对应的session
         * 判断session中是否有phone，即可知道是否已登录，该判断放在sessionFilter中进行
         */
        String id = session.getId();
        Cookie cookie = new Cookie("JSESSIONID", id);
        cookie.setMaxAge(60 * 60 * 2);
        response.addCookie(cookie);

        return "redirect:/main";
    }

    @Override
    public ResultVO updatePassword(HttpSession session, String oldPassword, String newPassword) {

        //判断：从session中获取当前用户的phone
        String phone = (String) session.getAttribute("phone");
        if (null == phone) {
            return new ResultVO(1005, "登录状态已失效");
        }

        UserPO po = userMapper.queryByPhone(phone);
        if (null == po) {
            return new ResultVO(1001, "查询失败");
        }

        //先对输入的新、旧密码加盐处理
        try {
            oldPassword = Md5Util.encodeByMd5(LoginConstant.SALT + oldPassword);
            newPassword = Md5Util.encodeByMd5(LoginConstant.SALT + newPassword);
        } catch (Exception e) {
            e.printStackTrace();
        }

        //更新密码
        if (oldPassword.equals(po.getPassword())) {
            po.setPassword(newPassword);
            int result = userMapper.updateByPrimaryKey(po);
            if (result == 0) {
                LogUtil.log(logger, "updatePassword", "输入的旧密码正确，但仍旧更新失败", oldPassword, po.getPassword());
                return new ResultVO(1003, "更新失败");
            } else {
                return new ResultVO(1000);
            }
        } else {
            LogUtil.log(logger, "updatePassword", "输入的旧密码不正确", oldPassword, po.getPassword());
            return new ResultVO(1006, "输入的旧密码错误");
        }
    }

    @Override
    public String logout(HttpSession session) {
        session.removeAttribute("phone");
        session.removeAttribute("preloadershow");
        return "forward:/login";
    }
}
