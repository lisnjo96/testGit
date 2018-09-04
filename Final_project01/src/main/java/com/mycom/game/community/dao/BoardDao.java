package com.mycom.game.community.dao;

import java.util.List;

import com.mycom.game.community.dto.BoardDto;

public interface BoardDao {
	//새글을 저장하는 메소드
	public void insert(BoardDto dto);
	//글의 갯수를 리턴하는 메소드 
	public int getCount(BoardDto dto);
	//글목록을 리턴하는 메소드
	public List<BoardDto> getList(BoardDto dto);
	//글 하나의 정보를 리턴하는 메소드 
	public BoardDto getData(BoardDto dto);
	//글정보를 삭제하는 메소드
	public void delete(int num);
	//글정보 수정하는 메소드 
	public void update(BoardDto dto);
	//조회수를 증가 시키는 메소드
	public void addViewCount(int num);
	//점수를 가져오는 메소드
	public void addExcellrentCount(int num);
	//점수를 가져오는 메소드
	public void addGoodCount(int num);
	//점수를 가져오는 메소드
	public void addBadCount(int num);
	//점수의 카운트를 세는 메소드
	public void addGradeCount(int num);
}
