package com.mycom.game.market.dto;

import org.springframework.web.multipart.MultipartFile;

public class MarketDto {
	private int code;	//상품번호
	private String name;	//상품명
	private int price;	//상품 가격
	private int remainCount;	//재고 개수
	private String buyer;	//주문자 아이디
	private String writer;  //판매자
	private String content;	//상품설명
	private int grade;
	//상품 사진
	private String orgFileName; //원본 파일명
	private String saveFileName; //저장된 파일명
	private long fileSize; //파일의 크기 
	private String regdate; //등록일 
	
	private MultipartFile file;
	//카테고리
	private String mainCat;
	private String secCat;
	private String thirdCat;

	public MarketDto() {}
	
	public MarketDto(int code, String name, int price, int remainCount, String buyer, String writer, String content,
			int grade, String orgFileName, String saveFileName, long fileSize, String regdate, MultipartFile file,
			String mainCat, String secCat, String thirdCat) {
		super();
		this.code = code;
		this.name = name;
		this.price = price;
		this.remainCount = remainCount;
		this.buyer = buyer;
		this.writer = writer;
		this.content = content;
		this.grade = grade;
		this.orgFileName = orgFileName;
		this.saveFileName = saveFileName;
		this.fileSize = fileSize;
		this.regdate = regdate;
		this.file = file;
		this.mainCat = mainCat;
		this.secCat = secCat;
		this.thirdCat = thirdCat;
	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getRemainCount() {
		return remainCount;
	}

	public void setRemainCount(int remainCount) {
		this.remainCount = remainCount;
	}

	public String getBuyer() {
		return buyer;
	}

	public void setBuyer(String buyer) {
		this.buyer = buyer;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}

	public String getOrgFileName() {
		return orgFileName;
	}

	public void setOrgFileName(String orgFileName) {
		this.orgFileName = orgFileName;
	}

	public String getSaveFileName() {
		return saveFileName;
	}

	public void setSaveFileName(String saveFileName) {
		this.saveFileName = saveFileName;
	}

	public long getFileSize() {
		return fileSize;
	}

	public void setFileSize(long fileSize) {
		this.fileSize = fileSize;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}

	public String getMainCat() {
		return mainCat;
	}

	public void setMainCat(String mainCat) {
		this.mainCat = mainCat;
	}

	public String getSecCat() {
		return secCat;
	}

	public void setSecCat(String secCat) {
		this.secCat = secCat;
	}

	public String getThirdCat() {
		return thirdCat;
	}

	public void setThirdCat(String thirdCat) {
		this.thirdCat = thirdCat;
	}
}
