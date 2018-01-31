package com.springmvc.goods.service;

import com.springmvc.base.BaseService;
import com.springmvc.goods.bean.ShoppingCart;
import com.springmvc.goods.dao.ShoppingCartDao;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class ShoppingCartService extends BaseService<ShoppingCart,ShoppingCartDao> {

   public Integer getTotalNumber(ShoppingCart shoppingCart){
       return dao.getTotalNumber(shoppingCart);
   }

   public List<ShoppingCart> getAll(ShoppingCart shoppingCart){
       return dao.getAll(shoppingCart);
   }

   public void deleteRecord(ShoppingCart shoppingCart){
       dao.deleteRecord(shoppingCart);
   }
}
