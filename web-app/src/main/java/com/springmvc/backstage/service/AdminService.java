package com.springmvc.backstage.service;

import com.springmvc.backstage.bean.Admin;
import com.springmvc.backstage.dao.AdminDao;
import com.springmvc.base.BaseService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class AdminService extends BaseService<Admin,AdminDao> {

}
