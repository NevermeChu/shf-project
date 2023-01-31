package top.forforever.controller;

import com.alibaba.dubbo.config.annotation.Reference;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import top.forforever.entity.Admin;
import top.forforever.service.AdminService;
import top.forforever.service.HouseImageService;
import top.forforever.service.RoleService;
import top.forforever.util.MD5;
import top.forforever.util.QiniuUtil;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.UUID;

/**
 * @create: 2023/1/20
 * @Description:
 * @FileName: AdminController
 * @自定义内容：
 */
@Controller
@RequestMapping("/admin")
public class AdminController extends BaseController{

    private final static String PAGE_SUCCESS = "common/successPage";

    @Reference
    private AdminService adminService;

    @Reference
    private RoleService roleService;

    @Autowired
    private PasswordEncoder passwordEncoder;

    // 去上传页面
    @RequestMapping("/uploadShow/{id}")
    public String uploadShow(@PathVariable("id") Long id,Map map){
        map.put("id",id);
        return "admin/upload";
    }
    //上传头像
    @RequestMapping("/upload/{id}")
    @PreAuthorize("hasAuthority('admin.upload')")
    public String upload(@PathVariable("id") Long id,
                         @RequestParam("file")MultipartFile file){
        try {
            //获取文件字节数组
            byte[] bytes = file.getBytes();
            //获取文件名
            String filename = file.getOriginalFilename();
            //通过uuid获取新的文件名
            String newFilename = UUID.randomUUID().toString();
            //调用QiniuUtil方法
            QiniuUtil.upload2Qiniu(bytes,newFilename);
            //查询用户信息，设置头像
            Admin admin = adminService.getById(id);
            //设置图片的路径，路径的格式：http://七牛云的域名/随机生成的图片名字
            admin.setHeadUrl("http://rozti2kdd.hn-bkt.clouddn.com/"+newFilename);
            adminService.update(admin);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return PAGE_SUCCESS;
    }

    //分页及带条件的查询
    @RequestMapping
    public String findPage(Map map, HttpServletRequest request){
        //获取请求参数
        Map<String, Object> filters = getFilters(request);
        //将filters放到request域中
        map.put("filters",filters);
        //调用adminService中的分页方法
        PageInfo<Admin> page = adminService.findPage(filters);
        //将pageInfo放到request域中
        map.put("page",page);
        System.out.println(page.getList());
        return "admin/index";
    }

    @RequestMapping("/create")
    public String goCreatePage(){
        return "admin/create";
    }

    @RequestMapping("/save")
    @PreAuthorize("hasAuthority('admin.create')")
    public String insert(Admin admin){
        admin.setPassword(passwordEncoder.encode(admin.getPassword()));
        adminService.insert(admin);
        return PAGE_SUCCESS;
    }

    @RequestMapping("/edit/{id}")
    public String getById(@PathVariable Long id,Map map){
        Admin admin = adminService.getById(id);
        map.put("admin",admin);
        return "admin/edit";
    }

    @RequestMapping("/update")
    @PreAuthorize("hasAuthority('admin.edit')")
    public String update(Admin admin){
        adminService.update(admin);
        return PAGE_SUCCESS;
    }

    @RequestMapping("/delete/{id}")
    @PreAuthorize("hasAuthority('admin.create')")
    public String delete(@PathVariable Long id){
        adminService.delete(id);
        return "redirect:/admin";
    }

    //分配角色页面
    @RequestMapping("/assignShow/{adminId}")
    public String assignShow(@PathVariable("adminId")Long adminId, ModelMap modelMap){
        modelMap.put("adminId",adminId);
        //以map返回
        Map<String , Object> map = roleService.getRolesByAdminId(adminId);
        modelMap.addAllAttributes(map);
        return "admin/assignShow";
    }

    //分配角色
    @RequestMapping("/assignRole")
    @PreAuthorize("hasAuthority('admin.assgin')")
    public String assignRole(@RequestParam("adminId") Long adminId,
                             @RequestParam("roleIds") Integer[] roleIds){
        System.out.println("roleIds = " + roleIds);
        roleService.assignRoleByAdminIdAndRoleIds(adminId,roleIds);
        return PAGE_SUCCESS;
    }

}
