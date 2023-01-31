package top.forforever.service;

import top.forforever.entity.Role;

import java.util.List;
import java.util.Map;

/**
 * @create: 2023/1/19
 * @Description:
 * @FileName: RoleService
 * @自定义内容：
 */
public interface RoleService extends BaseService<Role> {

    List<Role> findAll();

    Map<String, Object> getRolesByAdminId(Long adminId);

    void assignRoleByAdminIdAndRoleIds(Long adminId, Integer[] roleIds);

}
