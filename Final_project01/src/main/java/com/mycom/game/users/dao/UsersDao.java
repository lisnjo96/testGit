package com.mycom.game.users.dao;

import com.mycom.game.market.dto.OrderDto;
import com.mycom.game.users.dto.UsersDto;

public interface UsersDao {
	public void insert(UsersDto dto);
	public UsersDto getData(String id);
	public void update(UsersDto dto);
	public void delete(String id);
	public boolean canUseId(String id);
	public void updatePwd(UsersDto dto);
	public void insertCash(UsersDto dto);
	public void deleteCash(String id);
}
