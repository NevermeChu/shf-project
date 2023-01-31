package top.forforever.controller;

import com.alibaba.dubbo.config.annotation.Reference;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import top.forforever.entity.Role;
import top.forforever.service.PermissionService;
import top.forforever.service.RoleService;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

/**
 * @create: 2023/1/19
 * @Description:
 * @FileName: RoleController
 * @自定义内容：
 */
@Controller
@RequestMapping("/role")
public class RoleController extends BaseController{

    private final static String PAGE_INDEX = "role/index";
    private final static String PAGE_EDIT = "role/edit";

    private final static String PAGE_CREATE = "role/create";
    private final static String PAGE_SUCCESS = "common/successPage";
    private final static String LIST_ACTION = "redirect:/role";

    @Reference
    private RoleService roleService;

    @Reference
    private PermissionService permissionService;

//    @GetMapping
//    public String findAll(Map map){
//        //获取所有参数
//        List<Role> roleList = roleService.findAll();
//        //放到request请求域中
//        map.put("list",roleList);
//        //去渲染页面
//        return PAGE_INDEX;
//    }

    //获取role列表和分页功能
    @RequestMapping
    public String index(Map map,HttpServletRequest request){
        //获取请求参数
        Map<String, Object> filters = getFilters(request);
        //将filters放到request域中
        map.put("filters",filters);

        //调用RoleService中分页及条件查询的方法
        PageInfo<Role> page = roleService.findPage(filters);
        map.put("page",page);
        return PAGE_INDEX;
    }

    //跳转新增角色页面
    @RequestMapping("/create")
    public String addRolePage(){
        return PAGE_CREATE;
    }

    //新增角色
    @PreAuthorize("hasAuthority('role.create')")
    @PostMapping("/save")
    public String save(Role role, HttpServletRequest request){
        roleService.insert(role);
        System.out.println(role.getId());
        return PAGE_SUCCESS;
    }

    //根据id获取角色info，修改功能
    @GetMapping("/edit/{id}")
    public String getById(@PathVariable Long id,Map map){
        Role role = roleService.getById(id);
        map.put("role",role);
        return PAGE_EDIT;
    }

    //根据id修改角色信息
    @PreAuthorize("hasAuthority('role.edit')")
    @PostMapping("/update")
    public String update(Role role){
        roleService.update(role);
        return PAGE_SUCCESS;
    }

    //根据id删除，逻辑删除
    @PreAuthorize("hasAuthority('role.delete')")
    @RequestMapping("/delete/{id}")
    public String delete(@PathVariable Long id){
        roleService.delete(id);
        return LIST_ACTION;
    }

    //分配角色
    @RequestMapping("/assignShow/{roleId}")
    public String goAssignShow(@PathVariable("roleId")Long roleId,
                               Map map){
        //根据角色获取授权权限数据
        List<Map<String,Object>> zNodes = permissionService.findPermissionByRoleId(roleId);
        map.put("roleId",roleId);
        map.put("zNodes",zNodes);
        return "role/assginShow";
    }

    //保存用户的权限
    @PreAuthorize("hasAuthority('role.assgin')")
    @RequestMapping("/assignPermission")
    public String assignPermission(Long roleId,Long[] permissionIds){
        permissionService.saveRolePermissionRealtionShip(roleId,permissionIds);
        return PAGE_SUCCESS;
    }

}
