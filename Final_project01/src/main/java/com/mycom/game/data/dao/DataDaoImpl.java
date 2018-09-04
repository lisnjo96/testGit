package com.mycom.game.data.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mycom.game.data.dto.DataDto;

@Repository
public class DataDaoImpl implements DataDao {

	@Autowired
	private SqlSession session;

	@Override
	public List<DataDto> getList(DataDto dto) {
		
		return session.selectList("data.getList", dto);
	}

	@Override
	public int getCount() {
		return session.selectOne("data.getCount");
	}

	@Override
	public void delete(int num) {
		session.delete("data.delete", num);
		
	}

	@Override
	public void addDownCount(int num) {
		session.update("data.addDownCount, num");
		
	}

	@Override
	public DataDto getData(int num) {
		return session.selectOne("data.getData", num);
	}

	@Override
	public void insert(DataDto dto) {
		session.insert("data.insert", dto);
		
	}

	@Override
	public void update(DataDto dto) {
		session.update("data.update", dto);
		
	}
	
	
}
