package com.springmvc.goods.service;

import com.springmvc.base.BaseService;
import com.springmvc.goods.bean.Stock;
import com.springmvc.goods.dao.StockDao;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class StockService extends BaseService<Stock,StockDao> {

}
