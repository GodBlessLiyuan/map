package com.talentmap.front.filter;

import org.springframework.stereotype.Component;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * @author: dangyi
 * @date: Created in 16:59 2019/10/25
 * @description: 登录状态校验：登录失效，返回登录页面
 */
@Component
public class SessionFilter implements Filter {

//    private static final String CONTEXT_PATH = "/localtalents";
    //不需要登录就可以访问的路径，如登录页面
    String[] excludeUrls = new String[]{"/login", "/entry", "/checkCode", "/", "/favicon.ico"};
    List<String> excludeList = new ArrayList<>();

    public SessionFilter() {
        excludeList.add("/css/");
        excludeList.add("/fonts/");
        excludeList.add("/icons/");
        excludeList.add("/images/");
        excludeList.add("/js/");
        excludeList.add("/plugins/");
        excludeList.add("/actuator/");
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {

        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        HttpSession session = request.getSession(false);
        String uri = request.getRequestURI();

        //判断是否需对访问路径进行过滤
        boolean needFilter = isNeedFilter(uri);

        //不需过滤：放行
        if (!needFilter) {
            filterChain.doFilter(servletRequest, servletResponse);
        } else {
            //过滤：session中包含phone对象，说明是登录状态，放行
            if (session != null && session.getAttribute("phone") != null) {
                filterChain.doFilter(request, response);
             //过滤：不放行
            } else {
                //再判断：如果是ajax请求，不能重定向，只能给前端返回状态码，让前端去重定向到登录页面
                String requestType = request.getHeader("X-Requested-With");
                if (requestType != null && "XMLHttpRequest".equals(requestType)) {
                    response.setContentType("application/json; charset=utf-8");
                    response.getWriter().write("{\"code\": 1008}");
                 //再判断：不是ajax请求，直接重定向到登录页面
                } else {
                    response.sendRedirect(request.getContextPath() + "/login");
                }
                return;
            }
        }
    }

    /**
     * 判断是否需要过滤
     *
     * @param uri
     */
    public boolean isNeedFilter(String uri) {

        for (String exclude : excludeList) {
//            exclude = CONTEXT_PATH + exclude;
            if (uri.startsWith(exclude)) {
                return false;
            }
        }
        for (String excludeUrl : excludeUrls) {
//            excludeUrl = CONTEXT_PATH + excludeUrl;
            if (excludeUrl.equals(uri)) {
                return false;
            }
        }

        return true;
    }

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void destroy() {

    }
}
