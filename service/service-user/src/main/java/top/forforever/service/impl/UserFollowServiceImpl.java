package top.forforever.service.impl;

import com.alibaba.dubbo.config.annotation.Reference;
import com.alibaba.dubbo.config.annotation.Service;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import top.forforever.dao.BaseDao;
import top.forforever.dao.UserFollowDao;
import top.forforever.entity.UserFollow;
import top.forforever.entity.UserInfo;
import top.forforever.service.DictService;
import top.forforever.service.UserFollowService;
import top.forforever.vo.UserFollowVo;

import javax.xml.crypto.dsig.keyinfo.PGPData;

/**
 * @create: 2023/1/27
 * @Description:
 * @FileName: UserFollowServiceImpl
 * @自定义内容：
 */
@Service(interfaceClass = UserFollowService.class)
@Transactional
public class UserFollowServiceImpl extends BaseServiceImpl<UserFollow> implements UserFollowService {

    @Autowired
    private UserFollowDao userFollowDao;

    @Reference
    private DictService dictService;

    @Override
    protected BaseDao<UserFollow> getEntityDao() {
        return userFollowDao;
    }

    @Override
    public void follow(Long userId, Long houseId) {
        //创建UserFollow对象赋值
        UserFollow userFollow = new UserFollow();
        userFollow.setUserId(userId);
        userFollow.setHouseId(houseId);
        userFollowDao.insert(userFollow);
    }

    @Override
    public Boolean isFollowed(Long userId, Long houseId) {
        Integer count = userFollowDao.getCountByUserIdAndHouseId(userId,houseId);
        return count > 0 ? true : false;
    }

    @Override
    public PageInfo<UserFollowVo> findPageList(Integer pageNum, Integer pageSize, Long userId) {
        //开启分页
        PageHelper.startPage(pageNum,pageSize);
        //根据用户id查询我的关注
        Page<UserFollowVo> page = userFollowDao.findPageList(userId);
        //遍历page
        for (UserFollowVo userFollowVo : page) {
            //获取房屋类型
            String houseName = dictService.getNameById(userFollowVo.getHouseTypeId());
            //获取楼层
            String floorName = dictService.getNameById(userFollowVo.getFloorId());
            //获取朝向
            String directionName = dictService.getNameById(userFollowVo.getDirectionId());
            userFollowVo.setHouseTypeName(houseName);
            userFollowVo.setFloorName(floorName);
            userFollowVo.setDirectionName(directionName);
        }
        return new PageInfo<>(page,5);
    }

}
