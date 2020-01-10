package com.bo.dm.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bo.dm.dto.BoardInfo;
import com.bo.dm.dto.Paging;
import com.bo.dm.dto.SearchVO;
import com.bo.dm.mapper.BoardMapper;


@Controller
@RequestMapping("/board")
public class BoardController {
	
	private static final Logger log = LoggerFactory.getLogger(BoardController.class);
	@Autowired
	BoardMapper bm;

	@RequestMapping(value="/",method = RequestMethod.GET)
	public  String getBoardList(@RequestParam(required=false) Map<String, String> pm, @ModelAttribute Paging page, SearchVO searchVO, Model model) {
		pm.put("snum", Integer.toString(page.getStartNum()));
		pm.put("enum",Integer.toString( page.getRowCnt()));
		pm.put("bititle", searchVO.getBiTitle());
		pm.put("bipublisher", searchVO.getBiPublisher());
		pm.put("creusr", searchVO.getCreUsr());
		pm.put("startDate", searchVO.getStartDate());
		pm.put("endDate", searchVO.getEndDate());
		pm.put("keyword", searchVO.getKeyword());
		pm.put("isbn", searchVO.getIsbn());
//		pm.put("credat", searchVO.getCreDat());
		
		List<BoardInfo> boardList =  bm.getBoardList(pm);
		int totalCnt = bm.getBoardTotalCount(pm);
		page.setTotalCnt(totalCnt);
		model.addAttribute("searchVO", searchVO);
		model.addAttribute("boardList",boardList);
		model.addAttribute("page", page);
        return "board/board";
	}
	
	@Scheduled(fixedRateString = "600000", initialDelay = 3000)
	private void scheduleBoardHist() { 
		System.out.println("이력저장을 합니다.");
		bm.insertBoardHist();
	}

}
