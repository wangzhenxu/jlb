package com.loiot.baqi.controller.response;

import java.util.List;

import lombok.Data;

/**
 * 分页器。
 * 
 * @author zhengrj
 * 
 */
@Data
public class Pager<T> {

    /**
     * 当前页索引,默认是1.
     */
    private int pageIndex = 0;
    /**
     * 每页的记录容量,默认是10.
     */
    private int pageSize = 5;
    /**
     * 总页数
     */
    private int pageCount;
    /**
     * 分页数据
     */
    private List<T> data;

    /**
     * 总记录数，默认是0
     */
    private int totalResults = 0;
    /**
     * 构造一个分页器。
     * 
     * @param totalResults 总条数
     * @param pageIndex 起始索引
     */
    public Pager(int totalResults, int pageIndex) {
        setTotalResults(totalResults);
        setPageIndex(pageIndex);
    }

    /**
     * 设置总记录数
     */
    public void setTotalResults(int totalResults) {
    	this.totalResults = totalResults;
        if (totalResults % pageSize == 0) {
            pageCount = totalResults / pageSize;
        } else {
            pageCount = totalResults / pageSize + 1;
        }
    }

    /**
     * 设置分页器当前页。
     * 
     * @param pageIndex 分页器当前索引页。
     */
    public void setPageIndex(int pageIndex) {
        if (pageIndex > pageCount) {
            this.pageIndex = pageCount;
        } else {
            this.pageIndex = pageIndex;
        }
    }

    /**
     * 返回跳过的页数
     * 
     * @return
     */
    public int getSkipResults() {
        return pageIndex * pageSize;
    };

    /**
     * 最大记录数
     * 
     * @return 返回每页的记录容量
     */
    public int getMaxResults() {
        return pageSize;
    };
}
