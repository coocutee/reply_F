package com.coo.domain;

public class Criteria {

	private int page;	
	private int perPageNum;
	
	public Criteria(){
		this.page = 1;
		this.perPageNum = 10;
	}

	public void setPage(int page){
		
		if(page <= 0){
			this.page = 1;
			return;
		}
		
		this.page = page;
	}
	
	public void setPerPageNum(int perPageNum){
		
		if(perPageNum <= 0 || perPageNum > 100){
			this.perPageNum = 10;
			return;
		}
		
		this.perPageNum = perPageNum;
	}
	
	public int getPage() {
		return page;
	}	
	
	//method for MyBatis SQL Mapper - 
	public int getPageStart() {
		
		return (this.page -1)* perPageNum;
	}
	
	//method for MyBatis SQL Mapper 
	public int getPerPageNum(){
		
		return this.perPageNum;
	}

	@Override
	public String toString() {
		return "Criteria [page=" + page + ", perPageNum=" + perPageNum + "]";
	}
}
	//for mybatis sql mapper :: limit구문에서 시작위치를 지정할 때 사용,
	//예를들어 10개씩 출력하는 경우 3페이지의 데이터는 limit 20,10과같은 형태가 되어야하므로
	// 시작데이터번호 = (페이지번호-1)*페이지당 보여지는 개수
//	public int getPageStart(){
//		return (this.page -1) * perPageNum;
//	}


