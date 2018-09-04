package com.mycom.game.market.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mycom.game.market.dto.MarketDto;
import com.mycom.game.market.service.MarketService;

@Controller
public class MarketController {
	@Autowired
	private MarketService marketService;
	
	//상품 목록 보기 요청 처리
		@RequestMapping("/market/list")
		public ModelAndView list(ModelAndView mView) {
			
			marketService.getList(mView);
			
			mView.setViewName("market/list");
			return mView;
		}
		
		//상품 구매하기 요청 처리
		@RequestMapping("/market/buy")
		public ModelAndView authBuy(HttpServletRequest request, ModelAndView mView) {
			marketService.buy(request, mView);
			mView.setViewName("market/buy");
			return mView;
		}
		
		//상품정보 업데이트 폼
		@RequestMapping("/market/uploadform")
		public ModelAndView uploadForm() {
			return new ModelAndView("market/uploadform");
		}
		
		//상품정보 등록
		@RequestMapping("/market/upload")
		public ModelAndView authUpload(HttpServletRequest request, MarketDto dto) {
			marketService.insert(request, dto);
			return new ModelAndView("redirect:/market/list.do");
		}
		
		//상품정보 업데이트 폼
		@RequestMapping("/market/detail")
		public ModelAndView detail(ModelAndView mView, @RequestParam int code) {
			
			marketService.getData(mView, code);
			mView.setViewName("market/detail");
			return mView;
		}
		
		//파일 수정
		@RequestMapping("/market/updateform")
		public ModelAndView authUpdateform(HttpServletRequest request,
				@RequestParam int code, ModelAndView mView) {
			marketService.getData(mView, code);
			mView.setViewName("market/updateform");
			return mView;
		}
		
		//수정한 파일 업데이트
		@RequestMapping("/market/update")
		public ModelAndView authUpdate(HttpServletRequest request,
				MarketDto dto, ModelAndView mView) {
			marketService.update(request, dto);
			return new ModelAndView("redirect:/market/list.do");
		}
		
		//삭제
		@RequestMapping("/market/delete")
	    public ModelAndView authDelete(HttpServletRequest request, 
	          @RequestParam int code) {
	       System.out.println("삭제 컨트롤러 들어옴");
	       //서비스를 통해서 파일정보 삭제
	       marketService.delete(request, code);
	       //파일 목록 보기로 리다일렉트 이동
	       return new ModelAndView("redirect:/market/list.do");
	    }
		
		//돈 추가
		@RequestMapping("/market/charge")
	    public ModelAndView authCharge(HttpServletRequest request, ModelAndView mView) {
			marketService.charge(request,mView);
			return new ModelAndView("market/charge");
	    }
		
		
}
