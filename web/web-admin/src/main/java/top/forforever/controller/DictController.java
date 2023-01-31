package top.forforever.controller;

import com.alibaba.dubbo.config.annotation.Reference;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import top.forforever.entity.Dict;
import top.forforever.result.Result;
import top.forforever.service.DictService;

import java.util.List;
import java.util.Map;

/**
 * @create: 2023/1/21
 * @Description:
 * @FileName: DictController
 * @自定义内容：
 */
@Controller
@RequestMapping("/dict")
public class DictController {

    @Reference
    private DictService dictService;

    @RequestMapping
    public String index(){
        return "dict/index";
    }


    //获取数字字典中的数据
    @RequestMapping("/findZnodes")
    @ResponseBody
    public Result findZnodes(@RequestParam(value = "id",defaultValue = "0") Long id){
        //调用DictService中查询数字字典中的数据方法
        List<Map<String,Object>> zNodes = dictService.findZnodes(id);
        return Result.ok(zNodes);
    }

    //根据父id获取所有子节点
    @ResponseBody
    @RequestMapping("/findListByParentId/{areaId}")
    public Result findListByParentId(@PathVariable("areaId") Long areaId){
        //调用dictService根据父id查询所有子节点方法
        List<Dict> plateLists = dictService.findListDictByParentId(areaId);
        return Result.ok(plateLists);
    }


}
