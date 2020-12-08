package com.talentmap.web.controller;

import com.talentmap.common.vo.ResultVO;
import com.talentmap.web.service.ITalentFocusService;
import com.talentmap.web.service.ITalentGeneralService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;

/**
 * @author xiahui
 * @version 1.0
 * @date Created in 2020/2/15 09:53
 * @description
 */
@Controller
public class PageController {
    @Autowired
    private ITalentGeneralService generalService;
    @Autowired
    private ITalentFocusService focusService;

    @Value("${file.publicPath}")
    private String publicPath;
    @Value("${file.generalTemplate}")
    private String generalTemplate;
    @Value("${file.focusTemplate}")
    private String focusTemplate;
    @Value("${config.baidu.mapkey}")
    private String mapkey;
    /**
     * 登录页面
     */
    @RequestMapping("login")
    public String index(HttpSession session) {
        //免密登录判断
        if (null != session.getAttribute("phone")) {
            return "redirect:/main";
        }
        return "login_index";
    }

    /**
     * 登录页面
     */
    @RequestMapping("/")
    public String root(HttpSession session) {
        //免密登录判断
        if (null != session.getAttribute("phone")) {
            return "redirect:/main";
        }
        return "login_index";
    }

    /**
     * 首页
     *
     * @return
     */
    @RequestMapping("main")
    public String main(ModelMap map) {
        map.put("baiduAK",mapkey);
        return "main_index";
    }

    /**
     * 一般乡贤人才
     *
     * @return
     */
    @RequestMapping("talentgeneral")
    public String talentGeneral(ModelMap map) {
        // 存放一般乡贤模板下载地址
        map.put("res", new ResultVO<>(1000, publicPath + generalTemplate));
        return "talent_general_index";
    }

    /**
     * 一般乡贤人才编辑
     *
     * @return
     */
    @RequestMapping("generaledit")
    public String generalEdit(HttpSession session, @RequestParam(value = "id", required = false) Long id, ModelMap map) {
        if (null != id) {
            map.put("res", generalService.queryById(session, id));
        } else {
            map.put("res", new ResultVO<>(1000));
        }
        return "talent_general_edit";
    }

    /**
     * 一般乡贤人才编辑
     *
     * @return
     */
    @RequestMapping("generallook")
    public String generalView(HttpSession session, @RequestParam(value = "id", required = false) Long id, ModelMap map) {
        if (null != id) {
            map.put("res", generalService.queryById(session, id));
        } else {
            map.put("res", new ResultVO<>(1000));
        }
        return "talent_general_view";
    }




    /**
     * 重点乡贤人才
     *
     * @return
     */
    @RequestMapping("talentfocus")
    public String talentFocus(ModelMap map) {
        // 存放一般乡贤模板下载地址
        map.put("res", new ResultVO<>(1000, publicPath + focusTemplate));
        return "talent_focus_index";
    }

    /**
     * 重点乡贤人才编辑
     *
     * @return
     */
    @RequestMapping("focusedit")
    public String focusEdit(HttpSession session, @RequestParam(value = "id", required = false) Long id, ModelMap map) {
        if (null != id) {
            map.put("res", generalService.queryById(session, id));
        } else {
            map.put("res", new ResultVO<>(1000));
        }
        return "talent_general_edit";
    }

    /**
     * 展示配置
     *
     * @return
     */
    @RequestMapping("talentfamous")
    public String talentFamous() {
        return "talent_famous_index";
    }


    /**
     * 系统管理--角色管理
     */
    @RequestMapping("manageRole")
    public String manageRole() {
        return "manage_role_index";
    }

    /**
     * 系统管理--用户管理
     */
    @RequestMapping("manageUser")
    public String manageUser() {
        return "manage_user_index";
    }

    /**
     * 系统管理--日志管理
     */
    @RequestMapping("manageLog")
    public String manageLog() {
        return "manage_log_index";
    }

    /**
     * 视频配置
     */
    @RequestMapping("configVideo")
    public String configVideo() {
        return "config_video_index";
    }
}
