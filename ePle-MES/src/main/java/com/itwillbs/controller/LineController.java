package com.itwillbs.controller;

import com.itwillbs.domain.Criteria;
import com.itwillbs.domain.LineVO;
import com.itwillbs.domain.PageVO;
import com.itwillbs.service.LineService;

import java.util.Arrays;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/** 라인 관리 컨트롤러 **/

@Controller
@RequestMapping("/line")
public class LineController {

    private static final Logger logger = LoggerFactory.getLogger(LineController.class);

    @Inject
    private LineService lService;

    // http://localhost:8088/line/lineAll
      
    // 라인 리스트 - GET
    @RequestMapping(value = "/lineAll", method = RequestMethod.GET)
    public String listAllGET(Model model,
                             @ModelAttribute("result") String result,
                             HttpSession session) throws Exception {
        session.setAttribute("viewcntCheck", true);
        List<LineVO> lineList = lService.lineListAll();
        System.out.println(lineList);
        model.addAttribute("lineList", lineList);
        return "/line/lineAll";
    }

    // 라인 수정 - GET
    @RequestMapping(value = "/update", method = RequestMethod.GET)
    public void updateGET(@RequestParam("code") String code, Model model) throws Exception {
    	System.out.println("code: " + code); // 코드 값 확인용
    	LineVO lvo = lService.getLine(code);
    	System.out.println(lvo);
        model.addAttribute("lvo", lvo);
    }

    // 라인 수정 - POST
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public String updatePOST(LineVO lvo, RedirectAttributes rttr) throws Exception {
        int a = lService.lineUpdate(lvo);
        System.out.println(a);
        return "redirect:/line/lineAll"; // 수정 후 목록 페이지로 이동
    }

    // 라인 삭제 - GET, POST
    @GetMapping("/delete")
    public String lineDeleteGET(@RequestParam("code") String codes, Model model) throws Exception {
        // 품목 삭제 폼
        String[] codeArr = codes.split(",");
        List<LineVO> lvo = lService.getInfo(codeArr);
        model.addAttribute("lvo", lvo);

        // JavaScript 변수 설정
        model.addAttribute("delCheckedCount", codeArr.length);
        model.addAttribute("array", Arrays.asList(codeArr));

        return "line/delete"; // 적절한 뷰 페이지로 이동
    }

    @PostMapping("/delete")
    public String lineDeletePOST(@RequestParam("code") String codes, RedirectAttributes rttr, Model model) throws Exception {
        // 라인 삭제 액션
        String[] codeArr = codes.split(",");
        int result = lService.deleteLines(codeArr);

        String link = "";
        if (result >= 1) {
          link = "redirect:/confirm";
          rttr.addFlashAttribute("title", "라인 삭제 결과");
          rttr.addFlashAttribute("result", "라인이 삭제 되었습니다.");
        } else {
          link = "redirect:/error";
          rttr.addFlashAttribute("title", "라인 삭제 결과");
          rttr.addFlashAttribute("result", "오류가 발생했습니다!");
        }

        // JavaScript 변수 설정
        model.addAttribute("delCheckedCount", codeArr.length);
        model.addAttribute("array", Arrays.asList(codeArr));

        // 자동 새로고침을 위해 부모 페이지 URL에 파라미터 추가
        link += "?refresh=true";

        return link;
    }


    // 페이징 처리 - 게시판 리스트 - GET
    @RequestMapping(value = "/linePage", method = RequestMethod.GET)
    public String listPageGET(Model model,
                              @ModelAttribute("result") String result,
                              HttpSession session,
                              Criteria cri) throws Exception {
        session.setAttribute("viewcntCheck", true);

        List<LineVO> lineList = lService.lineListPage(cri);

        PageVO pageVO = new PageVO();
        pageVO.setCri(cri);
        pageVO.setTotalCount(lService.totalLineCount());
        model.addAttribute("pageVO", pageVO);
        model.addAttribute("lineList", lineList);
        return "/line/lineAll";
    }

    // 라인 추가 - GET, POST
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public void lineInsertGET() throws Exception { 
		
	}
	
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String lineInsertPOST(LineVO lvo, RedirectAttributes rttr) throws Exception {

		// 서비스 - DB에 글쓰기(insert) 동작 호출
		lService.InsertLine(lvo);	
		return "redirect:/line/lineAll";
	}

    // 전체 목록의 수를 가져오는 메서드
    @RequestMapping(value = "/totalLineCount", method = RequestMethod.GET)
    @ResponseBody
    public int getTotalLineCount() throws Exception {
        return lService.totalLineCount();
    }
    
    // 라인 검색 - GET
}
