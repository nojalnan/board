package com.bo.dm.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bo.dm.dto.BoardInfo;
import com.bo.dm.dto.Paging;
import com.bo.dm.mapper.BoardMapper;


@Controller
@RequestMapping("/board")
public class BoardController {
	
	private static final Logger log = LoggerFactory.getLogger(BoardController.class);
	@Autowired
	BoardMapper bm;	

	@RequestMapping(value="/",method = RequestMethod.GET)
	public  String getBoardList(@RequestParam(required=false) Map<String, String> pm,@ModelAttribute Paging page, Model model) {
		pm.put("snum", Integer.toString(page.getStartNum()));
		pm.put("enum",Integer.toString( page.getRowCnt()));
		List<BoardInfo> boardList =  bm.getBoardList(pm);
		int totalCnt = bm.getBoardTotalCount(pm);
		page.setTotalCnt(totalCnt);
		model.addAttribute("boardList",boardList);
		model.addAttribute("page", page);
        return "board/board";
	}

	@RequestMapping(value="/{binum},{nowpage}", method=RequestMethod.GET)
	public String getBoard(@PathVariable("binum") long biNum, @PathVariable("nowpage") long nowPage, Model model){
		BoardInfo bi = bm.getBoard(biNum);
		log.info("{}",nowPage);
		model.addAttribute("board", bi);
		model.addAttribute("nowPage", nowPage);
		return "board/board_view";
	}
	

	@RequestMapping(value="/del", method=RequestMethod.GET)
	public String deleteBoard(@RequestParam(required=false) Map<String, String> pm, Model model){
		int result = bm.deleteBoard(pm);
		model.addAttribute("delete", result);
		model.addAttribute("nowpage", pm.get("nowpage"));
		model.addAttribute("binum", pm.get("binum"));
		return "board/board_delete";
	}

}
