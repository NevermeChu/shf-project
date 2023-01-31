package top.forforever.controller;

import com.alibaba.dubbo.config.annotation.Reference;
import com.github.pagehelper.PageInfo;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import top.forforever.entity.*;
import top.forforever.result.Result;
import top.forforever.service.*;
import top.forforever.vo.HouseQueryVo;
import top.forforever.vo.HouseVo;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @create: 2023/1/25
 * @Description:
 * @FileName: HouseController
 * @自定义内容：
 */
@RestController
@RequestMapping("/house")
public class HouseController {

    @Reference
    private HouseService houseService;

    @Reference
    private CommunityService communityService;

    @Reference
    private HouseImageService houseImageService;

    @Reference
    private UserFollowService userFollowService;

    @Reference
    private HouseBrokerService houseBrokerService;

    @RequestMapping("/list/{pageNum}/{pageSize}")
    public Result findPageList(@PathVariable("pageNum")Integer pageNum,
                               @PathVariable("pageSize")Integer pageSize,
                               @RequestBody HouseQueryVo houseQueryVo){
        PageInfo<HouseVo> pageInfo = houseService.findPageList(pageNum,pageSize,houseQueryVo);
        return Result.ok(pageInfo);
    }

    @RequestMapping("/info/{id}")
    public Result info(@PathVariable("id")Long id, HttpSession session){
        //获取房源信息
        House house = houseService.getById(id);
        //获取小区信息
        Community community = communityService.getById(house.getCommunityId());
        //获取房源的房源图片
        List<HouseImage> houseImage1List = houseImageService.getHouseImagesByIdAndType(id, 1);
        //获取房源的经纪人
        List<HouseBroker> houseBrokerList = houseBrokerService.getHouseBrokersByHouseId(id);
        //创建map
        Map map = new HashMap();
        map.put("house",house);
        map.put("community",community);
        map.put("houseImage1List",houseImage1List);
        map.put("houseBrokerList",houseBrokerList);
        //设置一个变量
        Boolean isFollowed = false;
        UserInfo userInfo = (UserInfo) session.getAttribute("user");
        if (userInfo != null) {
            isFollowed = userFollowService.isFollowed(userInfo.getId(),id);
        }
        map.put("isFollow",isFollowed);
        return Result.ok(map);
    }
}
