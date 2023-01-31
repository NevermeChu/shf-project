package top.forforever.service;

import top.forforever.entity.UserInfo;

/**
 * @create: 2023/1/25
 * @Description:
 * @FileName: UserInfoService
 * @自定义内容：
 */
public interface UserInfoService extends BaseService<UserInfo> {
    UserInfo getUserInfoByPhone(String phone);
}
