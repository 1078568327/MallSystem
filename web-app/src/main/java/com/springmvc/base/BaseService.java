package com.springmvc.base;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.UUID;

@Transactional
public abstract class BaseService<E extends BaseEntity, D extends BaseDao<E>> {

    @Autowired
    private D dao;
    private Logger logger = LoggerFactory.getLogger(this.getClass());

    public D getDao() {
        return dao;
    }
    public void setDao(D dao) {
        this.dao = dao;
    }
    public void setLogger(Logger logger) {
        this.logger = logger;
    }
    public Logger getLogger(){
        return logger;
    }

    /**
     * 通过id查询
     * @param id
     * @return
     */
    public E queryById(String id) {
        return dao.getById(id);
    }

    /**
     * 查询
     * @param entity
     * @return
     */
    public E query(E entity){
        return dao.get(entity);
    }

    /**
     * 分页查询
     * @param entity
     * @return
     */
    public List<E> queryByPage(E entity){
        return dao.findByPage(entity);
    }

    /**
     * 若存在则更新，否则添加
     * @param entity
     */
    public void save(E entity){
        if(entity.getId() == null || "".equals(entity.getId())){
            entity.setId(UUID.randomUUID().toString());
            dao.insert(entity);
            return;
        }
        E result = dao.getById(entity.getId());
        if(result != null){
            dao.update(entity);
        }else{
            dao.insert(entity);
        }

    }

    /**
     * 删除
     * @param entity
     */
    public void delete(E entity){
        dao.delete(entity);
    }

}
