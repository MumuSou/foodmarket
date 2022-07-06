	package com.foodmarket.app.question.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.ModelAndViewDefiningException;

import com.foodmarket.app.product.model.WorkProduct;
import com.foodmarket.app.question.model.Question;
import com.foodmarket.app.question.service.QuestionService;

@Controller
public class QuestionController {
	
	@Autowired
	private QuestionService qs;
	
	@GetMapping("question/addQuestion")  //跳頁用的，後面是指網址路徑
	public String questionAdd (Model model) {
		Question newQs = new Question();
		model.addAttribute("Question", newQs);
		ArrayList<String> categoryList = new ArrayList<>();
		categoryList.add("產品及服務");
		categoryList.add("配送物流");
		categoryList.add("會員申請");
		categoryList.add("其他");
		model.addAttribute("categoryList",categoryList);
		return "question/addQuestion"; //這邊return是JSP頁面
		
	}
		
	@PostMapping("question/postQuestion")  //傳資料到資料庫
	public String addQuestion (@ModelAttribute("Question") Question qus, Model model) {	
		qs.insertQuestion(qus);		
		ArrayList<String> categoryList = new ArrayList<>();
		categoryList.add("產品及服務");
		categoryList.add("配送物流");
		categoryList.add("會員申請");
		categoryList.add("其他");
		model.addAttribute("categoryList",categoryList);
		return "redirect:/question/viewAllQuestion";
//		return "question/addQuestion";
	}
	
	@GetMapping("question/allQuestion")
	public ModelAndView allQuestion (ModelAndView mav){
		List<Question> allqus = qs.findAll();
		mav.getModel().put("allqus", allqus);
		mav.setViewName("question/allQuestion");
		System.out.println(allqus);
//		System.out.println(allqus.get(0));
//		System.out.println(allqus.get(0).getAnswer());
		return mav;
	}
	
	@GetMapping("question/viewAllQuestion")
	public ModelAndView viewviewAllQuestion(ModelAndView mav, @RequestParam(name="p", defaultValue = "1") Integer pageNumber) {
		Page<Question> pageQuestion = qs.findByPage(pageNumber);
		mav.getModel().put("pageQuestion", pageQuestion);
		mav.setViewName("question/viewAllQuestion");
		return mav;
	}
	
	@GetMapping("question/editQuestion")
	public String editQuestion (@RequestParam(name="id") Integer id, Model model) {
		Question Question = qs.findById(id);
		model.addAttribute("Question", Question);   //這邊的attribute name要和 post使用的ModelAttribute要一樣
		ArrayList<String> categoryList = new ArrayList<>();
		categoryList.add("產品及服務");
		categoryList.add("配送物流");
		categoryList.add("會員申請");
		categoryList.add("其他");
		model.addAttribute("categoryList",categoryList);
		return "question/editQuestion";
	}
	
	@PostMapping("question/editQuestion")
	public String postEditQuestion (@ModelAttribute("Question") Question qus, Model model) {
		qs.insertQuestion(qus);
		ArrayList<String> categoryList = new ArrayList<>();
		categoryList.add("產品及服務");
		categoryList.add("配送物流");
		categoryList.add("會員申請");
		categoryList.add("其他");
		model.addAttribute("categoryList",categoryList);
		return "redirect:/question/viewAllQuestion";
	}
	
	@GetMapping("question/deleteQuestion")
	public String deleteQuestion (@RequestParam(name="id") Integer id) {
		qs.deleteById(id);
		
		return "redirect:/question/viewAllQuestion";
	}
	
	@GetMapping("question/findByQuestionTitle")
	public String findByQuestionTitle(@RequestParam(name="QuestionTitle") String questionTitle, Model model){
		List<Question> findByQuestionTitle = qs.findByQuestionTitle(questionTitle);
		model.addAttribute("QuestionTitle", findByQuestionTitle);
		return "question/findByQuestionTitle";
	}
	
	@PostMapping(path="json/postQuestion")
	@ResponseBody
	public List<Question> test(@RequestBody String questionTitle){
		List<Question> findByQuestionTitle = qs.findByQuestionTitle(questionTitle);
		System.out.println(findByQuestionTitle);

		return findByQuestionTitle;
	}
}
