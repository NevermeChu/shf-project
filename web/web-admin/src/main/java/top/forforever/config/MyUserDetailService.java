package top.forforever.config;

import com.alibaba.dubbo.config.annotation.Reference;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;
import top.forforever.entity.Admin;
import top.forforever.service.AdminService;
import top.forforever.service.PermissionService;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * @create: 2023/1/29
 * @Description:
 * @FileName: MyUserDetailService
 * @自定义内容：
 */
@Component
public class MyUserDetailService implements UserDetailsService {

    @Reference
    private AdminService adminService;

    @Reference
    private PermissionService permissionService;

    //登录时，SpringSecurity会自动调用该方法，并将用户名传入到该方法中
    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        //调用AdminService中根据用户名查询Admin对象的方法
        Admin admin = adminService.getAdminByUserName(username);
        if (admin == null) {
            throw new UsernameNotFoundException("用户名不存在");
        }
        /*
            给用户进行授权
                权限有两种表示方式：
                        1.通过角色的方式表示，列如：ROLE_ADMIN
                        2.直接设置权限，例如：Delete、Query、Update
         */
        //根据adminId查询分配的权限
        List<String> permissionCodes = permissionService.getPermissionCodeByAdminId(admin.getId());
        //创建GrantedAuthority对象存储permissionCodes，创建List集合也可以，除非数据库没有重复
        Set<GrantedAuthority> grantedAuthorities = new HashSet<>();//去重
        //遍历permissionCodes
        for (String permissionCode : permissionCodes) {
            if (!StringUtils.isEmpty(permissionCode)){
                //因为GrantedAuthority是一个接口，所有我们创建它的实现类SimpleGrantedAuthority
                SimpleGrantedAuthority grantedAuthority = new SimpleGrantedAuthority(permissionCode);
                grantedAuthorities.add(grantedAuthority);
            }
        }
//        return new User(username,admin.getPassword(), AuthorityUtils.commaSeparatedStringToAuthorityList(""));
        return new User(username,admin.getPassword(),grantedAuthorities);
    }
}
