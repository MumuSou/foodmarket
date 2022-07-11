package com.foodmarket.app.wishList.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.foodmarket.app.member.model.Member;
import com.foodmarket.app.product.model.WorkProduct;
import com.foodmarket.app.wishList.model.WishList;
import com.foodmarket.app.wishList.repository.WishListRepository;

@Service("WishListService")
@Transactional
public class WishListService implements WishListServiceInterface{
	
	@Autowired
	private WishListRepository dao;

	@Override
	public List<WishList> findByMember(Member member) {
		return dao.findByMember(member);
	}

	@Override
	public WishList save(WishList wishList) {
		return dao.save(wishList);
	}

	@Override
	public WishList findByMemberAndProduct(Member member, WorkProduct product) {
		return dao.findByMemberAndProduct(member, product);
	}

	@Override
	public void deleteByMemberAndProduct(Member member, WorkProduct product) {
		dao.deleteByMemberAndProduct(member, product);
		
	}

	@Override
	public String addOrCancel(Member member, WorkProduct product) {
		WishList wish = findByMemberAndProduct(member, product);
		if(wish != null) {
			deleteByMemberAndProduct(member, product);
			return "取消收藏";
		}else {
			WishList newWish = new WishList();
			newWish.setMember(member);
			newWish.setProduct(product);
			save(newWish);
			return "新增收藏";
		}
	}

	@Override
	public Page<WishList> findByMemberPageable(Integer pageNumber, Long Id) {
		Pageable pgb = PageRequest.of(pageNumber-1, 5 ,Sort.Direction.ASC ,"productid");
		Page<WishList> mPage = dao.findByMember(pgb, Id);
		
		return mPage;
	}

	

}
