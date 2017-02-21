package cn.edu.wic.bean;

public class Pagination {
	private Integer page = 1;              
	private Integer rows = 30;             // 一页30行  
	private Integer count;                 //数据库中用户表内多少行数
	private Integer total;                 //多少页数
	
	public Integer getPage() {
		return page;
	}
	public void setPage(Integer page) {
		this.page = page;
	}
	public Integer getRows() {
		return rows;
	}
	public void setRows(Integer rows) {
		this.rows = rows;
	}
	public Integer getCount() {
		return count;
	}
	public void setCount(Integer count) {
		this.count = count;
	}
	public Integer getTotal() {
		return total;
	}
	public void setTotal(Integer total) {
		this.total = total;
	}
}
