package com.mono.moa.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.mono.moa.vo.MemberVO;

public class MemberDao {
	@Autowired
	SqlSessionTemplate sqlSession;
	
	
	// 아이디 체크
	public int idCheck(String sid) {
		return sqlSession.selectOne("mSQL.idCheck", sid);
	}
	
	// 로그인 아이디 비번 검사
	public int getLogin(MemberVO mVO) {
		return sqlSession.selectOne("mSQL.getLogin", mVO);
	}
	
	// 회원가입
	public int addMember(MemberVO mVO) {
		return sqlSession.insert("mSQL.addMember", mVO);
	}
	
	// 나의 정보보기
	public MemberVO getMyInfo(String id) {
		return sqlSession.selectOne("mSQL.getMyInfo", id);
	}
	
	// 나의 정보수정처리
	public int myInfoEdit(MemberVO mVO) {
		return sqlSession.update("mSQL.myInfoEdit", mVO);
	}

	// 나의정보 삭제
	public int myInfoDel(String id) {
		return sqlSession.update("mSQL.myInfoDel", id);
	}
	
	// 아이디 찾기
	public MemberVO loginFindId(MemberVO mVO) {
		return sqlSession.selectOne("mSQL.loginFindId", mVO);
	}
	
	// 비밀번호 찾기
	public String loginFindPw(MemberVO mVO) {
		return sqlSession.selectOne("mSQL.loginFindPw", mVO);
	}
	
	// 비밀번호 찾기 후 비번 임시비번 저장
	public int editPw(MemberVO mVO) {
		return sqlSession.update("mSQL.editPw", mVO);
	}
	
}








