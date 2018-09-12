package com.leo.viewModel;

import java.util.ArrayList;

public class QuaryPage<I> {
int totalpage;
int pagesize = 10;
int pagenumber;
int totalcount;
ArrayList<I> result;

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
public int getTotalcount() {
	return totalcount;
}
public void setTotalcount(int totalcount) {
	this.totalcount = totalcount;
}
public ArrayList<I> getResult() {
	return result;
}
public void setResult(ArrayList<I> result) {
	this.result = result;
}

}
