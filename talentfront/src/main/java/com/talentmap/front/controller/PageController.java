package com.talentmap.front.controller;

import com.talentmap.common.vo.ResultVO;
import com.talentmap.front.service.ITalentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * @author: dangyi
 * @date: Created in 2020/02/25
 * @description: 页面导航
 */
@Controller
public class PageController {
    @Autowired
    private ITalentService iTalentService;
    @Value("${config.baidu.mapkey}")
    private String mapkey;

    /**
     * 主页
     */
    @GetMapping("main")
    public String main(HttpSession session, ModelMap map, HttpServletRequest request){
        Object res = session.getAttribute("preloadershow");
        String userAgent = request.getHeader("user-agent");
        map.put("baiduAK",mapkey);
        if(res==null){
            map.put("preloader",true);
            session.setAttribute("preloadershow",true);
        }else {
            map.put("preloader",false);
        }


        if (userAgent.indexOf("Android") != -1 || userAgent.indexOf("iPhone") != -1 || userAgent.indexOf("iPad") != -1 ){
           return "main_mobile_index"; // 暂时指向手机端页面
        }else{
          return "main_index"; // PC端页面
      }

    }

    /**
     * 登录页面
     */
    @RequestMapping("login")
    public String index(HttpSession session){
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
    public String root(HttpSession session){
        //免密登录判断
        if (null != session.getAttribute("phone")) {
            return "redirect:/main";
        }
        return "login_index";
    }

    /**
     * 著名乡贤详情页面
     */
    @GetMapping("famousDetail")
    public String famousDetail(@RequestParam(value = "tfId")Long tfsId, ModelMap map){
        if (tfsId != null) {
            map.put("res",new ResultVO<>(1000, iTalentService.famousDetail(tfsId)));
        }else{
            map.put("res", new ResultVO<>(1000));
        }
        return "famous_index";
    }

//    /**
//     * 著名乡贤详情页面
//     */
//    @ResponseBody
//    @GetMapping("famousD")
//    public HashMap<String, Object> famousD(@RequestParam(value = "tfId")Long tfsId){
//        return iTalentService.famousDetail(tfsId);
//    }

    /**
     * 人才信息页面
     * @author: liuyongkun
     */
    @RequestMapping("talent")
    public String talent(HttpSession session){
        return "talent_mobile_index";
    }

}
