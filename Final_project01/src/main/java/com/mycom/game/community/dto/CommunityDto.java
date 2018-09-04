package com.mycom.game.community.dto;

public class CommunityDto {
	private String id;
	private boolean counselor;
	private int score;
	
	public CommunityDto() {}
	
	public CommunityDto(String id, boolean counselor, int score) {
		super();
		this.id = id;
		this.counselor = counselor;
		this.score = score;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public boolean isCounselor() {
		return counselor;
	}

	public void setCounselor(boolean counselor) {
		this.counselor = counselor;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}
	
	
}
