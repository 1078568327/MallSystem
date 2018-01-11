package com.springmvc.user.service;

import com.springmvc.base.BaseService;
import com.springmvc.user.bean.CookieBean;
import com.springmvc.user.dao.CookieDao;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class CookieService extends BaseService<CookieBean,CookieDao> {

}
