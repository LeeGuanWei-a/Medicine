package cn.com.sise.dao.impl;

import cn.com.sise.dao.AdminDao;
import cn.com.sise.pojo.Admin;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;

@Repository("adminDao")
public class AdminDaoImpl implements AdminDao {

    //定义JdbcTemplate属性及其getter和setter方法
    @Resource(name = "jdbcTemplate")
    private JdbcTemplate jdbcTemplate;

    public JdbcTemplate getJdbcTemplate() {
        return jdbcTemplate;
    }

    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    // 检测用户登录信息的合法性
    public Admin checkUser(Admin admin) throws Exception {
        String sql = "select * from tb_admin where account=? and password=?";
        System.out.println(admin.toString());
        Object[] params=new Object[]{admin.getAccount(),admin.getPassword()};
        RowMapper<Admin> rowMapper= BeanPropertyRowMapper.newInstance(Admin.class);
        try{
            Admin adminResult = jdbcTemplate.queryForObject(sql,rowMapper,params);
            return adminResult;
        }catch (DataAccessException e){
            return null;
        }
    }

    @Override
    public int pwdUpdate(Admin a) {
        String sql = "update tb_admin set password=? where account=?";
        Object[] params =new Object[]{a.getPassword(),a.getAccount()};
        //执行SQL，获取返回结果
        System.out.println(a.getPassword()+a.getAccount());
        int flag = this.jdbcTemplate.update(sql, params);
        System.out.println(flag);
        return flag;
    }

}
