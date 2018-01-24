package com.springmvc.user.service;

import com.springmvc.base.BaseService;
import com.springmvc.user.bean.ShippingAddress;
import com.springmvc.user.dao.ShippingAddressDao;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class ShippingAddressService extends BaseService<ShippingAddress,ShippingAddressDao> {

    public List<ShippingAddress> getAll(ShippingAddress shippingAddress){
        return dao.getAll(shippingAddress);
    }

}
