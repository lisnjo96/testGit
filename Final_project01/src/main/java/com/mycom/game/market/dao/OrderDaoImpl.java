package com.mycom.game.market.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mycom.game.exception.NodeliveryException;
import com.mycom.game.market.dto.MarketDto;
import com.mycom.game.market.dto.OrderDto;

@Repository
public class OrderDaoImpl implements OrderDao{
	
	@Autowired
	private SqlSession session;
	
	@Override
	public void addOrder(OrderDto dto) {
		//인자로 전달되는 주문정보(배송정보)를 저장하기
		session.insert("market.addOrder",dto);
		
		//특정 조건에서 예외를 발생시켜야 하는 겨우
		//DataAccessException 클래스를 상속받은 예외를 발생 시킨다.
		throw new NodeliveryException("해당 지역은 배송 불가 지역");
		
	}
	
	@Override
	public void plusMoney(OrderDto dto) {
		session.insert("market.plusMoney", dto);
	}

	@Override
	public int getMoney(String buyer) {
		return session.selectOne("market.getMoney", buyer);
	}

}
