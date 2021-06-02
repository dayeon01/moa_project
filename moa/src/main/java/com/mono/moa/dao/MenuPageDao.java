package com.mono.moa.dao;

import java.util.List;

import org.mybatis.spring.*;
import org.springframework.beans.factory.annotation.*;

import com.mono.moa.util.PageUtil;

public class MenuPageDao {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	// 전시목록 총 개수 조회 전담 처리함수
	public int getTotal() {
		return sqlSession.selectOne("mpSQL.getTotal");
	}
	
	// 일반전시 리스트 조회 전담 처리함수
	public List getExiList(PageUtil page) {
		return sqlSession.selectList("mpSQL.exiList", page);
	}
	
	// 미술전 리스트 조회 전담 처리함수
	public List getArtList(PageUtil page) {
		return sqlSession.selectList("mpSQL.artList", page);
	}
	
	// 테마전 리스트 조회 전담 처리함수
	public List getThemeList(PageUtil page) {
		return sqlSession.selectList("mpSQL.themeList", page);
	}
}
