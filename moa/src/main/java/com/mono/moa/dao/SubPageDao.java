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

	//이벤트 가격 설정 전담 처리함수
	public List getprice() {
		return sqlSession.selectList("sbSQL.setPrice");
	}
	
	
	
	
	
	
	
	
	
//------------------------------search--------------------------------------	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
//---------------------------------pay-----------------------------------
	
	
	
}
