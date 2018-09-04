package com.mycom.game.data.dao;

import java.util.List;

import com.mycom.game.data.dto.DataDto;

public interface DataDao {
	public List<DataDto> getList(DataDto dto);
	public int getCount();
	public void delete(int num);
	public void addDownCount(int num);
	public DataDto getData(int num);
	public void insert(DataDto dto);
	public void update(DataDto dto);
}
