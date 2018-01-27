package com.springmvc.goods.dao;

import com.fasterxml.jackson.databind.ser.Serializers;
import com.springmvc.base.BaseDao;
import com.springmvc.goods.bean.Goods;
import com.springmvc.goods.bean.Stock;
import org.springframework.stereotype.Repository;

@Repository
public interface StockDao extends BaseDao<Stock> {

    Stock selectForUpdate(Stock stock);

}
