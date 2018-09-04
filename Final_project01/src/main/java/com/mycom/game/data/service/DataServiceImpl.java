package com.mycom.game.data.service;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import com.mycom.game.data.dao.DataDao;
import com.mycom.game.data.dto.DataDto;
import com.mycom.game.exception.ForbiddenException;

@Service
public class DataServiceImpl implements DataService {
	
	//한 페이지에 나타낼 로우의 갯수
	private static final int PAGE_ROW_COUNT=3;
	//하단 디스플레이 페이지 갯수
	private static final int PAGE_DISPLAY_COUNT=3;	
	
	@Autowired
	private DataDao dataDao;

	@Override
	public void getList(HttpServletRequest request) {
		
		String keyword=request.getParameter("keyword");
		String condition=request.getParameter("condition");		
		
		//CafeDto 객체를 생성해서 
		DataDto dto=new DataDto();
		if(keyword != null) {//검색어가 전달된 경우 
			if(condition.equals("titlecontent")) {//제목+내용 검색
				dto.setTitle(keyword);
				dto.setContent(keyword);
			}else if(condition.equals("title")) {//제목 검색
				dto.setTitle(keyword);
			}else if(condition.equals("writer")) {//작성자 검색
				dto.setWriter(keyword);
			}
			//list.jsp 에서 필요한 내용 담기
			request.setAttribute("condition", condition);
			request.setAttribute("keyword", keyword);
		}
		
		//보여줄 페이지의 번호
		int pageNum=1;
		//보여줄 페이지의 번호가 파라미터로 전달되는지 읽어온다.
		String strPageNum=request.getParameter("pageNum");
		if(strPageNum != null){//페이지 번호가 파라미터로 넘어온다면
			//페이지 번호를 설정한다.
			pageNum=Integer.parseInt(strPageNum);
		}
		//보여줄 페이지 데이터의 시작 ResultSet row 번호
		int startRowNum=1+(pageNum-1)*PAGE_ROW_COUNT;
		//보여줄 페이지 데이터의 끝 ResultSet row 번호
		int endRowNum=pageNum*PAGE_ROW_COUNT;
		
		//전체 row 의 갯수를 읽어온다.
		int totalRow=dataDao.getCount();
		//전체 페이지의 갯수 구하기
		int totalPageCount=
				(int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
		//시작 페이지 번호
		int startPageNum=
			1+((pageNum-1)/PAGE_DISPLAY_COUNT)*PAGE_DISPLAY_COUNT;
		//끝 페이지 번호
		int endPageNum=startPageNum+PAGE_DISPLAY_COUNT-1;
		//끝 페이지 번호가 잘못된 값이라면 
		if(totalPageCount < endPageNum){
			endPageNum=totalPageCount; //보정해준다. 
		}
		
		dto.setStartRowNum(startRowNum);
		dto.setEndRowNum(endRowNum);
		
	
		List<DataDto> list=dataDao.getList(dto);
		
		int firstPageNum=1;
		request.setAttribute("list",list);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("firstPageNum", firstPageNum);
		request.setAttribute("startPageNum", startPageNum);
		request.setAttribute("endPageNum", endPageNum);
		request.setAttribute("totalPageCount", totalPageCount);
		request.setAttribute("totalRow", totalRow);	
	}

	@Override
	public void insert(HttpServletRequest request, DataDto dto) {
		//파일을 저장할 폴더의 절대 경로를 얻어온다.
		String realPath=request.getSession()
				.getServletContext().getRealPath("/upload");
		//콘솔에 경로 출력해보기
		
		//MultipartFile 객체의 참조값 얻어오기
		//FileDto 에 담긴 MultipartFile 객체의 참조값을 얻어온다.
		MultipartFile mFile=dto.getFile();
		//원본 파일명
		String orgFileName=mFile.getOriginalFilename();
		//파일 사이즈
		long fileSize=mFile.getSize();
		//저장할 파일의 상세 경로
		String filePath=realPath+File.separator;
		//디렉토리를 만들 파일 객체 생성
		File file=new File(filePath);
		if(!file.exists()){//디렉토리가 존재하지 않는다면
			file.mkdir();//디렉토리를 만든다.
		}
		//파일 시스템에 저장할 파일명을 만든다. (겹치치 않게)
		String saveFileName=System.currentTimeMillis()+orgFileName;
		try{
			//upload 폴더에 파일을 저장한다.
			mFile.transferTo(new File(filePath+saveFileName));
		}catch(Exception e){
			e.printStackTrace();
		}
		//FileDto 객체에 추가 정보를 담는다.
		dto.setOrgFileName(orgFileName);
		dto.setSaveFileName(saveFileName);
		dto.setFileSize(fileSize);
		
		//세션에서 작성자 정보를 얻어온다.
		String id=(String)request.getSession().getAttribute("id");
		//FileDto 객체에 작성자 정보를 담는다.
		dto.setWriter(id);
		
		dataDao.insert(dto);	
		
	}

	@Override
	public void getData(ModelAndView mView, int num) {
		DataDto dto=dataDao.getData(num);
		mView.addObject("dto", dto);
		
	}

	@Override
	public void delete(HttpServletRequest request, int num) {
		
		String id=(String)request.getSession().getAttribute("id");
		
		DataDto dto=dataDao.getData(num);
		if(!id.equals(dto.getWriter())) {
			throw new ForbiddenException();
		}
	
		//1. 파일 시스템에서 파일 삭제
		String path=
			request.getServletContext().getRealPath("/upload")+
			File.separator+dto.getSaveFileName();
		try{
			new File(path).delete();
		}catch(Exception e){}
		//2. DB 에서 파일정보 삭제
		dataDao.delete(num);
		
	}


	@Override
	public void update(HttpServletRequest request, DataDto dto) {
		
		String realPath=request.getSession()
				.getServletContext().getRealPath("/upload");
		
		int num=Integer.parseInt(request.getParameter("num"));
		String writer=request.getParameter("writer");
		String title=request.getParameter("title");
		String content=request.getParameter("content");
		
		dto=new DataDto();
		
		MultipartFile mFile=dto.getFile();
		
		//파일이 업로드 되었으면
		if(mFile != null) {
			//원본 파일명
			String orgFileName=mFile.getOriginalFilename();
			//파일 사이즈
			long fileSize=mFile.getSize();
			//저장할 파일의 상세 경로
			String filePath=realPath+File.separator;
			//디렉토리를 만들 파일 객체 생성
			File file=new File(filePath);
			if(!file.exists()){//디렉토리가 존재하지 않는다면
				file.mkdir();//디렉토리를 만든다.
			}
			//파일 시스템에 저장할 파일명을 만든다. (겹치치 않게)
			String saveFileName=System.currentTimeMillis()+orgFileName;
			try{
				//upload 폴더에 파일을 저장한다.
				mFile.transferTo(new File(filePath+saveFileName));
			}catch(Exception e){
				e.printStackTrace();
			}
			//FileDto 객체에 추가 정보를 담는다.
			dto.setOrgFileName(orgFileName);
			dto.setSaveFileName(saveFileName);
			dto.setFileSize(fileSize);
		
		}
		
		dto.setWriter(writer);
		dto.setNum(num);
		dto.setTitle(title);
		dto.setContent(content);
		
		dataDao.update(dto);
		
	}
	
	
}
