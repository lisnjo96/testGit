package com.mycom.game.users.dto;

public class UsersDto {
	private String id;
	private String pwd;
	private String email;
	private String regdate;
	private int money;	//주문자 사이버머니
	private int point;	//주문자 포인트
	
	public UsersDto() {}

	public UsersDto(String id, String pwd, String email, String regdate, int money, int point) {
		super();
		this.id = id;
		this.pwd = pwd;
		this.email = email;
		this.regdate = regdate;
		this.money = money;
		this.point = point;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public int getMoney() {
		return money;
	}

	public void setMoney(int money) {
		this.money = money;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}
}
