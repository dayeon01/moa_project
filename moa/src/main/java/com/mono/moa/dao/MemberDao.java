package com.mono.moa.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.mono.moa.vo.MemberVO;

public class MemberDao {
	@Autowired
	SqlSessionTemplate sqlSession;
	
	public int idCheck(String sid) {
		return sqlSession.selectOne("mSQL.idCheck", sid);
	}
	
	public int getLogin(MemberVO mVO) {
		return sqlSession.selectOne("mSQL.getLogin", mVO);
	}
	
	public int addMember(MemberVO mVO) {
		return sqlSession.insert("mSQL.addMember", mVO);
	}
	
	public MemberVO getMyInfo(String id) {
		return sqlSession.selectOne("mSQL.getMyInfo", id);
	}
	
	public int myInfoEdit(MemberVO mVO) {
		return sqlSession.update("mSQL.myInfoEdit", mVO);
	}

	public int myInfoDel(String id) {
		return sqlSession.update("mSQL.myInfoDel", id);
	}
	
	public MemberVO loginFindId(MemberVO mVO) {
		return sqlSession.selectOne("mSQL.loginFindId", mVO);
	}
	
	public String loginFindPw(MemberVO mVO) {
		return sqlSession.selectOne("mSQL.loginFindPw", mVO);
	}
	
	public int editPw(MemberVO mVO) {
		return sqlSession.update("mSQL.editPw", mVO);
	}
	
}








