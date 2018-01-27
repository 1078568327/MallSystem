package com.springmvc.goods.service;

import com.springmvc.base.BaseService;
import com.springmvc.goods.bean.Goods;
import com.springmvc.goods.bean.Stock;
import com.springmvc.goods.dao.StockDao;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;

@Service
@Transactional
public class StockService extends BaseService<Stock,StockDao> {

    public boolean selectForUpdate(Stock stock){
        Stock stk = dao.selectForUpdate(stock);
        if(stk == null){
            return false;
        }

        int goodsStock = stk.getGoodsStock();
        if(goodsStock > 0){
            goodsStock--;
            stk.setGoodsStock(goodsStock)
                    .setUpdateTime(new Date());
            this.save(stk);
            return true;
        }

        return false;
    }

}
