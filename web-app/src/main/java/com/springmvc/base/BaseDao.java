package com.springmvc.base;

import java.util.List;

public interface BaseDao<E extends BaseEntity> {

    E getById(String id);

    E get(E entity);

    void insert(E entity);

    void update(E entity);

    void delete(E entity);

    List<E> findByPage(E entity);

}
