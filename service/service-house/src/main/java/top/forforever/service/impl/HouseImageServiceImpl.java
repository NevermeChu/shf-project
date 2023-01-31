package top.forforever.service.impl;

import com.alibaba.dubbo.config.annotation.Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import top.forforever.dao.BaseDao;
import top.forforever.dao.HouseImageDao;
import top.forforever.entity.HouseImage;
import top.forforever.service.HouseImageService;

import java.util.List;

/**
 * @create: 2023/1/24
 * @Description:
 * @FileName: HouseImageServiceImpl
 * @自定义内容：
 */
@Service(interfaceClass = HouseImageService.class)
@Transactional
public class HouseImageServiceImpl extends BaseServiceImpl<HouseImage> implements HouseImageService {

    @Autowired
    private HouseImageDao houseImageDao;

    @Override
    protected BaseDao<HouseImage> getEntityDao() {
        return houseImageDao;
    }

    @Override
    public List<HouseImage> getHouseImagesByIdAndType(Long houseId, Integer type) {
        return houseImageDao.getHouseImagesByIdAndType(houseId,type);
    }
}
