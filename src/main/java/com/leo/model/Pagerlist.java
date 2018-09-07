package com.leo.model;

import java.util.ArrayList;

public class Pagerlist<B> {
int totalpage;
int pagesize = 10;
int pagenumber;
ArrayList<B> result;

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
public ArrayList<B> getResult() {
	return result;
}
public void setResult(ArrayList<B> result) {
	this.result = result;
}

}
