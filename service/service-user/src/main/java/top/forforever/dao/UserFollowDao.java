package top.forforever.dao;

import com.github.pagehelper.Page;
import org.apache.ibatis.annotations.Param;
import top.forforever.entity.UserFollow;
import top.forforever.vo.UserFollowVo;

/**
 * @create: 2023/1/27
 * @Description:
 * @FileName: UserFollowDao
 * @自定义内容：
 */
public interface UserFollowDao extends BaseDao<UserFollow>{
    Integer getCountByUserIdAndHouseId(@Param("userId") Long userId,@Param("houseId") Long houseId);

    Page<UserFollowVo> findPageList(Long userId);

}
