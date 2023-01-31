package top.forforever.service.impl;


import com.alibaba.dubbo.config.annotation.Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import top.forforever.dao.AdminDao;
import top.forforever.dao.BaseDao;
import top.forforever.entity.Admin;
import top.forforever.service.AdminService;
import top.forforever.service.BaseService;

import java.util.List;

/**
 * @create: 2023/1/20
 * @Description:
 * @FileName: AdminServiceImpl
 * @自定义内容：
 */
@Service(interfaceClass = AdminService.class)
@Transactional
public class AdminServiceImpl extends BaseServiceImpl<Admin> implements AdminService {

    @Autowired
    private AdminDao adminDao;


    @Override
    protected BaseDao<Admin> getEntityDao() {
        return this.adminDao;
    }

    @Override
    public List<Admin> findAll() {
        return adminDao.findAll();
    }

    //根据用户名查询用户信息
    @Override
    public Admin getAdminByUserName(String username) {
        return adminDao.getAdminByUserName(username);
    }
}
