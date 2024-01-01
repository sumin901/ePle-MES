package com.itwillbs.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.itwillbs.domain.Criteria;
import com.itwillbs.domain.PageVO;
import com.itwillbs.domain.RequestSearchVO;
import com.itwillbs.domain.RequestVO;
import com.itwillbs.service.RequestService;

/** ShipmentController : 출하 컨트롤러
 * 
 *  : request 를 shipment로 고쳐서 사용 필요
 *  
 **/

@Controller
@RequestMapping(value = "/shipment/*")
public class ShipmentController {
	
	private static final Logger logger = LoggerFactory.getLogger(ShipmentController.class);
	
	@Inject
	private RequestService rService;
		
	
	// http://localhost:8088/shipment/list
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void shipmentListGET(Model model, 
							   HttpSession session, 
							   @ModelAttribute("result") String result, Criteria cri
							   ) throws Exception { //5-1
		// 수주 목록 return
		logger.debug("shipmentListGET -> DB에서 목록 가져오기(페이징 처리하기)");

		List<RequestVO> requestList = rService.requestListpage(cri);
		
		PageVO pageVO = new PageVO();
		pageVO.setCri(cri);
		pageVO.setTotalCount(rService.getTotal()); // 디비에서 직접 실행결과 가져오기
		
		model.addAttribute("List",requestList);
		model.addAttribute("pageVO", pageVO);
		

	}
	
	// http://localhost:8088/request/info
	@RequestMapping(value = "/info", method = RequestMethod.GET)
	public void requestInfo(@RequestParam(value = "code") String code,Model model) throws Exception {// 수주개별정보 5-2
		logger.debug("requestInfo -> DB에서 수주번호가 일치하는 데이터 열 가져오기");
		logger.debug("Controller - code "+code);
		
		RequestVO vo = rService.getinfo(code);
		logger.debug("Controller - vo "+vo);
		

		
		model.addAttribute("vo",vo);

	}
	
	// http://localhost:8088/request/search
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	@ResponseBody
	public List<RequestVO> searchRequestGET(RedirectAttributes rttr, @ModelAttribute("result") String result, 
								 RequestVO vo) throws Exception { // 수주검색 5-3
		logger.debug("searchRequestGET() -> 정보 받아서 DB에 조회하기");
		logger.debug("Controller - vo "+vo);
		// 전달받을 정보(수주상태 ,담당자코드, 업체코드
		
		List<RequestVO> RequestList= rService.findRequestList(vo);
		logger.debug("검색정보 : "+RequestList);
		
		rttr.addFlashAttribute("searchList",RequestList);
		
		return RequestList;
	}
	
	
	

	// http://localhost:8088/request/add
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public void requestInsertGET() throws Exception { 
		logger.debug("requestInsertGET() -> 입력폼 팝업");
		// 수주 추가 폼 5-4
		
	}
	
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String requestInsertPOST(RequestVO vo, RedirectAttributes rttr) throws Exception {
		// 수주 추가 액션
		logger.debug("(^^)/insert 예정 정보 "+vo);
		
		rService.dataInsertRequest(vo);
		
		rttr.addAttribute("result", "AddDone");
		
		return "redirect:/request/list";
	}
	
	// -------- 수주등록 데이터 찾기 ---------
	
	@RequestMapping(value = "searchClient", method=RequestMethod.GET)
	public void searchClientGET(RequestVO vo, Model model, HttpSession session)throws Exception{
		logger.debug("controller : 거래사 정보 찾기");
		logger.debug("searchClientGET    실행");

		// 거래사 리스트 출력하기
		List<RequestVO> clientList = rService.ClientList();
		logger.debug("clientList : "+clientList);
		model.addAttribute("List", clientList);

	}
	
	@RequestMapping(value = "searchClient", method=RequestMethod.POST)
	public List<RequestVO> searchClientPOST(@RequestParam("client_code") String client_code,
											@RequestParam("clientName") String clientName,Model model)throws Exception{
		logger.debug("controller : 거래사 정보 DB 검색결과 가져오기");
		logger.debug("searchClientPOST    실행");

		List<RequestVO> clientList = rService.findClient(client_code,clientName);
//		model.addAttribute("List", clientList);
		logger.debug("가져온 List"+clientList);
		
		return clientList;
	}
	
