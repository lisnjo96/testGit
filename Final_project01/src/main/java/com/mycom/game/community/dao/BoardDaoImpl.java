package com.mycom.game.community.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mycom.game.community.dto.BoardDto;
import com.mycom.game.exception.DeleteFailException;
import com.mycom.game.exception.UpdateFailException;

@Repository
public class BoardDaoImpl implements BoardDao{

	@Autowired
	private SqlSession session;
	
	@Override
	public void insert(BoardDto dto) {
		session.insert("board.insert", dto);
	}

	@Override
	public int getCount(BoardDto dto) {
		return session.selectOne("board.getCount", dto);
	}

	@Override
	public List<BoardDto> getList(BoardDto dto) {
		return session.selectList("board.getList", dto);
	}

	@Override
	public BoardDto getData(BoardDto dto) {
		BoardDto resultDto=session.selectOne("board.getData", dto);
		return resultDto;
	}

	@Override
	public void delete(int num) {
		int flag=session.delete("board.delete", num);
		if(flag<0) {
			throw new DeleteFailException("파일 삭제 실패!");
		};
	}

	@Override
	public void update(BoardDto dto) {
		int flag=session.update("board.update", dto);
		if(flag==0) {
			throw new UpdateFailException("파일 업데이트 실패!");
		};
	}

	@Override
	public void addViewCount(int num) {
		session.update("board.addViewCount", num);
	}

	@Override
	public void addExcellrentCount(int num) {
		session.update("board.addExcellrentCount", num);
	}

	@Override
	public void addGoodCount(int num) {
		session.update("board.addGoodCount", num);
	}

	@Override
	public void addBadCount(int num) {
		session.update("board.addBadCount", num);
	}

	@Override
	public void addGradeCount(int num) {
		session.update("board.addGradeCount", num);
	}

}
