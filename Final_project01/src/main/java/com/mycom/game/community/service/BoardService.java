package com.mycom.game.community.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import com.mycom.game.community.dto.BoardDto;
import com.mycom.game.community.dto.CustomerServiceCommentDto;

public interface BoardService {
	public void getList(ModelAndView mView, HttpServletRequest request);
	public void insert(HttpServletRequest request, BoardDto dto);
	public void getData(HttpServletRequest request);
	public void delete(HttpServletRequest request, int num);
	public void update(HttpServletRequest request);
	public void commentInsert(CustomerServiceCommentDto dto);
	public void commentDelete(HttpServletRequest request);
}
