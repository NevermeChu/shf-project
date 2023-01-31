package top.forforever.service;

import org.apache.ibatis.annotations.Param;
import top.forforever.entity.HouseImage;

import java.util.List;

/**
 * @create: 2023/1/24
 * @Description:
 * @FileName: HouseImageService
 * @自定义内容：
 */
public interface HouseImageService extends BaseService<HouseImage>{

    //根据房源id和类型查询房源和房产图片
    List<HouseImage> getHouseImagesByIdAndType(Long houseId, Integer type);

}
