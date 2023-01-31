package top.forforever.service.impl;

import com.alibaba.dubbo.config.annotation.Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import top.forforever.dao.BaseDao;
import top.forforever.dao.UserInfoDao;
import top.forforever.entity.UserInfo;
import top.forforever.service.UserInfoService;

/**
 * @create: 2023/1/25
 * @Description:
 * @FileName: UserInfoServiceImpl
 * @自定义内容：
 */
@Service(interfaceClass = UserInfoService.class)
@Transactional
public class UserInfoServiceImpl extends BaseServiceImpl<UserInfo> implements UserInfoService {

    @Autowired
    private UserInfoDao userInfoDao;

    @Override
    protected BaseDao<UserInfo> getEntityDao() {
        return userInfoDao;
    }

    @Override
    public UserInfo getUserInfoByPhone(String phone) {
        return userInfoDao.getUserInfoByPhone(phone);
    }
}
