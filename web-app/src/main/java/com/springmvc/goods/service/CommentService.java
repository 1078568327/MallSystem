package com.springmvc.goods.service;

import com.springmvc.base.BaseService;
import com.springmvc.goods.bean.Comment;
import com.springmvc.goods.dao.CommentDao;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class CommentService extends BaseService<Comment,CommentDao> {

    public Integer getAmountOfComment(Comment comment){
        return dao.getAmountOfComment(comment);
    }

    public List<Comment> getAll(Comment comment){
        return dao.getAll(comment);
    }
}
