package top.forforever.service;

import top.forforever.entity.HouseBroker;

import java.util.List;

/**
 * @create: 2023/1/24
 * @Description:
 * @FileName: HouseBrokerService
 * @自定义内容：
 */
public interface HouseBrokerService extends BaseService<HouseBroker> {

    //根据房源id查询经纪人信息
    List<HouseBroker> getHouseBrokersByHouseId(Long houseId);

}
