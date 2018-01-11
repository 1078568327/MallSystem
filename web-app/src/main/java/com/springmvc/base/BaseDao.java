package com.springmvc.base;

import java.util.List;

public interface BaseDao<E extends BaseEntity> {

    E getById(String id);

    E get(E entity);

    List<E> getByPage(E entity);

    void insert(E entity);

    void update(E entity);

    void delete(E entity);

}
