package com.mycom.game.community.dao;

import java.util.List;

import com.mycom.game.community.dto.CustomerServiceDto;

public interface CustomerServiceDao {
	//새글을 저장하는 메소드
	public void insert(CustomerServiceDto dto);
	//글의 갯수를 리턴하는 메소드 
	public int getCount(CustomerServiceDto dto);
	//글목록을 리턴하는 메소드
	public List<CustomerServiceDto> getList(CustomerServiceDto dto);
	//글 하나의 정보를 리턴하는 메소드 
	public CustomerServiceDto getData(CustomerServiceDto dto);
	//글정보를 삭제하는 메소드
	public void delete(int num);
	//글정보 수정하는 메소드 
	public void update(CustomerServiceDto dto);
	//조회수를 증가 시키는 메소드
	public void addViewCount(int num);
	//채택 여부를 나타내는 메소드
	public void updateChoose(int num);
	//메인 페이지 리스트를 주는 메소드
//	public List<String> getlimitlist();
}
