package top.forforever.service;

import com.github.pagehelper.PageInfo;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

/**
 * @create: 2023/1/20
 * @Description:
 * @FileName: BaseService
 * @自定义内容：
 */
public interface BaseService<T> {

    Integer insert(T t);

    void delete(Serializable id);

    Integer update(T t);

    T getById(Serializable id);

    PageInfo<T> findPage(Map<String,Object> filters);
}
