package top.forforever.controller;

import com.alibaba.dubbo.config.annotation.Reference;
import com.github.pagehelper.PageInfo;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import top.forforever.entity.Community;
import top.forforever.entity.Dict;
import top.forforever.service.CommunityService;
import top.forforever.service.DictService;

import javax.servlet.http.HttpServletRequest;
import java.nio.file.LinkOption;
import java.util.List;
import java.util.Map;

/**
 * @create: 2023/1/21
 * @Description:
 * @FileName: CommunityController
 * @自定义内容：
 */
@Controller
@RequestMapping("/community")
public class CommunityController extends BaseController{

    @Reference
    private CommunityService communityService;

    @Reference
    private DictService dictService;

    //查询所有及带分页
    @RequestMapping
    public String index(Map map, HttpServletRequest request){
        //获取请求参数
        Map<String, Object> filters = getFilters(request);
        map.put("filters",filters);
        //调用communityService中分页方法
        PageInfo<Community> pageInfo = communityService.findPage(filters);
        map.put("page",pageInfo);
        //根据编码获取北京所有的区域
        List<Dict> areaList = dictService.findListDictByDictCode("beijing");
        //放到request请求域中
        map.put("areaList",areaList);
        return "community/index";
    }

    //前往新增页面
    @RequestMapping("/create")
    public String goSavePage(Map map){
        //根据编码获取北京所有的区域
        List<Dict> areaList = dictService.findListDictByDictCode("beijing");
        map.put("areaList",areaList);
        return "community/create";
    }

    //保存二手房信息
    @RequestMapping("/save")
    @PreAuthorize("hasAuthority('community.create')")
    public String insert(Community community){
        communityService.insert(community);
        return "common/successPage";
    }

    //根据id查询二手房信息
    @RequestMapping("/edit/{communityId}")
    public String getEditPage(Map map, @PathVariable("communityId") Long communityId){
        //根据id查询二手房信息
        Community community = communityService.getById(communityId);
        //根据id查询该所有板块
        List<Dict> areaList = dictService.findListDictByDictCode("beijing");
        map.put("community",community);
        map.put("areaList",areaList);
        return "community/edit";
    }

    //更新
    @RequestMapping("/update")
    @PreAuthorize("hasAuthority('community.edit')")
    public String update(Community community) {
        communityService.update(community);
        return "common/successPage";
    }

    //删除
    @RequestMapping("/delete/{id}")
    @PreAuthorize("hasAuthority('community.delete')")
    public String delete(@PathVariable("id") Long id){
        communityService.delete(id);
        return "redirect:/community";
    }
}
