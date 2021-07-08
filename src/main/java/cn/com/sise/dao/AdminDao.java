package cn.com.sise.dao;

import cn.com.sise.pojo.Admin;

public interface AdminDao {
    //检测用户登录信息的合法性
    public Admin checkUser(Admin admin)throws Exception;

    public int pwdUpdate(Admin a);
}
