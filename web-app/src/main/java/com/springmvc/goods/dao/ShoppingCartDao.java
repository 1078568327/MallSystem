package com.springmvc.goods.dao;

import com.springmvc.base.BaseDao;
import com.springmvc.goods.bean.ShoppingCart;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ShoppingCartDao extends BaseDao<ShoppingCart> {

    Integer getTotalNumber(ShoppingCart shoppingCart);

    List<ShoppingCart> getAll(ShoppingCart shoppingCart);

    void deleteRecord(ShoppingCart shoppingCart);
}
