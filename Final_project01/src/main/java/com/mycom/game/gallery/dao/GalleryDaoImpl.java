package com.mycom.game.gallery.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mycom.game.data.dto.DataDto;
import com.mycom.game.exception.DeleteFailException;
import com.mycom.game.gallery.dto.GalleryDto;

/*
 *  Dao 는 @Repository 어노테이션을 붙여서 만든다.
 *  
 *  Dao 에서는 SqlSession 객체를 이용해서 DB 에 
 *  SELECT, INSERT, UPDATE, DELETE 작업을 하기 때문에
 *  SQLException 이 발생할 가능성이 있는데,
 *  Spring 프레임워크는 @Repository 어노테이션이 붙어 있는 
 *  Dao 에서 발생하는 SQLException 을 catch 해서 
 *  DataAccessException type 의 예외를 발생시킨다. 
 *  
 *  따라서 ExceptionController 에 있는 DataAccessException 을
 *  처리하는 메소드에서 해당 예외를 처리하면된다. 
 */
@Repository
public class GalleryDaoImpl implements GalleryDao{
	
	@Autowired
	private SqlSession session;
	
	@Override
	public void delete(int num) {
		//삭제한 row 의 갯수 얻어내기 
		int flag=session.delete("gallery.delete", num);
		if(flag<1) {//만일 삭제 실패라면 
			throw new DeleteFailException("파일 삭제 실패!");
		}
	}

	@Override
	public void addDownCount(int num) {
		session.update("gallery.addDownCount", num);
	}

	@Override
	public GalleryDto getData(int num) {
		
		return session.selectOne("gallery.getData", num);
	}

	@Override
	public void insert(GalleryDto dto) {
		session.insert("gallery.insert", dto);
	}

	@Override
	public List<GalleryDto> getList(GalleryDto dto) {
		return session.selectList("gallery.getList", dto);
	}

	@Override
	public int getCount() {
		return session.selectOne("gallery.getCount");
	}
	
	@Override
	public void update(GalleryDto dto) {
		session.update("gallery.update", dto);
		
	}

}





