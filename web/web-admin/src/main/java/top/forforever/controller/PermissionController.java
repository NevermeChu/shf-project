package top.forforever.controller;


import com.alibaba.dubbo.config.annotation.Reference;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import top.forforever.entity.Permission;
import top.forforever.service.PermissionService;

import java.util.List;
import java.util.Map;

/**
 * @create: 2023/1/28
 * @Description:
 * @FileName: PermissionController
 * @自定义内容：
 */
@Controller
@RequestMapping("/permission")
public class PermissionController {

    private final static String SUCCESS_PAGE = "common/successPage";

    @Reference
    private PermissionService permissionService;

    @RequestMapping
    public String index(Map map){
        List<Permission> permissionList = permissionService.findMenuAllPermissions();
        map.put("list",permissionList);
        return "permission/index";
    }

    @RequestMapping("/create")
    public String goSavePage(Permission permission,Map map){
        map.put("permission",permission);
        return "permission/create";
    }

    @RequestMapping("/save")
    @PreAuthorize("hasAuthority('permission.create')")
    public String save(Permission permission){
        permissionService.insert(permission);
        return SUCCESS_PAGE;
    }

    @RequestMapping("/edit/{id}")
    public String goEditPage(@PathVariable("id")Long id,Map map){
        Permission permission = permissionService.getById(id);
        map.put("permission",permission);
        return "permission/edit";
    }

    @RequestMapping("/update")
    @PreAuthorize("hasAuthority('permission.edit')")
    public String update(Permission permission){
        permissionService.update(permission);
        return SUCCESS_PAGE;
    }

    @RequestMapping("/delete/{id}")
    @PreAuthorize("hasAuthority('permission.delete')")
    public String delete(@PathVariable("id")Long id){
        permissionService.delete(id);
        return "redirect:/permission";
    }

}
