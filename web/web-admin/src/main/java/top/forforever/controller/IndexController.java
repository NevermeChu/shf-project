package top.forforever.controller;

import com.alibaba.dubbo.config.annotation.Reference;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import top.forforever.entity.Admin;
import top.forforever.entity.Permission;
import top.forforever.service.AdminService;
import top.forforever.service.PermissionService;

import java.util.List;
import java.util.Map;

/**
 * @create: 2023/1/19
 * @Description:
 * @FileName: IndexController
 * @自定义内容：
 */
@Controller
public class IndexController {

    @Reference
    private AdminService adminService;

    @Reference
    private PermissionService permissionService;

    @RequestMapping("/")
    public String index(Map map){
//        Long adminId = 1L;
//        Admin admin = adminService.getById(adminId);
        //从SpringSecurity中获取User信息
        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        //获取admin对象
        Admin admin = adminService.getAdminByUserName(user.getUsername());
        //根据用户id获取拥有的权限菜单列表
        List<Permission> permissionList = permissionService.findMenuPermissionByAdminId(admin.getId());
        map.put("admin",admin);
        map.put("permissionList",permissionList);
        return "frame/index";
    }

    @RequestMapping("/main")
    public String main(){
        return "frame/main";
    }

    @RequestMapping("/login")
    public String login(){
        return "frame/login";
    }

    //去无权限页面
    @GetMapping("/auth")
    public String auth(){
        return "frame/auth";
    }

}
