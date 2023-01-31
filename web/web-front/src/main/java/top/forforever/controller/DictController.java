package top.forforever.controller;

import com.alibaba.dubbo.config.annotation.Reference;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import top.forforever.entity.Dict;
import top.forforever.result.Result;
import top.forforever.service.DictService;

import java.util.List;

/**
 * @create: 2023/1/25
 * @Description:
 * @FileName: DictController
 * @自定义内容：
 */
@RestController
@RequestMapping("/dict")
public class DictController {

    @Reference
    private DictService dictService;

    //根据编码获取所有子节点
    @RequestMapping("/findListByDictCode/{dictCode}")
    public Result findListByDictCode(@PathVariable("dictCode")String dictCode){
        List<Dict> listDictByDictCode = dictService.findListDictByDictCode(dictCode);
        return Result.ok(listDictByDictCode);
    }

    //根据父id查询子节点
    @RequestMapping("/findListByParentId/{areaId}")
    public Result findListByParentId(@PathVariable("areaId") Long areaId){
        List<Dict> listDictByParentId = dictService.findListDictByParentId(areaId);
        return Result.ok(listDictByParentId);
    }

}
