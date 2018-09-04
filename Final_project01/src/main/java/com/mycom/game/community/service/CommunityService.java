package com.mycom.game.community.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;

import com.mycom.game.community.dto.CommunityDto;

public interface CommunityService {
	public void getList(ModelAndView mView);
	public void insert(HttpServletRequest request, CommunityDto dto, HttpSession session);
	public void update(HttpServletRequest request);
	public void getData(HttpServletRequest request);
}
