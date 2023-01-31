package top.forforever.service;

import top.forforever.entity.Permission;

import java.util.List;
import java.util.Map;

/**
 * @create: 2023/1/28
 * @Description:
 * @FileName: PermissionService
 * @自定义内容：
 */
public interface PermissionService extends BaseService<Permission>{

    List<Map<String, Object>> findPermissionByRoleId(Long roleId);

    void saveRolePermissionRealtionShip(Long roleId, Long[] permissionIds);

    List<Permission> findMenuPermissionByAdminId(Long adminId);

    List<Permission> findMenuAllPermissions();

    List<String> getPermissionCodeByAdminId(Long id);
}
