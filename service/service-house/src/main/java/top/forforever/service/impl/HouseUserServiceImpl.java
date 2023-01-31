package top.forforever.service.impl;

import com.alibaba.dubbo.config.annotation.Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import top.forforever.dao.BaseDao;
import top.forforever.dao.HouseUserDao;
import top.forforever.entity.HouseUser;
import top.forforever.service.HouseUserService;

import java.util.List;

/**
 * @create: 2023/1/24
 * @Description:
 * @FileName: HouseUserServiceImpl
 * @自定义内容：
 */
@Service(interfaceClass = HouseUserService.class)
@Transactional
public class HouseUserServiceImpl extends BaseServiceImpl<HouseUser> implements HouseUserService {

    @Autowired
    private HouseUserDao houseUserDao;

    @Override
    protected BaseDao<HouseUser> getEntityDao() {
        return houseUserDao;
    }

    @Override
    public List<HouseUser> getHouseUsersByHouseId(Long houseId) {
        return houseUserDao.getHouseUsersByHouseId(houseId);
    }
}
