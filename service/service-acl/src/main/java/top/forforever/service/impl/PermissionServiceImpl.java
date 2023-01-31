package top.forforever.service.impl;

import com.alibaba.dubbo.config.annotation.Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;
import top.forforever.dao.BaseDao;
import top.forforever.dao.PermissionDao;
import top.forforever.dao.RolePermissionDao;
import top.forforever.entity.Permission;
import top.forforever.helper.PermissionHelper;
import top.forforever.service.PermissionService;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @create: 2023/1/28
 * @Description:
 * @FileName: PermissionServiceImpl
 * @自定义内容：
 */
@Service(interfaceClass = PermissionService.class)
@Transactional
public class PermissionServiceImpl extends BaseServiceImpl<Permission> implements PermissionService {

    @Autowired
    private PermissionDao permissionDao;

    @Autowired
    private RolePermissionDao rolePermissionDao;

    @Override
    protected BaseDao<Permission> getEntityDao() {
        return permissionDao;
    }

    @Override
    public List<Map<String, Object>> findPermissionByRoleId(Long roleId) {
        //获取所有权限
        List<Permission> permissionList = permissionDao.findAllPermissions();
        //根据用户id获取已分配的权限
        List<Long> permissionIds = rolePermissionDao.findPermissionByRoleId(roleId);
        //构建ztree数据
        //参考文档：http://www.treejs.cn/v3/demo.php#_201
        // { id:2, pId:0, name:"随意勾选 2", checked:true, open:true},
        List<Map<String,Object>> zNodes = new ArrayList<>();
        for (Permission permission : permissionList) {
            Map<String,Object> map = new HashMap();
            map.put("id",permission.getId());
            map.put("pId",permission.getParentId());
            map.put("name",permission.getName());
            if (permissionIds.contains(permission.getId())){
                map.put("checked",true);
            }
            zNodes.add(map);
        }
        return zNodes;
    }

    @Override
    public void saveRolePermissionRealtionShip(Long roleId, Long[] permissionIds) {
        //根据角色id删除已拥有的权限
        rolePermissionDao.deletePermissionByRoleId(roleId);
        //插入新分配的权限
        for (Long permissionId : permissionIds) {
            if (permissionId != null) {
                rolePermissionDao.saveRolePermission(roleId,permissionId);
            }
        }
    }

    //获取权限菜单列表
    @Override
    public List<Permission> findMenuPermissionByAdminId(Long adminId) {
        List<Permission> permissionList = null;
        //判断是否是超级管理员
        if (adminId == 1) {
            //获取所有权限
            permissionList = permissionDao.findAllPermissions();
        }else {
            permissionList = permissionDao.findMenuPermissonsByAdminId(adminId);
        }
        //把权限数据构建成树形结构数据
        List<Permission> zTreeResult = PermissionHelper.bulid(permissionList);
        return zTreeResult;
    }

    //获取所有权限列表
    @Override
    public List<Permission> findMenuAllPermissions() {
        List<Permission> permissions = permissionDao.findAllPermissions();
        if (CollectionUtils.isEmpty(permissions)) return null;
        //构建树形数据,总共三级
        //把权限数据构建成树形结构数据
        List<Permission> result = PermissionHelper.bulid(permissions);
        return result;
    }

    @Override
    public List<String> getPermissionCodeByAdminId(Long adminId) {
        List<String> permissionCodes = null;
        if (adminId == 1) {
            //系统管理员
            permissionCodes = permissionDao.findAllPermissionCodes();
        }else {
            //根据用户id查询权限
            permissionCodes = permissionDao.getPermissionCodeByAdminId(adminId);
        }
        return permissionCodes;
    }
}
