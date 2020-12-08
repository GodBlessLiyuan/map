package com.talentmap.web.controller;

import com.talentmap.common.constant.LoginConstant;
import com.talentmap.common.vo.ResultVO;
import com.talentmap.web.service.ILoginService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Map;
import java.util.Random;

/**
 * @Author：dangyi
 * @Date: Created in 2020/2/24 18:06
 * @Description: 人才地图后台管理系统登录
 */
@Controller
public class LoginController {

    @Resource
    private ILoginService loginService;

    /**
     * 用户登录
     */
    @RequestMapping("entry")
    public String login(HttpSession session,
                        HttpServletResponse response,
                        Map<String, Object> map,
                        @RequestParam(value = "phone", required = false) String phone,
                        @RequestParam(value = "password", required = false) String password,
                        @RequestParam(value = "checkCode",required = false) String checkCode
    ) {
        return this.loginService.login(session, response, map, phone, password, checkCode);
    }


    /**
     * 获取验证码
     * 进入登录页面后、点击登录按钮前，先访问此接口
     * 生成验证码：返回到登录页面给用户看的同时，也保存到session中
     */
    @RequestMapping("checkCode")
    public void checkCode(HttpServletResponse response, HttpSession session) throws IOException {
        //服务器通知浏览器不要缓存
        response.setHeader("pragma","no-cache");
        response.setHeader("cache-control","no-cache");
        response.setHeader("expires","0");

        //在内存中创建一个长80，宽45的图片
        int width = 80;
        int height = 45;
        BufferedImage image = new BufferedImage(width,height,BufferedImage.TYPE_INT_RGB);

        //获取画笔，设置画笔颜色，填充图片
        Graphics g = image.getGraphics();
        g.setColor(Color.GRAY);
        g.fillRect(0,0, width,height);

        //产生4个随机验证码，并放入session中
        String checkCode = getCode();
        session.setAttribute(LoginConstant.CHECK_CODE, checkCode);

        //设置画笔颜色，字体大小，将验证码写在图片上
        g.setColor(Color.WHITE);
        g.setFont(new Font("黑体",Font.ROMAN_BASELINE,22));
        g.drawString(checkCode,16,33);

        //将内存中的图片输出到浏览器
        ImageIO.write(image,"PNG",response.getOutputStream());
    }

    /**
     * 产生4位随机字符串
     */
    private String getCode() {
        String base = "0123456789ABCDEFGabcdefg";
        int size = base.length();
        Random r = new Random();
        StringBuffer sb = new StringBuffer();
        for(int i=1;i<=4;i++){
            //产生0到size-1的随机值
            int index = r.nextInt(size);
            //在base字符串中获取下标为index的字符
            char c = base.charAt(index);
            //将c放入到StringBuffer中去
            sb.append(c);
        }
        return sb.toString();
    }


    /**
     * 修改密码
     */
    @ResponseBody
    @PostMapping("updatePassword")
    public ResultVO updatePassword (HttpSession httpSession,
                                    @RequestParam("oldPassword") String oldPassword,
                                    @RequestParam("newPassword") String newPassword){
        return loginService.updatePassword(httpSession, oldPassword, newPassword);
    }


    /**
     * 退出登录
     */
    @GetMapping("logout")
    public String logout (HttpSession httpSession){
        return loginService.logout(httpSession);
    }
}
