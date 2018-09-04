package com.mycom.game.market.dao;

import com.mycom.game.market.dto.OrderDto;

public interface OrderDao {
	public void addOrder(OrderDto dto);	//배송 정보를 추가하는 메소드
	public void plusMoney(OrderDto dto); //회원에게 돈을 추가하는 메소드
	public int getMoney(String buyer);
}
