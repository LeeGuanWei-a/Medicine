package cn.com.sise.dao;

import cn.com.sise.pojo.Medicine;

import java.sql.SQLException;
import java.util.List;

public interface MedicineDao {

    //添加新药品
    public int medicineInsert(Medicine medicine) throws Exception;

    //删除药品
    public int medicineDelete(int id) throws Exception;

    //修改药品
    public int medicineUpdate(Medicine medicine) throws Exception;

    //查询所有药品
    public List<Medicine> queryAll() throws Exception;

    //查看药品详情
    public Medicine queryMedicine(int id) throws Exception;

    //模糊查询药品
    public List<Medicine> medicineSelect(String word) throws SQLException;
}
