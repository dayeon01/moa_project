package com.mono.moa.dao;

import java.util.*;

import org.mybatis.spring.*;
import org.springframework.beans.factory.annotation.*;

import com.mono.moa.util.*;

public class BoardDao {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	/*
	 * //총 게시글 수 조회 질의명령 public int getTotal() { return
	 * sqlSession.selectOne("bSQL.totalCnt"); }
	 * 
	 * //게시글 조회 전담 처리함수 public List nboardList(PageUtil page) { return
	 * sqlSession.selectList("bSQL.nboardList",page); }
	 */
}
