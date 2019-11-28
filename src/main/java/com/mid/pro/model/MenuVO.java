package com.mid.pro.model;

import java.util.List;

public class MenuVO {
	
	private int menu_num;
	private String name;
	private String contents;
	private String price;
	private String origin;
	private int rest_num;
	private List<FilesVO> flies;
	
	public int getMenu_num() {
		return menu_num;
	}
	public void setMenu_num(int menu_num) {
		this.menu_num = menu_num;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getOrigin() {
		return origin;
	}
	public void setOrigin(String origin) {
		this.origin = origin;
	}
	public int getRest_num() {
		return rest_num;
	}
	public void setRest_num(int rest_num) {
		this.rest_num = rest_num;
	}
	public List<FilesVO> getFlies() {
		return flies;
	}
	public void setFlies(List<FilesVO> flies) {
		this.flies = flies;
	}
	
}