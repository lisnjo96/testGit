package com.mycom.game.community.dao;

import java.util.List;

import com.mycom.game.community.dto.CommunityDto;
import com.mycom.game.community.dto.CustomerServiceDto;

public interface CommunityDao {
	public List<CommunityDto> getList();
	public void insert(CommunityDto dto);
	// 내공을 올려준다.
	public void addScoreCount(String id);
	public CommunityDto getData(String id);
}
