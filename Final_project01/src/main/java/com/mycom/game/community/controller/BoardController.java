package com.mycom.game.community.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mycom.game.community.dto.BoardDto;
import com.mycom.game.community.dto.CustomerServiceCommentDto;
import com.mycom.game.community.service.BoardService;

@Controller
public class BoardController {
	@Autowired
	private BoardService bService;
	
	@RequestMapping("/community/board/list")
	public ModelAndView qa(ModelAndView mView, HttpServletRequest request) {
		bService.getList(mView, request);
		mView.setViewName("community/board/list");
		return mView;
	}
	
	@RequestMapping("/community/board/comment_delete")
	public ModelAndView authDelete(HttpServletRequest request) {
		bService.commentDelete(request);
		
		return new ModelAndView("redirect:/community/board/list.do");
	}
	
	
	@RequestMapping("/community/board/comment_insert")
	//새 댓글 저장 요청처리
	public ModelAndView authcommentInsert(@ModelAttribute CustomerServiceCommentDto dto,HttpServletRequest request) {
		bService.commentInsert(dto);
		
		return new ModelAndView("redirect:/community/board/detail.do?num="+dto.getRef_group());
	}
	
	@RequestMapping("/community/board/insertform")
	public ModelAndView authInsertForm(HttpServletRequest request) {
		
		return new ModelAndView("community/board/insertform");
	}
	
	@RequestMapping("/community/board/insert")
	public String Insert(HttpServletRequest request, BoardDto dto) {
		bService.insert(request, dto);
		return "community/board/insert";
	}
	
	@RequestMapping("/community/board/detail")
	public String getData(HttpServletRequest request) {
		//서비스객체이용 model을 request에 담는다.
		bService.getData(request);
		return "community/board/detail";
	}
	
	@RequestMapping("/community/board/delete")
	public String delete(HttpServletRequest request,@RequestParam int num) {
		bService.delete(request, num);
		return "redirect:/community/board/list.do";
	}
	
	//글 수정 폼 요청 처리
	@RequestMapping("/community/board/updateform")
	public String authUpdateForm(HttpServletRequest request){	
		bService.getData(request);
		return "community/board/updateform";
	}
	
	@RequestMapping("/community/board/update")
	public String authUpdate(HttpServletRequest request) {
		bService.update(request);
		return "community/board/update";
	}
}
