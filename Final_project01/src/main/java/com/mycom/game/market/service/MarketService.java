package com.mycom.game.market.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import com.mycom.game.data.dto.DataDto;
import com.mycom.game.market.dto.MarketDto;



public interface MarketService {

	public void getList(ModelAndView mView);
	public void insert(HttpServletRequest request, MarketDto dto);
	public void buy(HttpServletRequest request, ModelAndView mView);
	public void getData(ModelAndView mView, int code);
	public void update(HttpServletRequest request, MarketDto dto);
	public void delete(HttpServletRequest request, int code);
	public void charge(HttpServletRequest request, ModelAndView mView);
}
