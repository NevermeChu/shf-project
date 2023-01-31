package top.forforever.dao;

import top.forforever.entity.Role;

import java.util.List;

/**
 * @create: 2023/1/19
 * @Description:
 * @FileName: RoleDao
 * @自定义内容：
 */
public interface RoleDao extends BaseDao<Role> {

    //查询所有
    List<Role> findAll();

}
