package com.springmvc.util.page;

/**
 * 分页工具类
 */

public class Page{

    private Object sortKey;  //排序关键字
    private int pageSize = 10;  //每一页的记录数量
    private int totalPage = 0;  //总页数
    private int totalRecord = 0;  //总记录数
    private int currentPage = 1;  //当前页
    private int startPage = 1;  //起始页
    private int endPage = 1;  //结束页

    private boolean isFirstPage = false;  //是否第一页
    private boolean isLastPage = false;  //是否最后一页
    private boolean hasNextPage = false;  //是否有下一页
    private boolean hasPreviousPage = false;  //是否有前一页

    public Page(){
        super();
    }

    public Page(Object sortKey, int totalRecord, int currentPage){
        init(sortKey,totalRecord,currentPage,this.pageSize);
    }

    public Page(Object sortKey, int totalRecord, int currentPage, int pageSize){
        init(sortKey,totalRecord,currentPage,pageSize);
    }

    /**
     * 初始化
     * @param sortKey
     * @param totalRecord
     * @param currentPage
     * @param pageSize
     */
    private void init(Object sortKey, int totalRecord, int currentPage, int pageSize){
        this.sortKey = sortKey;
        if(totalRecord > 0)
            this.totalRecord = totalRecord;
        if(pageSize > 0)
            this.pageSize = pageSize;

        //求总页数
        if(totalRecord > 0 && totalRecord % pageSize == 0){
            this.totalPage = totalRecord / pageSize;
        }else if(totalRecord > 0 && totalRecord % pageSize != 0){
            this.totalPage = totalRecord / pageSize + 1;
        }

        if(this.totalPage > 1){
            this.endPage = this.totalPage;
        }
        if(this.totalPage >= currentPage && currentPage > 1)
            this.currentPage = currentPage;

        //设置标识
        if(this.currentPage == 1 && this.currentPage == this.totalPage){
            this.isFirstPage = true;
            this.isLastPage = true;
        }else if(this.currentPage == 1 && this.currentPage < this.totalPage){
            this.isFirstPage = true;
            this.hasNextPage = true;
        }else if(this.currentPage != 1 && this.currentPage == this.totalPage){
            this.isLastPage = true;
            this.hasPreviousPage = true;
        }else if(this.currentPage != 1 && this.currentPage < this.totalPage){
            this.hasPreviousPage = true;
            this.hasNextPage = true;
        }

    }

    /**
     * 下一页
     * @return
     */
    public boolean toNextPage(){
        if(this.hasNextPage){
            this.currentPage++;
            if(this.isFirstPage){
                this.isFirstPage = false;
                this.hasPreviousPage = true;
            }
            if(this.currentPage == this.endPage){
                this.isLastPage = true;
                this.hasNextPage = false;
            }
            return true;
        }

        return false;
    }

    /**
     * 上一页
     * @return
     */
    public boolean toPreviousPage(){
        if(this.hasPreviousPage){
            this.currentPage--;
            if(this.isLastPage){
                this.isLastPage = false;
                this.hasNextPage = true;
            }
            if(this.currentPage == this.startPage){
                this.isFirstPage = true;
                this.hasPreviousPage = false;
            }
            return true;
        }

        return false;
    }

    /**
     * 跳转到指定页面
     * @param pageNumber
     * @return
     */
    public boolean toSpecifyPage(int pageNumber){
        if(pageNumber > 0 && pageNumber <= this.totalPage){
            this.currentPage = pageNumber;
            if(pageNumber == 1 && pageNumber == this.totalPage){
                this.isFirstPage = true;
                this.isLastPage = true;
                this.hasPreviousPage = false;
                this.hasNextPage = false;
            }else if(pageNumber == 1 && pageNumber != this.totalPage){
                this.isFirstPage = true;
                this.isLastPage = false;
                this.hasPreviousPage = false;
                this.hasNextPage = true;
            }else if(pageNumber != 1 && pageNumber == this.totalPage){
                this.isFirstPage = false;
                this.isLastPage = true;
                this.hasPreviousPage = true;
                this.hasNextPage = false;
            }else if(pageNumber != 1 && pageNumber != this.totalPage){
                this.isFirstPage = false;
                this.isLastPage = false;
                this.hasPreviousPage = true;
                this.hasNextPage = true;
            }
            return true;
        }

        return false;
    }

    /**
     * 跳转至首页
     * @return
     */
    public void toFirstPage(){
        this.currentPage = 1;
        this.isFirstPage = true;
        this.hasPreviousPage = false;
        if(this.currentPage == this.totalPage){
            this.isLastPage = true;
            this.hasNextPage = false;
        }else{
            this.isLastPage = false;
            this.hasNextPage = true;
        }
    }

    /**
     * 跳转至末页
     * @return
     */
    public void toLastPage(){
        this.currentPage = this.totalPage;
        this.isLastPage = true;
        this.hasNextPage = false;
        if(this.currentPage == this.startPage){
            this.isFirstPage = true;
            this.hasPreviousPage = false;
        }else{
            this.isFirstPage = false;
            this.hasPreviousPage = true;
        }

    }

    @Override
    public String toString() {
        return "Page{" +
                "sortKey=" + sortKey +
                ", pageSize=" + pageSize +
                ", totalPage=" + totalPage +
                ", totalRecord=" + totalRecord +
                ", currentPage=" + currentPage +
                ", startPage=" + startPage +
                ", endPage=" + endPage +
                ", isFirstPage=" + isFirstPage +
                ", isLastPage=" + isLastPage +
                ", hasNextPage=" + hasNextPage +
                ", hasPreviousPage=" + hasPreviousPage +
                '}';
    }

    public Object getSortKey() {
        return sortKey;
    }

    public void setSortKey(Object sortKey) {
        this.sortKey = sortKey;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }

    public int getTotalRecord() {
        return totalRecord;
    }

    public void setTotalRecord(int totalRecord) {
        this.totalRecord = totalRecord;
    }

    public int getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }

    public int getStartPage() {
        return startPage;
    }

    public void setStartPage(int startPage) {
        this.startPage = startPage;
    }

    public int getEndPage() {
        return endPage;
    }

    public void setEndPage(int endPage) {
        this.endPage = endPage;
    }

    public boolean isFirstPage() {
        return isFirstPage;
    }

    public void setFirstPage(boolean firstPage) {
        isFirstPage = firstPage;
    }

    public boolean isLastPage() {
        return isLastPage;
    }

    public void setLastPage(boolean lastPage) {
        isLastPage = lastPage;
    }

    public boolean isHasNextPage() {
        return hasNextPage;
    }

    public void setHasNextPage(boolean hasNextPage) {
        this.hasNextPage = hasNextPage;
    }

    public boolean isHasPreviousPage() {
        return hasPreviousPage;
    }

    public void setHasPreviousPage(boolean hasPreviousPage) {
        this.hasPreviousPage = hasPreviousPage;
    }
}

