package com.mono.moa.dao;

import java.util.*;

import org.mybatis.spring.*;
import org.springframework.beans.factory.annotation.*;

import com.mono.moa.util.*;
import com.mono.moa.vo.*;

public class SubPageDao {

	@Autowired
	SqlSessionTemplate sqlSession;
	
//--------------------------------event-----------------------------------	
	//이벤트중인 전시 총 갯수 조회 처리 함수
	public int getTotal() {
		return sqlSession.selectOne("sbSQL.totalCnt");
	}
	
	
	//이벤트 리스트 조회 전담 처리 함수
	public List getEvnList(PageUtil page) {
		return sqlSession.selectList("sbSQL.eventList",page);
	}

	//전시 정보 리스트 조회 전담 처리 함수
	public List getExhiList(PageUtil page) {
		return sqlSession.selectList("sbSQL.allExhiList", page);
	}
	
	//전시 이벤트 추가 전담 처리 함수
	public int getAddEvent(EventVO eVO) {
		return sqlSession.insert("sbSQL.addEvent", eVO);
		
	}
	
	
	
	
	
	
	
	
	
	
//------------------------------search--------------------------------------	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
//---------------------------------pay-----------------------------------
	
	
	
}
