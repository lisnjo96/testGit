package com.mycom.game.community.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.mycom.game.community.dao.CommunityDao;
import com.mycom.game.community.dao.CustomerServiceDao;
import com.mycom.game.community.dto.CommunityDto;
import com.mycom.game.community.dto.CustomerServiceDto;

@Service
public class CommunityServiceImpl implements CommunityService{

	@Autowired
	private CommunityDao dao;
	@Autowired
	private CustomerServiceDao csdao;
	
	@Override
	public void getList(ModelAndView mView) {
		List<CommunityDto> clist=dao.getList();
		mView.addObject("clist",clist);
	}

	@Override
	public void insert(HttpServletRequest request, CommunityDto dto, HttpSession session) {
		String id=request.getParameter("id");
		dto.setId(id);
		dto.setCounselor(false);
		dto.setScore(0);
		dao.insert(dto);
		session.setAttribute("writer", id);
	}

	@Override
	public void update(HttpServletRequest request) {
		String id=request.getParameter("id");
		dao.addScoreCount(id);
		int num=Integer.parseInt(request.getParameter("num"));
		csdao.updateChoose(num);
	}

	@Override
	public void getData(HttpServletRequest request) {
		String id=request.getParameter("id");
		CommunityDto dto=dao.getData(id);
		request.setAttribute("dto", dto);
	}

}
