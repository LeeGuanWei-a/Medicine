package cn.com.sise.controller;

import cn.com.sise.dao.AdminDao;
import cn.com.sise.pojo.Admin;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@Controller
public class AdminController {
    @Resource
    private AdminDao adminDao;

    @RequestMapping(value="/login",method = RequestMethod.POST)
    public String loginCheck(Admin admin, String code, HttpSession session) throws Exception {
        String randStr = (String)session.getAttribute("randStr");
        //保存验证码正确与否
        String msg="";

        Admin result = adminDao.checkUser(admin);
        System.out.println(result);
        if (result!=null) {
            session.setAttribute("user", result);
            return "redirect:showAllMedicine";
        }else {
            return "redirect:login.jsp";
        }
    }

    @RequestMapping(value="/editPwd")
    public String editPwd(String old_pwd, String password, HttpSession session,  HttpServletResponse response) throws IOException {
        Admin a = (Admin)session.getAttribute("user");

        response.setContentType("text/html;charset=utf-8");
        if(old_pwd.equals(a.getPassword())){
            try {
                Admin new_a = new Admin();
                new_a.setAccount(a.getAccount());
                new_a.setPassword(password);
                adminDao.pwdUpdate(new_a);
                response.getWriter().write("<script>alert('修改成功！请重新登录');window.location.href='logout'</script>");
            } catch (Exception e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }else{
            response.getWriter().write("<script>alert('密码错误！');window.location.href='topwdUpdata'</script>");
        }
        return null;
    }

    @RequestMapping(value="/pwdUpdata")
    public String topwdUpdata() {
        return "pwdUpdata";
    }
    @RequestMapping(value="/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:login.jsp";
    }
}
