package top.forforever.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import top.forforever.dao.BaseDao;
import top.forforever.service.BaseService;
import top.forforever.util.CastUtil;

import java.io.Serializable;
import java.util.Map;

/**
 * @create: 2023/1/20
 * @Description:
 * @FileName: BaseServiceImpl
 * @自定义内容：
 */
@Transactional
public abstract class BaseServiceImpl<T> implements BaseService<T> {

    protected abstract BaseDao<T> getEntityDao();

    @Override
    public Integer insert(T t) {
        return getEntityDao().insert(t);
    }

    @Override
    public void delete(Serializable id) {
        getEntityDao().delete(id);
    }

    @Override
    public Integer update(T t) {
        return getEntityDao().update(t);
    }

    @Override
    public T getById(Serializable id) {
        return getEntityDao().getById(id);
    }

    @Override
    public PageInfo<T> findPage(Map<String, Object> filters) {
        int pageNum = CastUtil.castInt(filters.get("pageNum"), 1);
        int pageSize = CastUtil.castInt(filters.get("pageSize"), 10);
        //开启分页
        PageHelper.startPage(pageNum,pageSize);
        //获取集合
        Page<T> page = getEntityDao().findPage(filters);
        return new PageInfo<>(page,5);
    }
}
