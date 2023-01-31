package top.forforever.service;

import top.forforever.entity.Community;

import java.util.List;

/**
 * @create: 2023/1/21
 * @Description:
 * @FileName: CommunityService
 * @自定义内容：
 */
public interface CommunityService extends BaseService<Community>{
    List<Community> findAll();

}
