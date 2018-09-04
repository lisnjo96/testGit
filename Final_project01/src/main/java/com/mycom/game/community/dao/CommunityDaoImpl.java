package com.mycom.game.community.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mycom.game.community.dto.CommunityDto;
import com.mycom.game.community.dto.CustomerServiceDto;
@Repository
public class CommunityDaoImpl implements CommunityDao{
	
	@Autowired
	private SqlSession session;
	
	@Override
	public List<CommunityDto> getList() {
		return session.selectList("community.getList");
	}

	@Override
	public void insert(CommunityDto dto) {
		session.insert("community.insert", dto);
	}

	@Override
	public void addScoreCount(String id) {
		session.update("community.addScoreCount", id);
		
	}

	@Override
	public CommunityDto getData(String id) {
		return session.selectOne("community.getData", id);
	}

}
