package com.mycom.game.data.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mycom.game.data.dto.DataDto;
import com.mycom.game.data.service.DataService;

@Controller
public class DataController {
	
	@Autowired
	private DataService dataService;
	
	@RequestMapping("/dataroom/list")
	public ModelAndView list(ModelAndView mView, HttpServletRequest request) {
		
		dataService.getList(request);
		mView.setViewName("dataroom/list");
		return mView;
	}
	
	@RequestMapping("/dataroom/uploadform")
	public ModelAndView authUploadForm(HttpServletRequest request) {
		return new ModelAndView("dataroom/uploadform");
	}
	
	@RequestMapping("/dataroom/upload")
	public ModelAndView authUpload(HttpServletRequest request, DataDto dto) {
		dataService.insert(request, dto);
		return new ModelAndView("redirect:/dataroom/list.do");
	}

	
	//파일 다운로드 요청 처리
	@RequestMapping("/dataroom/download")
	public ModelAndView authdownload(@RequestParam int num,
			ModelAndView mView, HttpServletRequest request) {
		//ModelAndView 객체에 다운로드 할 파일의 정보를 담기게 한다
		dataService.getData(mView, num);
		
		//파일 다운로드 view 로 forward 이동해서 다운로드 시키기
		//mView.setViewName("file/download");
		
		//파일을 다운로드 시켜주는 bean 의 이름 전달 
		mView.setViewName("dataDownView");
		return mView;
	}
		
		//파일 삭제 요청 처리
		@RequestMapping("/dataroom/delete")
		public ModelAndView authDelete(HttpServletRequest request, 
				@RequestParam int num) {
			//서비스를 통해서 파일정보 삭제
			dataService.delete(request, num);
			//파일 목록 보기로 리다일렉트 이동
			return new ModelAndView("redirect:/dataroom/list.do");
		}
		
		//파일 수정
		@RequestMapping("/dataroom/updateform")
		public ModelAndView authUpdateform(HttpServletRequest request,
				@RequestParam int num, ModelAndView mView) {
			dataService.getData(mView, num);
			mView.setViewName("dataroom/updateform");
			return mView;
		}
		
		//수정한 파일 업데이트
		@RequestMapping("/dataroom/update")
		public ModelAndView update(HttpServletRequest request,
				DataDto dto, ModelAndView mView) {
			dataService.update(request, dto);
			return new ModelAndView("redirect:/dataroom/list.do");
		}
		
		@RequestMapping("/popup")
		public ModelAndView popup(ModelAndView mView) {
			mView.setViewName("popup");
			return mView;
		}
	
	
}
