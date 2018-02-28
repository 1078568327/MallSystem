package com.springmvc.goods.service;

import com.springmvc.base.BaseService;
import com.springmvc.goods.bean.Goods;
import com.springmvc.goods.bean.Order;
import com.springmvc.goods.bean.Stock;
import com.springmvc.goods.dao.OrderDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class OrderService extends BaseService<Order,OrderDao> {

    @Autowired
    private StockService stockService;

    public boolean createOrder(Order order){

        Stock stock = new Stock();
        stock.setGoods(order.getGoods());
        if(stockService.selectForUpdate(stock)){
            this.save(order);
            return true;
        }

        return false;
    }

    public Order getOrderNum(Order order){
        return dao.getOrderNum(order);
    }

    public void updateOrderStatus(Order order){
        dao.updateOrderStatus(order);
    }

    public List<Order> getAll(Order order){
        return dao.getAll(order);
    }

    public Integer getAmountOfOrderStatus(Order order){
        return dao.getAmountOfOrderStatus(order);
    }

    public List<Order> getRefundOrder(Order order) {
        return dao.getRefundOrder(order);
    }

}