	@RequestMapping(value = "searchManager" ,method = RequestMethod.GET)
	public void searchManagerGET(Model model, HttpSession session)throws Exception{
		logger.debug("controller : 담당자 정보 찾기");
		logger.debug("searchManagerGET    실행");
		
		List<RequestVO> managerList = rService.ManagerList();
		model.addAttribute("List", managerList);

	}
	
	@RequestMapping(value = "searchManager" ,method = RequestMethod.POST)
	@ResponseBody
	public List<RequestVO> searchManagerPOST(@RequestParam("manager") String manager,
								  @RequestParam("managerName") String managerName, Model model)throws Exception{
		
		logger.debug("controller : 담당자 정보 DB 검색결과 가져오기");
		logger.debug("searchManagerPOST    실행");
		
		List<RequestVO> managerList = rService.findManager(manager,managerName);
//		model.addAttribute("List", managerList);
		logger.debug("가져온 List"+managerList);
		
		return managerList;
		
	}
	
	@RequestMapping(value = "searchProduct",method = RequestMethod.GET)
	public void searchProductGET(Model model, HttpSession session)throws Exception{
		logger.debug("controller : 상품 정보 찾기");
		logger.debug("searchProductGET   실행");
		
		List<RequestVO> productList = rService.ProductList();
		model.addAttribute("List", productList);
	}
	
	@RequestMapping(value = "searchProduct",method = RequestMethod.POST)
	@ResponseBody
	public List<RequestVO> searchProductPOST(@RequestParam("product") String product,
								  @RequestParam("productName") String productName, Model model)throws Exception{
		// 찾아와야하는것 : 품번, 품명, 재고, 단위, 단가
		logger.debug("controller : 상품 정보 DB 검색결과 가져오기 ");
		logger.debug("searchProductPOST   실행");
		
		List<RequestVO> productList = rService.findProduct(product,productName); 
//		model.addAttribute("List", productList);
		logger.debug("가져온 List"+productList);
		return productList;
	}

	// -------- 수주등록 데이터 찾기 끝---------
	
	
	// http://localhost:8088/request/update
	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public void requestUpdateGET(RequestVO vo, Model model) throws Exception{
		// 수주 수정 폼5-5
		// code 정보 받아서 해당하는 code 데이터 불러오기
		logger.debug("requestUpdateGET(RequestVO vo) 폼 정보 받아서 그대로 토해내기");
		logger.debug("vo "+vo);
		model.addAttribute("List",vo);
		
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public void requestUpdatePOST(RequestVO vo) throws Exception{
		// 수주 수정 액션
		logger.debug("requestUpdatePOST() 전달받은 정보 DB 저장하기");
		logger.debug("vo "+vo);
		
		// 일단 임시 아이디값(실제로는 세션에서 값을 받아와야함)
		String id = "id";
		rService.updateRequest(vo, id);

	}
	
	
	// http://localhost:8088/request/delete
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public void requestDeleteGET(@RequestParam("code") String codes, Model model ) throws Exception{
		// 수주 삭제 폼5-6
		// 전달정보 저장
		String[] code = codes.split(",");
		List<RequestVO> vo = rService.getinfo(code);
		logger.debug("찾아온 삭제 정보 vo"+vo);
		model.addAttribute("List", vo);
		
	}
	
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public void requestDeletePOST(@RequestParam("code") String codes) throws Exception{
		// 수주 삭제 액션
		logger.debug("삭제가 될랑가 codes "+codes);
		String[] code = codes.split(",");
		rService.deleteRequest(code);
	}
	
	//======================================================================= 
	// 필요기능 1. 프린트
	
	@RequestMapping(value = "/print")
	public void printShipment(@RequestParam("code") String codes)throws Exception{
		logger.debug("일단 큐알 이미지를 생성해서 jsp로 전달해야함");
	}
	
	// 필요기능 2. 큐알 스캔 시 업뎃
	@RequestMapping(value = "/qr", method = RequestMethod.POST)
	public void scanningQR()throws Exception{
		logger.debug("QR을 스캔하면 /shipment/qr로 이동.");
		logger.debug("이곳에서 수주상태를 수령 으로 변경하면 된다!");
	}
	
	
	//======================================================================= 스위트 알람 테스트
	@GetMapping ("/confirm")
	public void resultConfirm() throws Exception{
	}
	
	@RequestMapping(value = "/error", method = RequestMethod.GET)
	public void errorConfirm() throws Exception {
	}
	@GetMapping ("/success")
	public void success() throws Exception {
	}
}