package com.mycom.game.market.dto;

public class OrderDto {
	private int num;	//주문번호
	private String buyer;	//주문자 아이디
	private int code;	//상품번호
	private String addr;	//배송 주소
	private int money;	//주문자 사이버머니
	private int point;	//주문자 포인트

	public OrderDto() {}

	public OrderDto(int num, String buyer, int code, String addr, int money, int point) {
		super();
		this.num = num;
		this.buyer = buyer;
		this.code = code;
		this.addr = addr;
		this.money = money;
		this.point = point;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getBuyer() {
		return buyer;
	}

	public void setBuyer(String buyer) {
		this.buyer = buyer;
	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
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
