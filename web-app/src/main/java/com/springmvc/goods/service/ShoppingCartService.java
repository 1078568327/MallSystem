package com.springmvc.goods.service;

import com.springmvc.base.BaseService;
import com.springmvc.goods.bean.ShoppingCart;
import com.springmvc.goods.dao.ShoppingCartDao;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class ShoppingCartService extends BaseService<ShoppingCart,ShoppingCartDao> {

}
