package com.DB;

import java.util.*;

public class product {



	int productId;
	String productTitle;
	String productType;
	String productCategory;
	int productPrice;
	int productDuration;
	Date startDate;
	Date endDate;
	int productLikeCount;
	String productDescription;
	String productLocation;
	int productCount;
	String freeShipping;
	int newPrice;
	int memberId;
	
	public product() {
		super();
	}
	
	
	
	public product(int productId, String productTitle, String productType,
			String productCategory, int productPrice, int productDuration,
			Date startDate, Date endDate, int productLikeCount,
			String productDescription, String productLocation,
			int productCount, String freeShipping, int newPrice, int memberId) {
		super();
		this.productId = productId;
		this.productTitle = productTitle;
		this.productType = productType;
		this.productCategory = productCategory;
		this.productPrice = productPrice;
		this.productDuration = productDuration;
		this.startDate = startDate;
		this.endDate = endDate;
		this.productLikeCount = productLikeCount;
		this.productDescription = productDescription;
		this.productLocation = productLocation;
		this.productCount = productCount;
		this.freeShipping = freeShipping;
		this.newPrice = newPrice;
		this.memberId = memberId;
	}

	
	
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public String getProductTitle() {
		return productTitle;
	}
	public void setProductTitle(String productTitle) {
		this.productTitle = productTitle;
	}
	public String getProductType() {
		return productType;
	}
	public void setProductType(String productType) {
		this.productType = productType;
	}
	public String getProductCategory() {
		return productCategory;
	}
	public void setProductCategory(String productCategory) {
		this.productCategory = productCategory;
	}
	public int getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}
	public int getProductDuration() {
		return productDuration;
	}
	public void setProductDuration(int productDuration) {
		this.productDuration = productDuration;
	}
	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	public int getProductLikeCount() {
		return productLikeCount;
	}
	public void setProductLikeCount(int productLikeCount) {
		this.productLikeCount = productLikeCount;
	}
	public String getProductDescription() {
		return productDescription;
	}
	public void setProductDescription(String productDescription) {
		this.productDescription = productDescription;
	}
	public String getProductLocation() {
		return productLocation;
	}
	public void setProductLocation(String productLocation) {
		this.productLocation = productLocation;
	}
	public int getProductCount() {
		return productCount;
	}
	public void setProductCount(int productCount) {
		this.productCount = productCount;
	}
	public String getFreeShipping() {
		return freeShipping;
	}
	public void setFreeShipping(String freeShipping) {
		this.freeShipping = freeShipping;
	}
	public int getNewPrice() {
		return newPrice;
	}
	public void setNewPrice(int newPrice) {
		this.newPrice = newPrice;
	}






	public int getMemberId() {
		return memberId;
	}






	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}
	
	
	
	

}
