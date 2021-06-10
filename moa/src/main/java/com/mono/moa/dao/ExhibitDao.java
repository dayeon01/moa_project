package com.mono.moa.dao;

import java.util.*;

import org.mybatis.spring.*;
import org.springframework.beans.factory.annotation.*;

import com.mono.moa.vo.*;

public class ExhibitDao {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	//전시정보 조회 전담 처리 함수
	public List getExhList() {
		return sqlSession.selectList("eSQL.exhList");
		
	}
	
	//전시 상세보기 전담 처리 함수
	public EventVO getExhDetail(int exino) {
		return sqlSession.selectOne("eSQL.exhDetail", exino);
	}
	
}
