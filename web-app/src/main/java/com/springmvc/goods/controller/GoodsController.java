package com.springmvc.goods.controller;

import com.springmvc.goods.service.GoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping(value = "/pub/goods")
public class GoodsController {

    @Autowired
    private GoodsService goodsService;



}
