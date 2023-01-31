package top.forforever.dao;

import com.github.pagehelper.Page;
import org.apache.ibatis.annotations.Param;
import top.forforever.entity.House;
import top.forforever.vo.HouseQueryVo;
import top.forforever.vo.HouseVo;

/**
 * @create: 2023/1/23
 * @Description:
 * @FileName: HouseDao
 * @自定义内容：
 */
public interface HouseDao extends BaseDao<House>{
    Page<HouseVo> findPageList(HouseQueryVo houseQueryVo);

}
