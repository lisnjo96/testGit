package com.mycom.game.community.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mycom.game.community.dto.CustomerServiceDto;
import com.mycom.game.exception.DeleteFailException;
import com.mycom.game.exception.UpdateFailException;

@Repository
public class CustomerServiceDaoImpl implements CustomerServiceDao{

	@Autowired
	private SqlSession session;
	
	@Override
	public void insert(CustomerServiceDto dto) {
		session.insert("customerService.insert", dto);
	}

	@Override
	public int getCount(CustomerServiceDto dto) {
		return session.selectOne("customerService.getCount", dto);
	}

	@Override
	public List<CustomerServiceDto> getList(CustomerServiceDto dto) {
		return session.selectList("customerService.getList", dto);
	}

	@Override
	public CustomerServiceDto getData(CustomerServiceDto dto) {
		CustomerServiceDto resultDto=session.selectOne("customerService.getData", dto);
		return resultDto;
	}

	@Override
	public void delete(int num) {
		int flag=session.delete("customerService.delete", num);
		if(flag<0) {
			throw new DeleteFailException("파일 삭제 실패!");
		};
	}

	@Override
	public void update(CustomerServiceDto dto) {
		int flag=session.update("customerService.update", dto);
		if(flag==0) {
			throw new UpdateFailException("파일 업데이트 실패!");
		};
	}

	@Override
	public void addViewCount(int num) {
		session.update("customerService.addViewCount", num);
	}

	@Override
	public void updateChoose(int num) {
		session.update("customerService.updateChoose", num);
	}

	

}
