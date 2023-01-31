package top.forforever.controller;

import com.alibaba.dubbo.config.annotation.Reference;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import top.forforever.entity.HouseUser;
import top.forforever.service.HouseUserService;

import java.util.Map;

/**
 * @create: 2023/1/24
 * @Description:
 * @FileName: HouseUserController
 * @自定义内容：
 */
@Controller
@RequestMapping("/houseUser")
public class HouseUserController {

    private final static String SUCCESS_PAGE = "common/successPage";

    @Reference
    private HouseUserService houseUserService;

    //去新增房东页面
    @RequestMapping("/create")
    public String goSavePage(Long houseId, Map map){
        map.put("houseId",houseId);
        return "houseUser/create";
    }

    //新增房东
    @RequestMapping("/save")
    @PreAuthorize("hasAuthority('house.editUser')")
    public String save(HouseUser houseUser){
        houseUserService.insert(houseUser);
        return SUCCESS_PAGE;
    }

    //去修改页面
    @RequestMapping("/edit/{id}")
    public String goEditPage(@PathVariable("id") Long id,Map map){
        HouseUser houseUser = houseUserService.getById(id);
        map.put("houseUser",houseUser);
        return "houseUser/edit";
    }

    //更新房东信息
    @RequestMapping("/update")
    @PreAuthorize("hasAuthority('house.editUser')")
    public String update(HouseUser houseUser){
        houseUserService.update(houseUser);
        return SUCCESS_PAGE;
    }

    //删除房东
    @RequestMapping("/delete/{houseId}/{id}")
    @PreAuthorize("hasAuthority('house.delete')")
    public String delete(@PathVariable("houseId")Long houseId,
                         @PathVariable("id") Long id) {
        houseUserService.delete(id);
        return "redirect:/house/"+houseId;
    }
}
