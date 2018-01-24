package com.springmvc.user.dao;

import com.springmvc.base.BaseDao;
import com.springmvc.user.bean.ShippingAddress;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ShippingAddressDao extends BaseDao<ShippingAddress> {

    List<ShippingAddress> getAll(ShippingAddress shippingAddress);

}
