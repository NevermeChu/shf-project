package top.forforever.service;

import com.github.pagehelper.PageInfo;
import top.forforever.entity.House;
import top.forforever.vo.HouseQueryVo;
import top.forforever.vo.HouseVo;

/**
 * @create: 2023/1/23
 * @Description:
 * @FileName: HouseService
 * @自定义内容：
 */
public interface HouseService extends BaseService<House>{
    void publish(Long id, Integer status);

    PageInfo<HouseVo> findPageList(Integer pageNum, Integer pageSize, HouseQueryVo houseQueryVo);

}
