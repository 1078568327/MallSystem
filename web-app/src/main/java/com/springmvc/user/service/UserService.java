package com.springmvc.user.service;

import com.springmvc.base.BaseService;
import com.springmvc.user.bean.User;
import com.springmvc.user.dao.UserDao;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class UserService extends BaseService<User,UserDao>{

}
