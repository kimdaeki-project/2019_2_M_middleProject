package com.mid.pro.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.mid.pro.model.RestaurantVO;
import com.mid.pro.model.ReviewVO;
import com.mid.pro.service.RestaurantService;
import com.mid.pro.service.ReviewService;
import com.mid.pro.util.Pager;

@Controller
@RequestMapping("/review/**")
public class ReviewController {
	
	@Inject
	private ReviewService reviewService;
	@Inject
	private RestaurantService restaurantService;

	//list
	@GetMapping(value = "reviewList")
	public ModelAndView reviewList(Pager pager, RestaurantVO restaurantVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		restaurantVO = restaurantService.restSelect(restaurantVO);
		List<ReviewVO> list = reviewService.reviewList(pager);
//		System.out.println(restaurantVO);
//		System.out.println(list);
//		mv.addObject("vo", restaurantVO);
		mv.addObject("pager", pager);
		mv.addObject("list", list);
		mv.setViewName("review/reviewList");
		
		return mv;
	}
	//select
	@GetMapping(value = "reviewSelect")
	public ModelAndView reviewSelect(ReviewVO reviewVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		reviewVO = reviewService.reviewSelect(reviewVO);
		if (reviewVO != null) {
			mv.addObject("vo", reviewVO);
			mv.setViewName("review/reviewSelect");
		} else {
			mv.addObject("msg", "해당 내용이 없습니다.");
			mv.addObject("path", "./");
			mv.setViewName("common/common_result");
		}
		return mv;
	}
	//write
	@GetMapping(value = "reviewWrite")
	public ModelAndView reviewWrite(RestaurantVO restaurantVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		restaurantVO = restaurantService.restSelect(restaurantVO);
		mv.addObject("vo", restaurantVO);
		mv.setViewName("review/reviewWrite");
		
		return mv;
	}
	@PostMapping(value = "reviewWrite")
	public ModelAndView reviewWrite(ReviewVO reviewVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = reviewService.reviewWrite(reviewVO);
		String msg = "리뷰 작성에 실패하였습니다.";
		if (result > 0) {
			mv.setViewName("redirect:../restaurant/restList");
		} else {
			mv.addObject("msg", msg);
			mv.addObject("path", "../restaurant/restaurantList");
			mv.setViewName("common/common_result");
		}
		return mv;
	}
	//update
	@GetMapping(value = "reviewUpdate")
	public ModelAndView reviewUpdate(ReviewVO reviewVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		reviewVO = reviewService.reviewSelect(reviewVO);
		if (reviewVO != null) {
			mv.addObject("vo", reviewVO);
			mv.setViewName("../restaurant/restaurantList");
		} else {
			mv.addObject("msg", "수정할 리뷰가 없습니다.");
			mv.addObject("path", "../restaurant/restaurantList");
			mv.setViewName("common/common_result");
		}
		return mv;
			
	}
	@PostMapping(value = "reviewUpdate")
	public ModelAndView reviewUpdate2(ReviewVO reviewVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = reviewService.reviewUpdate(reviewVO);
		String msg = "리뷰 수정에 실패하였습니다.";
		if (result > 0) {
			mv.setViewName("redirct:../restaurant/restaurantList");
		} else {
			mv.addObject("msg", msg);
			mv.addObject("path", "../restaurant/restaurantList");
			mv.setViewName("common/common_result");
		}
		return mv;
	}
	//delete
	@GetMapping(value = "reviewDelete")
	public ModelAndView reviewDelete(ReviewVO reviewVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = reviewService.reviewDelete(reviewVO);
		String msg = "리뷰 삭제에 실패하였습니다.";
		if (result > 0) {
			mv.setViewName("redirect:../restaurant/restaurantList");
		} else {
			mv.addObject("msg", msg);
			mv.addObject("path", "../restaurant/restaurantList");
			mv.setViewName("common/common_result");
		}
		return mv;
	}
}
