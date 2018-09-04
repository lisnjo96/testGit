package com.mycom.game.community.dao;

import java.util.List;

import com.mycom.game.community.dto.CustomerServiceCommentDto;

public interface CustomerServiceCommentDao {
	//댓글의 글번호를 리턴해주는 메소드
	public int getSequence();
	//댓글 저장하는 메소드
	public void insert(CustomerServiceCommentDto dto);
	//댓글 목록을 리턴하는 메소드
	public List<CustomerServiceCommentDto> getList(int ref_group);
	//한개의 댓글 정보를 리턴하는 메소드
	public CustomerServiceCommentDto getData(CustomerServiceCommentDto dto);
	//글정보를 삭제하는 메소드
	public void delete(int num);
}
