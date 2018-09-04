package com.mycom.game.gallery.dao;

import java.util.List;

import com.mycom.game.data.dto.DataDto;
import com.mycom.game.gallery.dto.GalleryDto;



public interface GalleryDao {
	public void delete(int num);
	public void addDownCount(int num);
	public GalleryDto getData(int num);
	public void insert(GalleryDto dto);
	public List<GalleryDto> getList(GalleryDto dto);
	public int getCount();
	public void update(GalleryDto dto);
}
