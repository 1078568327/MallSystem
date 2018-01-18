package com.springmvc.goods.service;

import com.springmvc.base.BaseService;
import com.springmvc.goods.bean.Goods;
import com.springmvc.goods.dao.GoodsDao;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class GoodsService extends BaseService<Goods,GoodsDao> {

    public List<Goods> hotProdByPage(Goods goods){
        return dao.hotProdByPage(goods);
    }

}
