package com.foodmarket.app.statistic.controller;

import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.foodmarket.app.statistic.service.StatisticOrderItemService;

@Controller
public class StatisticController {
	
	@Autowired
	private StatisticOrderItemService soiService;
	
	@GetMapping("/statistic")
	public String productCountTest() {
		return "statistic/pieChart";
	}
	
	@GetMapping("/statisticCategory")
	public String productCountCategory() {
		return "statistic/pieChart2";
	}
	
	@GetMapping("/productCount")
	@ResponseBody
	public Map getStatisticCount(){
		
//		System.err.println("============== test str ==============");
		
		Map rtnMap = soiService.productCount();
		
//		System.err.println("============== test end ==============");
		
		return rtnMap;
	}
	
	@GetMapping("/productImg")
	@ResponseBody
	public Map getProductImg(){
		Map rtnMap = soiService.productImg();		
		return rtnMap;
	}
	
	@GetMapping("/productId")
	@ResponseBody
	public Map getProductId(){
		Map rtnMap = soiService.productId();		
		return rtnMap;
	}
	
	@GetMapping("/productCountCategory")
	@ResponseBody
	public Map getProductCountCategory(){
		Map rtnMap = soiService.productCountCategory();		
		return rtnMap;
	}
	
	@GetMapping("/productCountVegetable")
	@ResponseBody
	public Map getProductCountVegetable(){
		Map rtnMapVegetable = soiService.productCountVegetable();		
		return rtnMapVegetable;
	}
	
	@GetMapping("/productCountMeat")
	@ResponseBody
	public Map getProductCountMeat(){
		Map rtnMapMeat = soiService.productCountMeat();		
		return rtnMapMeat;
	}
	
	@GetMapping("/productCountFruit")
	@ResponseBody
	public Map getProductCountFruit(){
		Map rtnMapFruit = soiService.productCountFruit();		
		return rtnMapFruit;
	}
	
	@GetMapping("/productCountSeafood")
	@ResponseBody
	public Map getProductCountSeafood(){
		Map rtnMapSeafood = soiService.productCountSeafood();		
		return rtnMapSeafood;
	}
	


}