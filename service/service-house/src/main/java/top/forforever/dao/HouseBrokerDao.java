package top.forforever.dao;

import top.forforever.entity.HouseBroker;

import java.util.List;

/**
 * @create: 2023/1/24
 * @Description:
 * @FileName: HouseBrokerDao
 * @自定义内容：
 */
public interface HouseBrokerDao extends BaseDao<HouseBroker>{

    //根据房源id查询经纪人信息
    List<HouseBroker> getHouseBrokersByHouseId(Long houseId);

}
