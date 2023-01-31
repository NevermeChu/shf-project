package top.forforever.service.impl;

import com.alibaba.dubbo.config.annotation.Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import top.forforever.dao.AdminRoleDao;
import top.forforever.dao.BaseDao;
import top.forforever.dao.RoleDao;
import top.forforever.dao.RolePermissionDao;
import top.forforever.entity.Role;
import top.forforever.service.RoleService;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @create: 2023/1/19
 * @Description:
 * @FileName: RoleServiceImpl
 * @自定义内容：
 */
@Service(interfaceClass = RoleService.class)
@Transactional
public class RoleServiceImpl extends BaseServiceImpl<Role> implements RoleService {

    @Autowired
    private RoleDao roleDao;

    @Autowired
    private AdminRoleDao adminRoleDao;

    @Override
    protected BaseDao<Role> getEntityDao() {
        return this.roleDao;

    }

    @Override
    public List<Role> findAll() {
        return roleDao.findAll();
    }

    @Override
    public Map<String, Object> getRolesByAdminId(Long adminId) {
        //获取所有角色
        List<Role> roleList = roleDao.findAll();
        //根据用户id获取该角色id
        List<Long> roleIds = adminRoleDao.getRoleIdsByAdminId(adminId);
        //创建list
        List<Role> noAssginRoleList = new ArrayList<>();//未分配的角色
        List<Role> assginRoleList = new ArrayList<>();//已分配的角色
        //遍历roleList，判断是否分配角色
        for (Role role : roleList) {
            //判断该用户的角色
            if (roleIds.contains(role.getId())){
                //已拥有的角色
                assginRoleList.add(role);
            }else {
                //未分配的角色
                noAssginRoleList.add(role);
            }
        }
        Map<String , Object> map = new HashMap<>();
        map.put("noAssginRoleList",noAssginRoleList);
        map.put("assginRoleList",assginRoleList);
        return map;
    }

    @Override
    public void assignRoleByAdminIdAndRoleIds(Long adminId, Integer[] roleIds) {
        //先删除已拥有的用户角色
        adminRoleDao.deleteRolesByAdminId(adminId);
        //根据roleIds依次插入数据
        for (Integer roleId : roleIds) {
            if (roleId != null) {
                adminRoleDao.insertRolesByAdminIdAndRoleId(adminId,roleId);
            }
        }
    }

}
