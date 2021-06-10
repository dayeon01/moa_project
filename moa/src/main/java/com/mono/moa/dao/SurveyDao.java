package com.mono.moa.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.mono.moa.vo.SurveyVO;

public class SurveyDao {
	@Autowired
	SqlSessionTemplate sqlSession;
	
	// 전시맵 조회
	
	public List getMapList() {
		return sqlSession.selectList("svSQL.getMapList");
	}
	
	// 진행중인 설문조사 리스트
	public List getList() {
		return sqlSession.selectList("svSQL.ingSrvy");
	}
	
	// 설문조사 문제 리스트
	public List questList(int sino) {
		return sqlSession.selectList("svSQL.selQuest", sino);
	}
	
	// 설문조사 답안 리스트
	public List exList(int qno) {
		return sqlSession.selectList("svSQL.selEx", qno);
	}
	
	// 설문조사 결과 추가
	public int insertAnswer(SurveyVO svVO) {
		return sqlSession.insert("svSQL.addAnswer", svVO);
	}
	
	// 설문 응답 결과
	public List getExResult(SurveyVO svVO) {
		return sqlSession.selectList("svSQL.resultEx", svVO);
	}
	
	// 로그인 회원 설문 참여여부 체크
	public int answerCnt(SurveyVO svVO) {
		return sqlSession.selectOne("svSQL.answerCount", svVO);
	}
}
