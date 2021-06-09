package com.mono.moa.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.mono.moa.util.PageUtil;
import com.mono.moa.vo.ReviewVO;

public class ReviewDao {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	// Qna 전체갯수 조회
	public int getTotal(ReviewVO rVO) {
		return sqlSession.selectOne("reSQL.getTotal", rVO);
	}
	
	// Qna 전체리스트 조회
	public List qnaList(PageUtil page) {
		return sqlSession.selectList("reSQL.qnaList", page);
	}
	
	// Qna 상세 조회
	public ReviewVO qnaListDetail(ReviewVO rVO) {
		return sqlSession.selectOne("reSQL.qnaListDetail", rVO);
	}
	
	// Qna 작성자 아이디 조회
	public String getId(int bno) {
		return sqlSession.selectOne("reSQL.getId", bno);
	}
	
	// Qna 글쓰기 추가 (일반회원)
	public int qnaWrite(ReviewVO rVO) {
		return sqlSession.insert("reSQL.qnaWrite", rVO);
	}
	
	// Qna 글쓰기 댓글 (관리자)
	public int qnaWriteAdmin(ReviewVO rVO) {
		return sqlSession.update("reSQL.qnaWriteAdmin", rVO);
	}
	
	// Qna 글수정 (일반회원)
	public int qnaEdit(ReviewVO rVO) {
		return sqlSession.update("reSQL.qnaEdit", rVO);
	}
	
	// Qna 댓글수정 (관리자)
	public int qnaEditAdmin(ReviewVO rVO) {
		return sqlSession.update("reSQL.qnaEditAdmin", rVO);
	}
	
	// Qna 글삭제
	public int qnaDel(int bno) {
		return sqlSession.update("reSQL.qnaDel", bno);
	}

}
