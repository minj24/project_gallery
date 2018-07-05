package com.test;

public class BidList {
	
	private String rownum, art_name, name , bid_date, bid_price, gallery_date;
	
	private int bidbid,  gallery_agree;

	public String getRownum() {
		return rownum;
	}

	public String getGallery_date() {
		return gallery_date;
	}

	public void setGallery_date(String gallery_date) {
		this.gallery_date = gallery_date;
	}


	public int getGallery_agree() {
		return gallery_agree;
	}

	public void setGallery_agree(int gallery_agree) {
		this.gallery_agree = gallery_agree;
	}

	public void setRownum(String rownum) {
		this.rownum = rownum;
	}

	public String getArt_name() {
		return art_name;
	}

	public void setArt_name(String art_name) {
		this.art_name = art_name;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getBid_date() {
		return bid_date;
	}

	public void setBid_date(String bid_date) {
		this.bid_date = bid_date;
	}

	public String getBid_price() {
		return bid_price;
	}

	public void setBid_price(String bidprice) {
		this.bid_price = bidprice;
	}

	public int getBidbid() {
		return bidbid;
	}

	public void setBidbid(int bidbid) {
		this.bidbid = bidbid;
	}

	
	

}
