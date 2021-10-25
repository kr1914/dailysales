package com.daily.dto;

public class Paging {
    /** 한 페이지당 게시글 수 **/
    private int pageSize = 15;
    
    /** 현재 페이지 좌우로 보여질 페이지 넘버 개수(좌우 각각)**/
    private int rangeSize = 5;
    
    /** 현재 페이지 **/
    private int curPage = 1;
    
    /** 총 게시글 수 **/
    private int listCnt;
    
    /** 총 페이지 수 **/
    private int pageCnt;
    
    /** 시작 페이지 **/
    private int startPage = 1;
    
    /** 끝 페이지 **/
    private int endPage = 1;
    
    /** 시작 index **/
    private int startIndex = 0;
    
    /** 이전 페이지 **/
    private int prevPage;
    
    /** 다음 페이지 **/
    private int nextPage;


	//생성자
    public Paging (int totalArticle, int page) {
    	setListCnt(totalArticle);
    	
    	//현재 페이지
    	setCurPage(page);
    	
    	//페이지 숫자
    	setPageCnt((int)Math.ceil(totalArticle*1.0/pageSize));
    	
    	//마지막 페이지
    	setEndPage(getPageCnt());
    	
    	
    	//앞뒤 페이지 세팅
    	if(page<=1) {
    		setPrevPage(0);
    		if(this.endPage >=2) {
    			setNextPage(2);
    		}else {
    			setNextPage(1);
    		}
    	}else {
    		setPrevPage(page-1);
    		if(page != this.endPage) {
    			setNextPage(page+1);
    		}else {
    			setNextPage(page);
    		}
    	}
    }
    
    public void setPages(int totalArticle, int page) {
    	setListCnt(totalArticle);
    	
    	//현재 페이지
    	setCurPage(page);
    	
    	//페이지 숫자
    	setPageCnt((int)Math.ceil(totalArticle*1.0/pageSize));
    	
    	//마지막 페이지
    	setEndPage(getPageCnt());
    	
    	
    	//앞뒤 페이지 세팅
    	if(page<=1) {
    		setPrevPage(0);
    		if(this.endPage >=2) {
    			setNextPage(2);
    		}else {
    			setNextPage(1);
    		}
    	}else {
    		setPrevPage(page-1);
    		if(page != this.endPage) {
    			setNextPage(page+1);
    		}else {
    			setNextPage(page);
    		}
    	}
    }
    

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getRangeSize() {
		return rangeSize;
	}

	public void setRangeSize(int rangeSize) {
		this.rangeSize = rangeSize;
	}

	public int getCurPage() {
		return curPage;
	}

	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}

	public int getListCnt() {
		return listCnt;
	}

	public void setListCnt(int listCnt) {
		this.listCnt = listCnt;
	}

	public int getPageCnt() {
		return pageCnt;
	}

	public void setPageCnt(int pageCnt) {
		this.pageCnt = pageCnt;
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

	public int getStartIndex() {
		return startIndex;
	}

	public void setStartIndex(int startIndex) {
		this.startIndex = startIndex;
	}

	public int getPrevPage() {
		return prevPage;
	}

	public void setPrevPage(int prevPage) {
		this.prevPage = prevPage;
	}

	public int getNextPage() {
		return nextPage;
	}

	public void setNextPage(int nextPage) {
		this.nextPage = nextPage;
	}
    
    
}
