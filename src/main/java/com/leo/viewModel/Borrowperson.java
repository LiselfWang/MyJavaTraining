package com.leo.viewModel;

import java.util.Date;

public class Borrowperson {
String name;
String classes;
String bookname;
Date borrowdate;
String id;

public Borrowperson(){
	this.id = java.util.UUID.randomUUID().toString();
	this.borrowdate = new Date();
}

public String getName() {
	return name;
}

public void setName(String name) {
	this.name = name;
}

public String getClasses() {
	return classes;
}

public void setClasses(String classes) {
	this.classes = classes;
}

public String getBookname() {
	return bookname;
}

public void setBookname(String bookname) {
	this.bookname = bookname;
}

public Date getBorrowdate() {
	return borrowdate;
}

public void setBorrowdate(Date borrowdate) {
	this.borrowdate = borrowdate;
}

public String getId() {
	return id;
}

public void setId(String id) {
	this.id = id;
}

}
