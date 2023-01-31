package top.forforever.dao;

import com.github.pagehelper.Page;

import java.io.Serializable;
import java.util.Map;

/**
 * @create: 2023/1/20
 * @Description:
 * @FileName: BaseDao
 * @自定义内容：
 */
public interface BaseDao<T> {

    /**
     * 新增
     * 保存一个实体类
     * @param t
     * @return
     */
    Integer insert(T t);

    /**
     * 带id删除
     * Long，Integer 继承了 Serializable
     * @param id 标识ID 可以是自增长ID，也可以是唯一标识。
     */
    void delete(Serializable id);

    /**
     * 更新一个实体
     * @param t
     * @return
     */
    Integer update(T t);

    /**
     * 通过一个标识ID 获取一个唯一实体
     * @param id 标识ID 可以是自增长ID，也可以是唯一标识。
     * @return
     */
    T getById(Serializable id);

    /**
     * 查询所有且带分页功能
     * @param filters 带参数
     * @return
     */
    Page<T> findPage(Map<String,Object> filters);

}
