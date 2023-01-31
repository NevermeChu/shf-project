package top.forforever.controller;

import com.alibaba.dubbo.config.annotation.Reference;
import com.github.pagehelper.PageInfo;
import org.aspectj.weaver.ast.Or;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import top.forforever.entity.*;
import top.forforever.result.Result;
import top.forforever.service.*;
import top.forforever.util.QiniuUtil;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;
import java.util.UUID;

/**
 * @create: 2023/1/23
 * @Description:
 * @FileName: HouseConroller
 * @自定义内容：
 */
@Controller
@RequestMapping("/house")
public class HouseController extends BaseController {

    private final static String SUCCESS_PAGE = "common/successPage";

    @Reference
    private HouseService houseService;

    @Reference
    private CommunityService communityService;

    @Reference
    private DictService dictService;

    @Reference
    private HouseImageService houseImageService;

    @Reference
    private HouseBrokerService houseBrokerService;

    @Reference
    private HouseUserService houseUserService;

    @RequestMapping("/uploadShow/{id}")
    public String uploadShow(@PathVariable("id")Long id,Map map){
        map.put("id",id);
        return "house/default_upload";
    }

    //设置首页默认图片
    @RequestMapping("/upload/{id}")
    @PreAuthorize("hasAuthority('house.upload')")
    public String upload(@PathVariable("id")Long id,
                         @RequestParam("file")MultipartFile file){

        try {
            //获取字节数
            byte[] bytes = file.getBytes();
            //获取文件名
            String filename = file.getOriginalFilename();
            String fileType = filename.substring(filename.lastIndexOf("."));
            //设置图片名称唯一性
            String newFileName = UUID.randomUUID().toString().replace("-","")+fileType;
            QiniuUtil.upload2Qiniu(bytes,newFileName);
            //获取当前房源信息
            House house = houseService.getById(id);
            house.setDefaultImageUrl("http://rozti2kdd.hn-bkt.clouddn.com/"+newFileName);
            houseService.update(house);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return SUCCESS_PAGE;
    }

    @RequestMapping
    public String index(Map map, HttpServletRequest request){
        //获取参数
        Map<String, Object> filters = getFilters(request);
        map.put("filters",filters);
        PageInfo<House> page = houseService.findPage(filters);
        map.put("page",page);
        //将小区和字典中的数据放到request域中
        setCommunityRequestAttribute(map);
        return "house/index";
    }

    //跳转新增房源页面
    @RequestMapping("/create")
    public String goAddPage(Map map){
        //将小区和字典中的数据放到request域中
        setCommunityRequestAttribute(map);
        return "house/create";
    }

    //新增房源
    @RequestMapping("/save")
    @PreAuthorize("hasAuthority('house.create')")
    public String save(House house){
        houseService.insert(house);
        return SUCCESS_PAGE;
    }

    //去修改页面
    @RequestMapping("/edit/{houseId}")
    public String goEditPage(@PathVariable("houseId") Long houseId,Map map){
        House house = houseService.getById(houseId);
        map.put("house",house);
        //将小区和字典中的数据放到request域中
        setCommunityRequestAttribute(map);
        return "house/edit";
    }

    @RequestMapping("/update")
    @PreAuthorize("hasAuthority('house.edit')")
    public String update(House house){
        houseService.update(house);
        return SUCCESS_PAGE;
    }

    @RequestMapping("/delete/{id}")
    @PreAuthorize("hasAuthority('house.delete')")
    public String delete(@PathVariable("id") Long id){
        houseService.delete(id);
        return "redirect:/house";
    }

    //发布和取消发布
    @RequestMapping("/publish/{id}/{status}")
    @PreAuthorize("hasAuthority('house.publish')")
    public String publish(@PathVariable("id") Long id,
                          @PathVariable("status") Integer status){
        /*House house = houseService.getById(id);
        house.setStatus(status);
        houseService.update(house);*/
        houseService.publish(id,status);
        return "redirect:/house";
    }

    //去详情页
    @RequestMapping("{houseId}")
    public String goDetailPage(@PathVariable("houseId") Long houseId,Map map){
        //查询房源方法
        House house = houseService.getById(houseId);
        map.put("house",house);
        //根据小区id查询小区方法
        Community community = communityService.getById(house.getCommunityId());
        map.put("community",community);
        //将房源图片，房产图片，经纪人和房东信息发到请求域中
        setHouseRequestAttribute(map,houseId);
        return "house/show";
    }
    
    //将房源图片，房产图片，经纪人和房东信息发到请求域中
    private void setHouseRequestAttribute(Map map,Long houseId){
        //查询房源图片
        List<HouseImage> houseImage1List = houseImageService.getHouseImagesByIdAndType(houseId, 1);
        //查询房产图片
        List<HouseImage> houseImage2List = houseImageService.getHouseImagesByIdAndType(houseId, 2);
        //查询经纪人信息
        List<HouseBroker> houseBrokerList = houseBrokerService.getHouseBrokersByHouseId(houseId);
        //查询房东信息
        List<HouseUser> houseUserList = houseUserService.getHouseUsersByHouseId(houseId);
        map.put("houseImage1List",houseImage1List);
        map.put("houseImage2List",houseImage2List);
        map.put("houseBrokerList",houseBrokerList);
        map.put("houseUserList",houseUserList);
    }

    //获取所有小区及字典数据中的方法
    private void setCommunityRequestAttribute(Map map){
        //获取所有的小区
        List<Community> communityList = communityService.findAll();
        //获取所有户型
        List<Dict> houseTypeList = dictService.findListDictByDictCode("houseType");
        //获取楼层
        List<Dict> floorList = dictService.findListDictByDictCode("floor");
        //获取建筑结构
        List<Dict> buildStructureList = dictService.findListDictByDictCode("buildStructure");
        //获取朝向
        List<Dict> directionList = dictService.findListDictByDictCode("direction");
        //获取装修情况
        List<Dict> decorationList = dictService.findListDictByDictCode("decoration");
        //获取房屋用途
        List<Dict> houseUseList = dictService.findListDictByDictCode("houseUse");
        //放到request请求域中
        map.put("communityList",communityList);
        map.put("houseTypeList",houseTypeList);
        map.put("floorList",floorList);
        map.put("buildStructureList",buildStructureList);
        map.put("directionList",directionList);
        map.put("decorationList",decorationList);
        map.put("houseUseList",houseUseList);
    }

}
