package com.mycom.game.market.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mycom.game.data.dto.DataDto;
import com.mycom.game.exception.DeleteFailException;
import com.mycom.game.market.dto.MarketDto;

@Repository
public class MarketDaoImpl implements MarketDao{

	@Autowired
	private SqlSession session;
	
	@Override
	public List<MarketDto> getList() {
		//상품 목록 리턴해주기
		return session.selectList("market.getList");
	}

	@Override
	public void minusCount(int num) {
		//재고 개수 -1
		session.update("market.minusCount", num);
	}

	@Override
	public void minusMoney(MarketDto dto) {
		//고객의 잔고를 상품의 가격만큼 감소 시키기
		session.update("market.minusMoney", dto);
	}

	@Override
	public void plusPoint(MarketDto dto) {
		//상품 가격의 10%를 포인트로 적립 시키기
		session.update("market.plusPoint", dto);
	}

	@Override
	public int getPrice(int num) {
		//인자로 전달된 상품 번호에 해당하는 상품의 가격을 리턴하는 메소드
		return session.selectOne("market.getPrice",num);
	}

	@Override
	public void insertA(MarketDto dto) {
		session.insert("market.insertA", dto);
	}

	@Override
	public void insertB(MarketDto dto) {
		session.insert("market.insertB", dto);
	}

	@Override
	public int getSeq() {
		return session.selectOne("market.getSeq");
	}

	@Override
	public MarketDto getData(int code) {
		return session.selectOne("market.getData", code);
	}
	
	@Override
	public MarketDto getDataB(int code) {
		return session.selectOne("market.getData", code);
	}

	@Override
	public void update(MarketDto dto) {
		session.update("market.update", dto);
	}

	@Override
	public void updateB(MarketDto dto) {
		session.update("market.updateB", dto);
	}

	
	@Override
	public void delete(int code) {
		//삭제한 row 의 갯수 얻어내기 
		int flag=session.delete("market.delete", code);
    	if(flag<1) {//만일 삭제 실패라면 
    		throw new DeleteFailException("파일 삭제 실패!");
    	}
	}

}
