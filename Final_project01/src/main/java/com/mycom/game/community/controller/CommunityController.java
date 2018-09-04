package com.mycom.game.community.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.mycom.game.community.dto.CommunityDto;
import com.mycom.game.community.dto.CustomerServiceCommentDto;
import com.mycom.game.community.dto.CustomerServiceDto;
import com.mycom.game.community.service.CommunityService;
import com.mycom.game.community.service.CustomerServiceService;

@Controller
public class CommunityController {
	
	@Autowired
	private CommunityService cService;
	@Autowired
	private CustomerServiceService csService;
	
	@RequestMapping("/community/primaryform")
	public ModelAndView priamryform(ModelAndView mView, HttpServletRequest request) {
		cService.getData(request);
		return new ModelAndView("community/primaryform");
	}
	
	@RequestMapping("/community/qa")
	public ModelAndView qa(ModelAndView mView, HttpServletRequest request) {
		cService.getList(mView);
		csService.getList(mView, request);
		mView.setViewName("community/qalist");
		return mView;
	}
	
	@RequestMapping("/community/delete")
	public ModelAndView authDelete(HttpServletRequest request, int num) {
		csService.delete(request, num);
		return new ModelAndView("redirect:/community/qa.do");
	}
	
	
	@RequestMapping("/community/comment_insert")
	//새 댓글 저장 요청처리
	public ModelAndView authcommentInsert(@ModelAttribute CustomerServiceCommentDto dto,HttpServletRequest request) {
		String keyword=request.getParameter("keyword");
		String condition=request.getParameter("condition");
		String num=request.getParameter("num");
		String noNum=request.getParameter("noNum");
		csService.commentInsert(dto);
		return new ModelAndView("redirect:/community/detail.do?num="+dto.getRef_group()+"&keyword="+keyword+"&condition="+condition+"&noNum="+noNum);
	}
	
	@RequestMapping("/community/insertform")
	public ModelAndView authInsertForm(HttpServletRequest request) {
		
		return new ModelAndView("community/insertform");
	}
	
	@RequestMapping("/community/insert")
	public String Insert(HttpServletRequest request, CustomerServiceDto dto) {
		csService.insert(request, dto);
		return "community/insert";
	}
	
	@RequestMapping("/community/detail")
	public String getData(HttpServletRequest request) {
		//서비스객체이용 model을 request에 담는다.
		csService.getData(request);
		return "community/detail";
	}
	
	//글 수정 폼 요청 처리
	@RequestMapping("/community/updateform")
	public String authUpdateForm(HttpServletRequest request){
		csService.getData(request);
		return "community/updateform";
	}
	
	@RequestMapping("/community/update")
	public String authUpdate(HttpServletRequest request) {
		csService.update(request);
		return "community/update";
	}
	
	@RequestMapping("/community/comment_delete")
	public ModelAndView authCommentDelete(HttpServletRequest request) {
		String keyword=request.getParameter("keyword");
		String condition=request.getParameter("condition");
		String num=request.getParameter("num2");
		String noNum=request.getParameter("noNum");
		csService.commentDelete(request);
		return new ModelAndView("redirect:/community/detail.do?num="+num+"&keyword="+keyword+"&condition="+condition+"&noNum="+noNum);
	}
	
	@RequestMapping("/community/insert_counselor")
	public ModelAndView authInsertCounselor(HttpServletRequest request,CommunityDto dto,HttpSession session) {
		String url=request.getParameter("url");
		cService.insert(request, dto, session);
		return new ModelAndView("redirect:"+url);
	}
	
	@RequestMapping("/community/comment_adopt")
	public ModelAndView authAddScoreCount(HttpServletRequest request) {
		cService.update(request);
		String keyword=request.getParameter("keyword");
		String condition=request.getParameter("condition");
		String num=request.getParameter("num");
		String noNum=request.getParameter("noNum");
		return new ModelAndView("redirect:/community/detail.do?num="+num+"&keyword="+keyword+"&condition="+condition+"&noNum="+noNum);
	}
}







