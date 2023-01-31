package top.forforever.interceptor;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import top.forforever.entity.UserInfo;
import top.forforever.result.Result;
import top.forforever.result.ResultCodeEnum;
import top.forforever.util.WebUtil;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @create: 2023/1/27
 * @Description:
 * @FileName: LoginInterceptor
 * @自定义内容：
 */
public class LoginInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        //判断session域中是否存储userInfo
        UserInfo userInfo = (UserInfo) request.getSession().getAttribute("user");
        //证明为登录
        if (userInfo == null) {
            //设置未登录信息
            Result<String> result = Result.build("还没有登录", ResultCodeEnum.LOGIN_AUTH);
            //响应信息给前端
            WebUtil.writeJSON(response,result);
            return false;
        }
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {

    }
}
