package top.forforever.controller;

import com.alibaba.dubbo.config.annotation.Reference;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import top.forforever.entity.Admin;
import top.forforever.entity.HouseBroker;
import top.forforever.service.AdminService;
import top.forforever.service.HouseBrokerService;

import java.util.List;
import java.util.Map;

/**
 * @create: 2023/1/24
 * @Description:
 * @FileName: HouseBrokerController
 * @自定义内容：
 */
@Controller
@RequestMapping("/houseBroker")
public class HouseBrokerController {

    private final static String SUCCESS_PAGE = "common/successPage";

    @Reference
    private HouseBrokerService houseBrokerService;

    @Reference
    private AdminService adminService;

    //去添加房源的经纪人页面
    @RequestMapping("/create")
    public String goSavePage(Long houseId, Map map){
        //查询所有经纪人
        List<Admin> adminList = adminService.findAll();
        map.put("adminList",adminList);
        map.put("houseId",houseId);
        return "houseBroker/create";
    }

    //保存经纪人
    @RequestMapping("/save")
    @PreAuthorize("hasAuthority('house.editBroker')")
    public String save(HouseBroker houseBroker){
        Admin admin = adminService.getById(houseBroker.getBrokerId());
        //设置经纪人头像
        houseBroker.setBrokerHeadUrl(admin.getHeadUrl());
        //设置经纪人姓名
        houseBroker.setBrokerName(admin.getName());
        //调用方法新增
        houseBrokerService.insert(houseBroker);
        return SUCCESS_PAGE;
    }

    //去修改页面
    @RequestMapping("/edit/{id}")
    public String goEditPage(@PathVariable("id") Long id,Map map){
        //查询所有经纪人
        List<Admin> adminList = adminService.findAll();
        map.put("adminList",adminList);
        //查询该房源的经纪人信息
        HouseBroker houseBroker = houseBrokerService.getById(id);
        map.put("houseBroker",houseBroker);
        return "houseBroker/edit";
    }

    //更新经纪人信息
    @RequestMapping("/update")
    @PreAuthorize("hasAuthority('house.editBroker')")
    public String update(HouseBroker houseBroker){
        Admin admin = adminService.getById(houseBroker.getBrokerId());
        //设置更新后的经纪人信息
        houseBroker.setBrokerHeadUrl(admin.getHeadUrl());
        houseBroker.setBrokerName(admin.getName());
        houseBrokerService.update(houseBroker);
        return SUCCESS_PAGE;
    }

    //删除经纪人
    @RequestMapping("/delete/{houseId}/{id}")
    @PreAuthorize("hasAuthority('house.delete')")
    public String delete(@PathVariable("houseId")Long houseId,
                         @PathVariable("id")Long id){
        //TODO删除经纪人同时删除图片，用到houseId
        houseBrokerService.delete(id);
        return "redirect:/house/"+houseId;
    }

}
