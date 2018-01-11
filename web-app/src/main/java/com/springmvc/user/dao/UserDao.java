package com.springmvc.user.dao;

import com.springmvc.base.BaseDao;
import com.springmvc.user.bean.User;
import org.springframework.stereotype.Repository;

@Repository
public interface UserDao extends BaseDao<User> {

}
