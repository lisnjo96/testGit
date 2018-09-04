package com.mycom.game.gallery.controller;



import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mycom.game.data.dto.DataDto;
import com.mycom.game.gallery.dto.GalleryDto;
import com.mycom.game.gallery.service.GalleryService;





@Controller
public class GalleryController {
	
	@Autowired
	private GalleryService galleryService;
	
	@RequestMapping("/gallery/list")
	public ModelAndView list(ModelAndView mView, 
			HttpServletRequest request) {
		//pageNum 이라는 파라미터가 넘어오지 않으면 1 페이지가 된다.

		galleryService.getList(mView, request);
		
		mView.setViewName("gallery/list");
		return mView;
	}
	
	@RequestMapping("/gallery/upload_form")
	public ModelAndView authUploadForm(HttpServletRequest request) {
		
		return new ModelAndView("gallery/upload_form");
	}
	
	
	
	@RequestMapping("/gallery/upload")
	public ModelAndView authUpload(HttpServletRequest request,
			@ModelAttribute GalleryDto dto) {
		//FileDto 에는 업로드된 파일의 정보도 같이 들어있다.
		galleryService.insert(request, dto);
		
		//파일 목록 보기로 리다일렉트 이동 
		return new ModelAndView("redirect:/gallery/list.do");
	}
	
	@RequestMapping("/gallery/delete")
	public ModelAndView authDelete(HttpServletRequest request, 
			@RequestParam int num) {
		//서비스를 통해서 파일정보 삭제
		galleryService.delete(request, num);
		//파일 목록 보기로 리다일렉트 이동
		System.out.println("삭제 컨트롤러 들어옴");
		return new ModelAndView("redirect:/gallery/list.do");
	}
	
	//파일 수정
	@RequestMapping("/gallery/updateform")
	public ModelAndView authUpdateform(HttpServletRequest request,
			@RequestParam int num, ModelAndView mView) {
		galleryService.getData(mView, num);
		mView.setViewName("gallery/updateform");
		return mView;
	}

	//수정한 파일 업데이트
	@RequestMapping("/gallery/update")
	public ModelAndView authupdate(HttpServletRequest request, ModelAndView mView) {
		System.out.println("controller update에는 들어옴");
		System.out.println("controller 에 들어온 num " + request.getParameter("num"));
		System.out.println("controller 에 들어온 title " + request.getParameter("title"));
		galleryService.update(request);
		mView.setViewName("redirect:/gallery/list.do");
		return mView;
	}
	
	/*
	//파일 다운로드 요청 처리
	@RequestMapping("/gallery/download")
	public ModelAndView download(@RequestParam int num,
			ModelAndView mView) {
		//ModelAndView 객체에 다운로드 할 파일의 정보를 담기게 한다
		galleryService.getData(mView, num);
		
		//파일 다운로드 view 로 forward 이동해서 다운로드 시키기
		//mView.setViewName("file/download");
		
		//파일을 다운로드 시켜주는 bean 의 이름 전달 
		mView.setViewName("galleryDownView");
		return mView;
	}
	
	
	
	//파일 삭제 요청 처리
	@RequestMapping("/gallery/delete")
	public ModelAndView authDelete(HttpServletRequest request, 
			@RequestParam int num) {
		//서비스를 통해서 파일정보 삭제
		galleryService.delete(request, num);
		//파일 목록 보기로 리다일렉트 이동
		return new ModelAndView("redirect:/gallery/list.do");
	}
	
	//파일 이미지 경로 요청 처리
	@RequestMapping("/gallery/test")
	public ModelAndView test(ModelAndView mView, HttpServletRequest request) {
		
		
		
		return mView;
	}*/
	
}
