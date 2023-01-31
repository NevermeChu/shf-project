package top.forforever.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

/**
 * @create: 2023/1/28
 * @Description:
 * @FileName: MySpringSecurityConfig
 * @自定义内容：
 */
@Configuration //声明当前类是一个配置类，注意：当前配置类也需要被扫描
@EnableWebSecurity //开启SpringSecurity的自动配置，会给我们生成一个登录页面
@EnableGlobalMethodSecurity(prePostEnabled = true) //开启Controller权限注解
public class MySpringSecurityConfig extends WebSecurityConfigurerAdapter {

    //在内存中设置一个认证的用户名和密码
    //重写configure(AuthenticationManagerBuilder auth
//    @Override
//    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
//        auth.inMemoryAuthentication()
//                .withUser("admin")
//                .password(new BCryptPasswordEncoder().encode("111111"))
//                .roles("");
//
//    }
    //必须指定加密方式，上下加密方式要一致
    //创建一个PasswordEncoder到ioc容器中
    @Bean
    public PasswordEncoder getPasswordEncoder(){
        return new BCryptPasswordEncoder();
    }

    //默认Spring Security不允许iframe嵌套显示，我们需要设置允许
    //重写configure(HttpSecurity http)
    @Override
    protected void configure(HttpSecurity http) throws Exception {
        //目前必须调用父类的configure方法，否则认证过程将失效 ,除非当前方法未实现认证
//        super.configure(http);
        //设置允许iframe标签访问
        http.headers().frameOptions().sameOrigin();
        //配置可以匿名访问的资源
        http.authorizeRequests()
                .antMatchers("/static/**","/login").permitAll() //配置允许请求可匿名访问
                .anyRequest().authenticated();//配置其他请求都要进行验证
        //自定义登录页面
        http.formLogin().loginPage("/login")//配置去自定义页面访问的请求路径
                        .defaultSuccessUrl("/");//配置登录成功之前去往的地址
        //配置登出的地址及登出成功之后去往的地址
        http.logout().logoutUrl("/logout").logoutSuccessUrl("/login");
        //关闭跨域请求伪造
        http.csrf().disable();

        //配置自定义的无权限访问的处理器
        http.exceptionHandling().accessDeniedHandler(new CustomAccessDeineHandler());
    }
}
