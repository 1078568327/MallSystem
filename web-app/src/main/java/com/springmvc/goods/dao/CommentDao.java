package com.springmvc.goods.dao;

import com.springmvc.base.BaseDao;
import com.springmvc.goods.bean.Comment;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CommentDao extends BaseDao<Comment> {

    Integer getAmountOfComment(Comment comment);

    List<Comment> getAll(Comment comment);

}
