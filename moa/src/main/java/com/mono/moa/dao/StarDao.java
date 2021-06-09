package com.mono.moa.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.mono.moa.util.PageUtil;
import com.mono.moa.vo.FileVO;
import com.mono.moa.vo.ReviewVO;

public class StarDao {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	// 전시정보 전체리스트 갯수조회
	public int getTotal() {
		return sqlSession.selectOne("sSQL.getTotal");
	}
	
	// 전시정보 전체 조회
	public List reviewList(PageUtil page) {
		return sqlSession.selectList("sSQL.reviewList", page);
	}
	
	// 전시정보 상세 조회
	public ReviewVO reviewListDetail(ReviewVO rVO) {
		return sqlSession.selectOne("sSQL.reviewListDetail", rVO);
	}
	
	// 전시정보 댓글 유무 조회
	public int getReview(ReviewVO rVO) {
		return sqlSession.selectOne("sSQL.getReview", rVO);
	}
	
	// 전시 댓글 조회
	public List replyList(ReviewVO rVO) {
		return sqlSession.selectList("sSQL.replyList", rVO);
	}
	
	// 전시 댓글 추가
	public int addReply(ReviewVO rVO) {
		return sqlSession.insert("sSQL.addReply", rVO);
	}
	
	// 전시 댓글 파일 추가
	public int addFile(FileVO fVO) {
		return sqlSession.insert("sSQL.addFile", fVO);
	}
	
	// 전시 댓글 파일 조회
	public List subFileList(int bno) {
		return sqlSession.selectList("sSQL.subFile", bno);
	}
	
	// 전시 정보 삭제
	public int reviewDel (int bno) {
		return sqlSession.update("sSQL.reviewDel", bno);
	}
	
	// 첨부파일 삭제
	public int delSub (int bno) {
		return sqlSession.update("sSQL.delSub", bno);
	}
	
	// 전시 댓글 평점 결과 조회
	public ReviewVO reviewResult (ReviewVO rVO) {
		return sqlSession.selectOne("sSQL.reviewResult", rVO);
	}
}
