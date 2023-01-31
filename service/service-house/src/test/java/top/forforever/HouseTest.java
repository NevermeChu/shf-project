package top.forforever;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;
import top.forforever.dao.HouseDao;

/**
 * @create: 2023/1/23
 * @Description:
 * @FileName: HouseTest
 * @自定义内容：
 */
@ContextConfiguration(locations = "classpath:spring/spring-dao.xml")
@RunWith(SpringRunner.class)
public class HouseTest {

    @Autowired
    private HouseDao houseDao;

}
