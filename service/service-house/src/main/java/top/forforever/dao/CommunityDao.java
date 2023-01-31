package top.forforever.dao;

import top.forforever.entity.Community;

import java.util.List;

/**
 * @create: 2023/1/21
 * @Description:
 * @FileName: CommunityDao
 * @自定义内容：
 */
public interface CommunityDao extends BaseDao<Community>{
    List<Community> findAll();

}
