package com.foodmarket.app.wishList.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.foodmarket.app.member.model.Member;
import com.foodmarket.app.member.service.MemberServiceInterface;
import com.foodmarket.app.product.model.WorkProduct;
import com.foodmarket.app.product.service.WorkProductService;
import com.foodmarket.app.wishList.model.WishList;
import com.foodmarket.app.wishList.service.WishListServiceInterface;

@Controller
public class WishListController {

	@Autowired
	private WishListServiceInterface wishListService;

	@Autowired
	private MemberServiceInterface memberService;

	@Autowired
	private WorkProductService productService;

	private static final Logger logger = LoggerFactory.getLogger(WishListController.class);

	// 導向收藏商品
	@GetMapping("/wishList/{id}")
	public String WishList(@PathVariable Long id, Model m, HttpSession session,
			@RequestParam(name = "p", defaultValue = "1") Integer p) {
		Long sessionUId = (Long) session.getAttribute("loginUserId");

		// 判斷路徑的id跟登入中id是否一致(若不一致轉到首頁)(還想亂來啊
		if (sessionUId.equals(id)) {
			Member member = memberService.findById(id);

			Page<WishList> wishList = wishListService.findByMemberPageable(p, id);
			int num = wishList.getNumberOfElements();
			m.addAttribute("page", wishList);
			m.addAttribute("num", num);
			logger.info("會員編號：" + member.getCustomerId() + "進入收藏商品");
			return "member/wishlist";
		}
		logger.info("會員編號：" + sessionUId + "嘗試進入 會員編號：" + id + "常用地址");
		return "redirect:/HOME";
	}

	// 收藏狀態修改
	@PostMapping("/wishList/addOrCancel")
	@ResponseBody
	public String addOrCancel(@RequestBody String wish, Model m, HttpSession session) {

		System.out.println(wish);
		JSONObject ob = new JSONObject(wish);		
		Long userId = Long.parseLong(ob.getString("userId"));
		Long productId = Long.parseLong(ob.getString("productId"));

		Member member = memberService.findById((long) userId);

		WorkProduct product = productService.findById((long) productId);

		String msg = wishListService.addOrCancel(member, product);

		logger.info("會員編號：" + userId + msg + "商品編號" + productId);

		return msg;
	}

}
