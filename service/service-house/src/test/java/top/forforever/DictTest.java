package top.forforever;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;
import top.forforever.dao.DictDao;
import top.forforever.entity.Dict;

import java.util.List;

/**
 * @create: 2023/1/23
 * @Description:
 * @FileName: DictTest
 * @自定义内容：
 */
@ContextConfiguration(locations = "classpath:spring/spring-dao.xml")
@RunWith(SpringRunner.class)
public class DictTest {

    @Autowired
    private DictDao dictDao;
    
    @Test
    public void testFindListByParentId(){
        List<Dict> listByParentId = dictDao.findListByParentId(1L);
        for (Dict dict : listByParentId) {
            System.out.println("dict = " + dict);
        }
    }

}
