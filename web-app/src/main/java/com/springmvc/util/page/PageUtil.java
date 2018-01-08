package com.springmvc.util.page;

public class PageUtil {

    public static Page createPage(){
        return new Page();
    }

    public static Page createPage(Object sortKey, int totalRecord, int currentPage){
        return new Page(sortKey,totalRecord,currentPage);
    }

    public static Page createPage(Object sortKey, int totalRecord, int currentPage, int pageSize){
        return new Page(sortKey,totalRecord,currentPage,pageSize);
    }

}
