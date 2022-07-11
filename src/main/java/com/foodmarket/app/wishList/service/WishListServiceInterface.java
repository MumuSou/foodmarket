package com.foodmarket.app.wishList.service;

import java.util.List;

import org.springframework.data.domain.Page;

import com.foodmarket.app.member.model.Member;
import com.foodmarket.app.product.model.WorkProduct;
import com.foodmarket.app.wishList.model.WishList;

public interface WishListServiceInterface {
	
	public List<WishList> findByMember(Member member);
	
	public Page<WishList> findByMemberPageable(Integer pageNumber, Long Id);
	
	public WishList save(WishList wishList);
	
	public WishList findByMemberAndProduct(Member member,WorkProduct product);
	
	public void deleteByMemberAndProduct(Member member,WorkProduct product);
	
	public String addOrCancel(Member member,WorkProduct product);

}
