package com.springmvc.goods.dao;

import com.springmvc.base.BaseDao;
import com.springmvc.goods.bean.Goods;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface GoodsDao extends BaseDao<Goods> {

    List<Goods> hotProdByPage(Goods goods);

}
