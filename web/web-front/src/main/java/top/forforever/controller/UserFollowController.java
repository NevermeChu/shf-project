package top.forforever.controller;

import com.alibaba.dubbo.config.annotation.Reference;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import top.forforever.entity.UserInfo;
import top.forforever.result.Result;
import top.forforever.service.UserFollowService;
import top.forforever.vo.UserFollowVo;

import javax.servlet.http.HttpSession;

/**
 * @create: 2023/1/27
 * @Description:
 * @FileName: UserFollowController
 * @自定义内容：
 */
@RestController
@RequestMapping("/userFollow")
public class UserFollowController {

    @Reference
    private UserFollowService userFollowService;

    //关注房源
    @RequestMapping("/auth/follow/{houseId}")
    public Result follow(@PathVariable("houseId")Long houseId, HttpSession session){
        //获取userInfo对象
        UserInfo userInfo = (UserInfo) session.getAttribute("user");
        //调用service方法
        userFollowService.follow(userInfo.getId(),houseId);
        return Result.ok();
    }

    //查询我的关注
    @RequestMapping("/auth/list/{pageNum}/{pageSize}")
    public Result myFollowed(@PathVariable("pageNum")Integer pageNum,
                             @PathVariable("pageSize")Integer pageSize,
                             HttpSession session){
        //获取userInfo
        UserInfo userInfo = (UserInfo) session.getAttribute("user");
        PageInfo<UserFollowVo> pageInfo = userFollowService.findPageList(pageNum,pageSize,userInfo.getId());
        return Result.ok(pageInfo);
    }

    //取消关注
    @RequestMapping("/auth/cancelFollow/{id}")
    public Result cancelFollow(@PathVariable("id")Long id){
        userFollowService.delete(id);
        return Result.ok();
    }
}
