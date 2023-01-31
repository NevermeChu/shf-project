package top.forforever.dao;

import top.forforever.entity.Dict;
import top.forforever.entity.House;

import java.util.List;

/**
 * @create: 2023/1/21
 * @Description:
 * @FileName: DictDao
 * @自定义内容：
 */
public interface DictDao extends BaseDao<Dict> {
    //根据父di获取该节点下所有的子节点
    List<Dict> findListByParentId(Long id);

    //根据父id判断该节点是否是父节点
    Integer isParentNode(Long id);

    //根据编码获取dict对象
    Dict findDictByDictCode(String dictCode);

    //根据id查询字典名字
    String getNameById(Long id);

}
