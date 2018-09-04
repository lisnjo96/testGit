package com.mycom.game.data.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import com.mycom.game.data.dto.DataDto;

public interface DataService {
	public void getList(HttpServletRequest request);
	public void insert(HttpServletRequest request, DataDto dto);
	public void getData(ModelAndView mView, int num);
	public void delete(HttpServletRequest request, int num);
	public void update(HttpServletRequest request, DataDto dto);
}
