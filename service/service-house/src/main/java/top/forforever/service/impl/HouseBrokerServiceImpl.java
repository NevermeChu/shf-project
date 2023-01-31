package top.forforever.service.impl;

import com.alibaba.dubbo.config.annotation.Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import top.forforever.dao.BaseDao;
import top.forforever.dao.HouseBrokerDao;
import top.forforever.entity.HouseBroker;
import top.forforever.service.HouseBrokerService;

import java.io.Serializable;
import java.util.List;

/**
 * @create: 2023/1/24
 * @Description:
 * @FileName: HouseBrokerServiceImpl
 * @自定义内容：
 */
@Service(interfaceClass = HouseBrokerService.class)
@Transactional
public class HouseBrokerServiceImpl extends BaseServiceImpl<HouseBroker> implements HouseBrokerService {

    @Autowired
    private HouseBrokerDao houseBrokerDao;

    @Override
    protected BaseDao<HouseBroker> getEntityDao() {
        return houseBrokerDao;
    }

    @Override
    public List<HouseBroker> getHouseBrokersByHouseId(Long houseId) {
        return houseBrokerDao.getHouseBrokersByHouseId(houseId);
    }

}
