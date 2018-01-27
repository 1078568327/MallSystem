package com.springmvc.goods.dao;

import com.springmvc.base.BaseDao;
import com.springmvc.goods.bean.Order;
import org.springframework.stereotype.Repository;

@Repository
public interface OrderDao extends BaseDao<Order> {

    Order getOrderNum(Order order);

}
