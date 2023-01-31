package top.forforever.controller;

import com.alibaba.dubbo.config.annotation.Reference;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import top.forforever.entity.House;
import top.forforever.entity.HouseImage;
import top.forforever.result.Result;
import top.forforever.service.HouseImageService;
import top.forforever.service.HouseService;
import top.forforever.util.QiniuUtil;

import java.io.IOException;
import java.util.Map;
import java.util.UUID;

/**
 * @create: 2023/1/24
 * @Description:
 * @FileName: HouseImageController
 * @自定义内容：
 */
@Controller
@RequestMapping("/houseImage")
public class HouseImageController {

    @Reference
    private HouseImageService houseImageService;

    @Reference
    private HouseService houseService;

    @RequestMapping("/uploadShow/{houseId}/{type}")
    public String goUploadPage(@PathVariable("houseId")Long houseId,
                               @PathVariable("type")Integer type, Map map){
        map.put("houseId",houseId);
        map.put("type",type);
        return "house/upload";
    }

    //上传房源或房产图片
    @RequestMapping("/upload/{houseId}/{type}")
    @ResponseBody
    @PreAuthorize("hasAuthority('house.editImage')")
    public Result upload(@PathVariable("houseId")Long houseId,
                         @PathVariable("type")Integer type,
                         @RequestParam("file")MultipartFile[] files){
        try {
            if (files != null && files.length > 0){
                for (MultipartFile file : files) {
                    //获取字节数组
                    byte[] bytes = file.getBytes();
                    //获取图片名字
                    String filename = file.getOriginalFilename();
                    //通过UUID随机生成一个字符串作为图片的名字
                    String newFileName = UUID.randomUUID().toString().replace("-","");
                    //通过QiniuUtil工具类上传图片到七牛云
                    QiniuUtil.upload2Qiniu(bytes,newFileName);
                    //图片路径
                    String url = "http://rozti2kdd.hn-bkt.clouddn.com/"+newFileName;
                    //创建HouseImage对象
                    HouseImage houseImage = new HouseImage();
                    houseImage.setHouseId(houseId);
                    houseImage.setType(type);
                    houseImage.setImageName(filename);
                    //设置图片的路径，路径的格式：http://七牛云的域名/随机生成的图片名字
                    houseImage.setImageUrl(url);
                    //保存到数据库
                    houseImageService.insert(houseImage);
                }
            }

        } catch (IOException e) {
            e.printStackTrace();
        }

        return Result.ok();
    }

    //删除房源或房产图片
    @RequestMapping("/delete/{houseId}/{id}")
    public String delete(@PathVariable("houseId")Long houseId,
                         @PathVariable("id")Long id){
        houseImageService.delete(id);
        return "redirect:/house/"+houseId;
    }

}
