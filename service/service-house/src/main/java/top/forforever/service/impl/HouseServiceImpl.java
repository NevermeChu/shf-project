package top.forforever.service.impl;

import com.alibaba.dubbo.config.annotation.Service;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import top.forforever.dao.BaseDao;
import top.forforever.dao.DictDao;
import top.forforever.dao.HouseDao;
import top.forforever.entity.House;
import top.forforever.service.HouseService;
import top.forforever.util.CastUtil;
import top.forforever.vo.HouseQueryVo;
import top.forforever.vo.HouseVo;

import java.io.Serializable;
import java.util.Map;

/**
 * @create: 2023/1/23
 * @Description:
 * @FileName: HouseServiceImpl
 * @自定义内容：
 */
@Service(interfaceClass = HouseService.class)
@Transactional
public class HouseServiceImpl extends BaseServiceImpl<House> implements HouseService {

    @Autowired
    private HouseDao houseDao;

    @Autowired
    private DictDao dictDao;

    @Override
    protected BaseDao<House> getEntityDao() {
        return houseDao;
    }

    @Override
    public PageInfo<House> findPage(Map<String, Object> filters) {
        int pageNum = CastUtil.castInt(filters.get("pageNum"), 1);
        int pageSize = CastUtil.castInt(filters.get("pageSize"), 10);
        //开启分页
        PageHelper.startPage(pageNum,pageSize);
        //获取集合
        if (filters.get("name") != null)filters.put("name",((String) filters.get("name")).trim());

        Page<House> page = getEntityDao().findPage(filters);
        return new PageInfo<>(page,5);
    }

    @Override
    public void publish(Long id, Integer status) {
        House house = new House();
        house.setId(id);
        house.setStatus(status);
        houseDao.update(house);
    }

    //根据条件查询二手房信息列表
    @Override
    public PageInfo<HouseVo> findPageList(Integer pageNum, Integer pageSize, HouseQueryVo houseQueryVo) {
        //开启分页
        PageHelper.startPage(pageNum,pageSize);
        Page<HouseVo> page = houseDao.findPageList(houseQueryVo);
        for (HouseVo houseVo : page) {
            //获取房屋类型
            String houseName = dictDao.getNameById(houseVo.getHouseTypeId());
            //获取楼层
            String floorName = dictDao.getNameById(houseVo.getFloorId());
            //获取朝向
            String directionName = dictDao.getNameById(houseVo.getDirectionId());
            houseVo.setHouseTypeName(houseName);
            houseVo.setFloorName(floorName);
            houseVo.setDirectionName(directionName);
        }
        return new PageInfo<>(page,5);
    }

    //重写getById方法
    @Override
    public House getById(Serializable id) {
        House house = houseDao.getById(id);
        //获取户型名称
        String houseName = dictDao.getNameById(house.getHouseTypeId());
        //楼层
        String floorName = dictDao.getNameById(house.getFloorId());
        //建筑结构
        String structureName = dictDao.getNameById(house.getBuildStructureId());
        //朝向
        String directionName = dictDao.getNameById(house.getDirectionId());
        //装修情况
        String decorationName = dictDao.getNameById(house.getDecorationId());
        //房屋用途
        String houseUseName = dictDao.getNameById(house.getHouseUseId());
        house.setHouseTypeName(houseName);
        house.setFloorName(floorName);
        house.setBuildStructureName(structureName);
        house.setDirectionName(directionName);
        house.setDecorationName(decorationName);
        house.setHouseUseName(houseUseName);
        return house;
    }
}
