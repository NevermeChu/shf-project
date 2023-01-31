package top.forforever.service;

import top.forforever.entity.HouseUser;

import java.util.List;

/**
 * @create: 2023/1/24
 * @Description:
 * @FileName: HouseUserService
 * @自定义内容：
 */
public interface HouseUserService extends BaseService<HouseUser>{

    //根据房源id查询该房源的房东
    List<HouseUser> getHouseUsersByHouseId(Long houseId);

}
