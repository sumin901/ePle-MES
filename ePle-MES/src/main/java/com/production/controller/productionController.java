package com.production.controller;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.annotations.Param;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.production.domain.ajaxSearchVO;
import com.production.domain.instructionVO;
import com.production.service.productionService;

@Controller
@RequestMapping(value = "/production/*")
public class productionController {
	
	private static final Logger logger = LoggerFactory.getLogger(productionController.class);
	
	@Inject
	private productionService pdService;
	
	//http://localhost:8088/production/instruction
	//지시사항 조회
	@RequestMapping(value = "/instruction", method = RequestMethod.GET)
	public void instruction(Model model) throws Exception {
		logger.debug("Controller : instruction() 호출");
		//지시사항 테이블 요소
		model.addAttribute("instructionVOList", pdService.getInstruction());
		//검색용 중복제거 목록
		model.addAttribute("productList", pdService.getProduct());
		model.addAttribute("line_codeList", pdService.getLine_code());
		model.addAttribute("requestList", pdService.getRequest());
	}
	
	//지시사항 검색(ajax)
	@RequestMapping(value = "/ajaxSearch", method = RequestMethod.POST)
	@ResponseBody
	public List<instructionVO> ajaxSearch(@RequestParam(value = "product", required = false) String[] product,@RequestParam(value = "line_code", required = false) String[] line_code,@RequestParam(value = "request", required = false) String[] request,Model model) throws Exception {
		logger.debug("Controller : ajaxSearch() 호출");
		List<instructionVO> instructionVOList = pdService.ajaxSearch(product,line_code,request);
		logger.debug("instructionVOList : " + instructionVOList);
		return instructionVOList;
	}
	
	//지시사항 추가
	@RequestMapping(value = "/instructionAdd", method = RequestMethod.GET)
	public void instructionAdd(Model model) throws Exception {
		logger.debug("Controller : add() 호출");
		//수주번호 불러오기
		model.addAttribute("requestList", pdService.getRequestList());
		//라인 불러오기
		model.addAttribute("line_codeList", pdService.getLine_codeList());
	}
	
	//지시사항 추가 제품 불러오기(ajax)
	@RequestMapping(value = "/ajaxGetProductList", method = RequestMethod.POST)
	@ResponseBody
	public List<String> ajaxGetProductList(String requestCode) throws Exception {
		logger.debug("Controller : ajaxGetProductList() 호출");
		//제품 불러오기
		return pdService.getProductList();
	}
	
	//지시사항 추가 갯수 불러오기(ajax)
	@RequestMapping(value = "/ajaxGetProductList", method = RequestMethod.POST)
	@ResponseBody
	public int ajaxGetAmount(String requestCode, String productCode) throws Exception {
		logger.debug("Controller : ajaxGetAmount() 호출");
		//갯수 불러오기
		return pdService.getAmount();
	}
}
