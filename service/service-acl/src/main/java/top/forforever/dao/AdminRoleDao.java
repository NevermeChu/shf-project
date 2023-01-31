package top.forforever.dao;

import org.apache.ibatis.annotations.Param;
import top.forforever.entity.AdminRole;

import java.util.List;

/**
 * @create: 2023/1/28
 * @Description:
 * @FileName: AdminRoleDao
 * @自定义内容：
 */
public interface AdminRoleDao extends BaseDao<AdminRole>{

    //根据用户id获取该角色id
    List<Long> getRoleIdsByAdminId(Long adminId);

    void deleteRolesByAdminId(Long adminId);

    void insertRolesByAdminIdAndRoleId(@Param("adminId") Long adminId,
                                       @Param("roleId") Integer roleId);
}
