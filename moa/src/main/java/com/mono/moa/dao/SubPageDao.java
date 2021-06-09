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

	//이벤트, 일반 전시 전체 정보 리스트 조회 전담 처리 함수
	public List allExhiList(PageUtil page) {
		return sqlSession.selectList("sbSQL.allExhiList", page);
	}
	
	//이벤트 전시 추가 전담 처리 함수
	public int getAddEvent(EventVO evnVO) {
		return sqlSession.insert("sbSQL.addEvent", evnVO);
		
	}
	
	//이벤트 전시 삭제 전담 처리 함수
	public int getEvtDel(int evtexino) {
		return sqlSession.update("sbSQL.evtDel", evtexino);
	}
	
	
	
	
	
	
	
	
	
//------------------------------search--------------------------------------	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
//---------------------------------pay-----------------------------------
	
	
	
}
