package com.bo.dm.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

import com.bo.dm.dto.BoardInfo;
import com.bo.dm.dto.SearchVO;


@Component
public class BoardDao {
	private final SqlSession sqlSession;

	public BoardDao(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	public List<BoardInfo> selectCityById(Map<String, String> pMap) {
		return this.sqlSession.selectList("selectCityById", pMap);
	}

	public Integer getBoardCount(Map<String, String> pMap){
		return this.sqlSession.selectOne("getBoardCount",pMap);
	}
}
