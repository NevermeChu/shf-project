package top.forforever.dao;

import top.forforever.entity.Permission;

import java.util.List;

/**
 * @create: 2023/1/28
 * @Description:
 * @FileName: PermissionDao
 * @自定义内容：
 */
public interface PermissionDao extends BaseDao<Permission>{
    List<Permission> findAllPermissions();

    List<Permission> findMenuPermissonsByAdminId(Long adminId);

    List<String> getPermissionCodeByAdminId(Long adminId);

    List<String> findAllPermissionCodes();
}
