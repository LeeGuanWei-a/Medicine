package cn.com.sise.dao.impl;

import cn.com.sise.dao.MedicineDao;
import cn.com.sise.pojo.Medicine;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.sql.SQLException;
import java.util.List;

@Repository("medicineDao")
public class MedicineDaoImpl implements MedicineDao {

    //定义JdbcTemplate属性及其getter和setter方法
    @Resource(name="jdbcTemplate")
    private JdbcTemplate jdbcTemplate;
    public JdbcTemplate getJdbcTemplate() {
        return jdbcTemplate;
    }
    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    //添加药品
    public int medicineInsert(Medicine medicine) throws Exception {
        String sql = "insert into tb_medicine(id,name,price,press,YB,pic) values(?,?,?,?,?,?)";
        Object[] params =new Object[]{medicine.getId(),medicine.getName(),medicine.getPrice(),medicine.getPress(),medicine.getYB(),medicine.getPic()};
        //执行SQL，获取返回结果
        int flag = this.jdbcTemplate.update(sql,params);
        return flag;
    }

    //删除药品
    public int medicineDelete(int id) throws Exception {
        String sql = "delete from tb_medicine where id=?";
        int flag = this.jdbcTemplate.update(sql, id);
        return flag;
    }

    //更新药品
    public int medicineUpdate(Medicine medicine) throws Exception {
        String sql = "update tb_medicine set name=?,price=?,press=?,YB=?,pic=? where id=?";

        Object[] params =new Object[]{medicine.getName(),medicine.getPrice(), medicine.getPress(),
                medicine.getYB(),medicine.getPic(),medicine.getId()};
        //执行SQL，获取返回结果
        int flag = this.jdbcTemplate.update(sql, params);
        return flag;
    }

    //查询所有药品
    public List<Medicine> queryAll() throws Exception {
        //定义SQL语句
        String sql = "select * from tb_medicine";
        RowMapper<Medicine> rowMapper = BeanPropertyRowMapper
                .newInstance(Medicine.class);
        //使用query方法执行查询，并返回一个集合
        return this.jdbcTemplate.query(sql, rowMapper);
    }

    //查询药品详情
    public Medicine queryMedicine(int id) throws Exception {
        String sql = "select * from tb_medicine where id=?";
        RowMapper<Medicine> rowMapper = BeanPropertyRowMapper
                .newInstance(Medicine.class);
        //使用queryForObject方法查询，返回单行记录
        return this.jdbcTemplate.queryForObject(sql, rowMapper, id);
    }

    @Override
    public List<Medicine> medicineSelect(String word) throws SQLException {
        //定义SQL语句
        String sql = "select * from tb_medicine where name like concat('%',?,'%')";
        RowMapper<Medicine> rowMapper = BeanPropertyRowMapper
                .newInstance(Medicine.class);
        //使用queryForObject方法查询，返回单行记录
        return this.jdbcTemplate.query(sql, rowMapper, word);
    }

}
