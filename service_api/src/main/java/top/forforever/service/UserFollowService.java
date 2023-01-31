package top.forforever.service;

import com.github.pagehelper.PageInfo;
import top.forforever.entity.UserFollow;
import top.forforever.vo.UserFollowVo;

/**
 * @create: 2023/1/27
 * @Description:
 * @FileName: UserFollowService
 * @自定义内容：
 */
public interface UserFollowService extends BaseService<UserFollow>{
    void follow(Long userId, Long houseId);

    Boolean isFollowed(Long id, Long id1);

    PageInfo<UserFollowVo> findPageList(Integer pageNum, Integer pageSize, Long id);
}
