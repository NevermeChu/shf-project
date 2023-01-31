package top.forforever.dao;

import top.forforever.entity.UserInfo;

/**
 * @create: 2023/1/25
 * @Description:
 * @FileName: UserInfoDao
 * @自定义内容：
 */
public interface UserInfoDao extends BaseDao<UserInfo>{
    UserInfo getUserInfoByPhone(String phone);
}
