package top.forforever.service.impl;

import com.alibaba.dubbo.config.annotation.Service;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import top.forforever.dao.BaseDao;
import top.forforever.dao.CommunityDao;
import top.forforever.dao.DictDao;
import top.forforever.entity.Community;
import top.forforever.service.CommunityService;
import top.forforever.util.CastUtil;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

/**
 * @create: 2023/1/21
 * @Description:
 * @FileName: CommunityService
 * @自定义内容：
 */
@Service(interfaceClass = CommunityService.class)
@Transactional
public class CommunityServiceImpl extends BaseServiceImpl<Community> implements CommunityService {

    @Autowired
    private CommunityDao communityDao;

    @Autowired
    private DictDao dictDao;

    @Override
    protected BaseDao<Community> getEntityDao() {
        return communityDao;
    }

    //重写findPage方法
    @Override
    public PageInfo<Community> findPage(Map<String, Object> filters) {
        //获取当前页
        int pageNum = CastUtil.castInt(filters.get("pageNum"), 1);
        //获取每页显示的页码数
        int pageSize = CastUtil.castInt(filters.get("pageSize"), 10);
        //开启分页
        PageHelper.startPage(pageNum,pageSize);
        //查询所有方法
        Page<Community> page = communityDao.findPage(filters);
        for (Community community : page) {
            //获取区域名字
            String areaName = dictDao.getNameById(community.getAreaId());
            //获取板块名字
            String plateName = dictDao.getNameById(community.getPlateId());
            //赋值给社区对象
            community.setAreaName(areaName);
            community.setPlateName(plateName);
        }
        return new PageInfo<>(page);
    }

    @Override
    public List<Community> findAll() {
        return communityDao.findAll();
    }

    @Override
    public Community getById(Serializable id) {
        Community community = communityDao.getById(id);
        //区域名
        String areaName = dictDao.getNameById(community.getAreaId());
        //板块名
        String plateName = dictDao.getNameById(community.getPlateId());
        community.setAreaName(areaName);
        community.setPlateName(plateName);
        return community;
    }
}
