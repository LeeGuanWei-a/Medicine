package cn.com.sise.interceptor;

import cn.com.sise.pojo.Admin;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginInterceptor implements HandlerInterceptor {

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
        System.out.println("---调用LoginInterceptor的afterCompletion()方法---");
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        System.out.println("---调用LoginInterceptor的postHandle()方法---");
    }

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        System.out.println("---调用LoginInterceptor的preHandle()方法---");
        String url = request.getRequestURI();
        System.out.println(url);
        if (url.indexOf("/login") >= 0 || url.indexOf("/loginServlet") >= 0 ||
                url.indexOf("/code.jsp") >= 0 ||url.indexOf("/verificationCodeServlet") >= 0){
            System.out.println("在登陆，过滤器返回true");
            return true;
        }
        HttpSession session = request.getSession();
        Admin user = (Admin) session.getAttribute("user");
        if (user != null){
            System.out.println("已登录，过滤器返回true");
            return true;
        }
        System.out.println("过滤器返回false");
        request.getRequestDispatcher("/login.jsp").forward(request,response);
        return false;
    }
}


