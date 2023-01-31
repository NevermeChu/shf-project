package top.forforever.dao;

import org.apache.ibatis.annotations.Param;
import top.forforever.entity.RolePermission;

import java.util.List;

/**
 * @create: 2023/1/28
 * @Description:
 * @FileName: RolePermissionDao
 * @自定义内容：
 */
public interface RolePermissionDao extends BaseDao<RolePermission>{
    //根据用户id获取已分配的权限
    List<Long> findPermissionByRoleId(Long roleId);

    //根据用户id删除权限
    void deletePermissionByRoleId(Long roleId);

    void saveRolePermission(@Param("roleId") Long roleId,
                            @Param("permissionId") Long permissionId);

}
