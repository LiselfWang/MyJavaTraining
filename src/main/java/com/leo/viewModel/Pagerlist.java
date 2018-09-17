package com.leo.viewModel;

import java.util.List;

public class Pagerlist<B> {
int totalpage;
int pagesize = 10;
int pagenumber;
List<B> result;

public List<B> getResult() {
	return result;
}
public void setResult(List<B> result) {
	this.result = result;
}
public int getTotalpage() {
	return totalpage;
}
public void setTotalpage(int totalpage) {
	this.totalpage = totalpage;
}
public int getPagesize() {
	return pagesize;
}
public void setPagesize(int pagesize) {
	this.pagesize = pagesize;
}
public int getPagenumber() {
	return pagenumber;
}
public void setPagenumber(int pagenumber) {
	this.pagenumber = pagenumber;
}

}
