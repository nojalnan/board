package com.bo.dm.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.data.repository.query.Param;

import com.bo.dm.dto.BoardInfo;
import com.bo.dm.dto.SearchVO;


@Mapper
public interface BoardMapper{
	List<BoardInfo> getBoardList(Map<String, String> param);
	Integer getBoardTotalCount(Map<String, String> param);
	
	void insertBoardHist();
}
