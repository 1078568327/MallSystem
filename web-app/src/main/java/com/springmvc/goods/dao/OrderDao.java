package com.springmvc.goods.dao;

import com.springmvc.base.BaseDao;
import com.springmvc.goods.bean.Order;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface OrderDao extends BaseDao<Order> {

    Order getOrderNum(Order order);

    void updateOrderStatus(Order order);

    List<Order> getAll(Order order);

    Integer getAmountOfOrderStatus(Order order);

}
