package top.forforever.dao;

import top.forforever.entity.Admin;

import java.util.List;

/**
 * @create: 2023/1/20
 * @Description:
 * @FileName: AdminDao
 * @自定义内容：
 */
public interface AdminDao extends BaseDao<Admin>{
    //查询所有经纪人
    List<Admin> findAll();

    Admin getAdminByUserName(String username);
}
