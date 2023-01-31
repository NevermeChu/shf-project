package top.forforever.service;

import top.forforever.entity.Admin;

import java.util.List;

/**
 * @create: 2023/1/20
 * @Description:
 * @FileName: AdminService
 * @自定义内容：
 */
public interface AdminService extends BaseService<Admin>{
    //查询所有经纪人
    List<Admin> findAll();

    //根据用户名查询用户信息
    Admin getAdminByUserName(String username);
}
