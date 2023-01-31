package top.forforever.service.impl;

import com.alibaba.dubbo.config.annotation.Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import top.forforever.dao.BaseDao;
import top.forforever.dao.DictDao;
import top.forforever.entity.Dict;
import top.forforever.entity.House;
import top.forforever.service.BaseService;
import top.forforever.service.DictService;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @create: 2023/1/21
 * @Description:
 * @FileName: DictServiceImpl
 * @自定义内容：
 */
@Service(interfaceClass = DictService.class)
@Transactional
public class DictServiceImpl extends BaseServiceImpl<Dict> implements DictService {

    @Autowired
    private DictDao dictDao;

    @Override
    protected BaseDao<Dict> getEntityDao() {
        return this.dictDao;
    }

    @Override
    public List<Map<String, Object>> findZnodes(Long id) {
        //根据父id查询该节点下所有的子节点
        List<Dict> dictList = dictDao.findListByParentId(id);
        //创建返回的list
        List<Map<String,Object>> zNodes = new ArrayList<>();
        //遍历dictList
        for (Dict dict : dictList) {
            //返回数据[{ id:2, isParent:true, name:"随意勾选 2"}]
            //创建一个Map
            Map<String,Object> map = new HashMap<>();
            map.put("id",dict.getId());
            map.put("name",dict.getName());
            //调用DictDao中判断该节点是否是父节点的方法
            Integer count = dictDao.isParentNode(dict.getId());
            //封装isParent
            map.put("isParent",count > 0 ? true : false);
            //将map添加到List中
            zNodes.add(map);
        }
        return zNodes;
    }

    //根据编码获取该节点的所有子节点
    @Override
    public List<Dict> findListDictByDictCode(String dictCode) {
        //根据编码得到dict对象获取id
        Dict dict = dictDao.findDictByDictCode(dictCode);
        if (dict == null) return null;
        //根据父id查询所有子节点方法
        List<Dict> listByParentId = this.findListDictByParentId(dict.getId());
        return listByParentId;
    }

    //根据父id获取该节点的所有子节点
    @Override
    public List<Dict> findListDictByParentId(Long id) {
        return dictDao.findListByParentId(id);
    }

    @Override
    public String getNameById(Long houseTypeId) {
        return dictDao.getNameById(houseTypeId);
    }


}
