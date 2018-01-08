package com.springmvc.base;

import com.springmvc.util.page.Page;

import java.io.Serializable;


public class BaseEntity implements Serializable{

    private String id;
    private Page page;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Page getPage() {
        return page;
    }

    public void setPage(Page page) {
        this.page = page;
    }
}
