package top.forforever.service;

import top.forforever.entity.Dict;

import java.util.List;
import java.util.Map;

/**
 * @create: 2023/1/21
 * @Description:
 * @FileName: DictServicee
 * @自定义内容：
 */
public interface DictService extends BaseService<Dict>{
    //查询数据字典中的数据，通过zTree进行渲染
    List<Map<String, Object>> findZnodes(Long id);

    //根据编码获取该节点下的所有子节点
    List<Dict> findListDictByDictCode(String dictCode);

    //根据父id获取该节点下的所有子节点
    List<Dict> findListDictByParentId(Long id);

    String getNameById(Long houseTypeId);

}
