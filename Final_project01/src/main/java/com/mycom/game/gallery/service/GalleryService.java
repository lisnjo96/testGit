package com.mycom.game.gallery.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import com.mycom.game.data.dto.DataDto;
import com.mycom.game.gallery.dto.GalleryDto;



public interface GalleryService {
	public void getList(ModelAndView mView, HttpServletRequest request);
	public void insert(HttpServletRequest request, GalleryDto dto);
	public void getData(ModelAndView mView, int num);
	public void delete(HttpServletRequest request, int num);
	public void getRealPath(HttpServletRequest request, ModelAndView mView);
	public void update(HttpServletRequest request);
}












