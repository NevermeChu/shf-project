package top.forforever.controller;

import com.alibaba.dubbo.config.annotation.Reference;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import top.forforever.entity.UserInfo;
import top.forforever.result.Result;
import top.forforever.result.ResultCodeEnum;
import top.forforever.service.UserInfoService;
import top.forforever.util.MD5;
import top.forforever.vo.LoginVo;
import top.forforever.vo.RegisterVo;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

/**
 * @create: 2023/1/25
 * @Description:
 * @FileName: UserInfoController
 * @自定义内容：
 */
@RestController
@RequestMapping("/userInfo")
public class UserInfoController {

    @Reference
    private UserInfoService userInfoService;

    @RequestMapping("/sendCode/{phone}")
    public Result sendCode(@PathVariable("phone") String phone, HttpSession session){
        //设置验证码为6666
        String code = "6666";
        //将验证码放到Session域中
        session.setAttribute("code",code);
        //将验证码响应到前端
        return Result.ok(code);
    }

    @RequestMapping("/register")
    public Result register(@RequestBody RegisterVo registerVo,HttpSession session){
        //获取手机号码、密码、用户名
        String phone = registerVo.getPhone().trim();
        String password = registerVo.getPassword().trim();
        String nickName = registerVo.getNickName().trim();
        String code = registerVo.getCode().trim();
        //验空
        if (StringUtils.isEmpty(phone) || StringUtils.isEmpty(password) || StringUtils.isEmpty(nickName) || StringUtils.isEmpty(code)){
            //返回参数错误的信息
            return Result.build(null, ResultCodeEnum.PARAM_ERROR);
        }
        //从Session域中获取验证码
        String sessionCode = (String) session.getAttribute("code");
        //判断验证码是否正确
        if (!code.equals(sessionCode)){
            //返回验证码错误的信息
            return Result.build(null,ResultCodeEnum.CODE_ERROR);
        }
        //调用UserInfoService方法判断该手机号是否注册
        UserInfo user = userInfoService.getUserInfoByPhone(phone);
        if (user != null){
            return Result.build(null,ResultCodeEnum.PHONE_REGISTER_ERROR);
        }
        //设置到UserInfo对象中
        UserInfo userInfo = new UserInfo();
        userInfo.setPhone(phone);
        userInfo.setPassword(MD5.encrypt(password));
        userInfo.setNickName(nickName);
        userInfo.setStatus(1);
        //调用方法注册用户
        userInfoService.insert(userInfo);
        return Result.ok();
    }

    @RequestMapping("/login")
    public Result login(@RequestBody LoginVo loginVo,HttpSession session){
        //获取手机号和密码
        String phone = loginVo.getPhone().trim();
        String password = loginVo.getPassword().trim();
        //验空
        if (StringUtils.isEmpty(phone) || StringUtils.isEmpty(password)){
            return Result.build(null,ResultCodeEnum.PARAM_ERROR);
        }
        //根据手机号查询用户信息
        UserInfo userInfo = userInfoService.getUserInfoByPhone(phone);
        if (userInfo == null){
            //账号不正确
            return Result.build(null,ResultCodeEnum.ACCOUNT_ERROR);
        }
        //判断密码是否正确
        if (!MD5.encrypt(password).equals(userInfo.getPassword())) {
            return Result.build(null,ResultCodeEnum.PASSWORD_ERROR);
        }
        //判断用户是否被锁定
        if (userInfo.getStatus() == 0){
            return Result.build(null,ResultCodeEnum.ACCOUNT_LOCK_ERROR);
        }
        //登录成功，将用户数据放到session域中
        session.setAttribute("user",userInfo);
        //创建一个Map，Map中必须设置一个nickName的key，值是用户的昵称
        Map map = new HashMap();
        map.put("nickName",userInfo.getNickName());
        map.put("phone",phone);
        return Result.ok(map);
    }

    @RequestMapping("/logout")
    public Result logout(HttpSession session){
        session.removeAttribute("user");
        return Result.ok();
    }

}
