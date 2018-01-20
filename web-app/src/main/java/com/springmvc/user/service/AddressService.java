package com.springmvc.user.service;

import com.springmvc.base.BaseService;
import com.springmvc.user.bean.Address;
import com.springmvc.user.dao.AddressDao;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class AddressService extends BaseService<Address,AddressDao> {

}
