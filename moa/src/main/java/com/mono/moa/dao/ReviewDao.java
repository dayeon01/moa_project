package com.mono.moa.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.mono.moa.util.PageUtil;
import com.mono.moa.vo.ReviewVO;

public class ReviewDao {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	public int getTotal(ReviewVO rVO) {
		return sqlSession.selectOne("reSQL.getTotal", rVO);
	}
	
	public List qnaList(PageUtil page) {
		return sqlSession.selectList("reSQL.qnaList", page);
	}
	
	public ReviewVO qnaListDetail(ReviewVO rVO) {
		return sqlSession.selectOne("reSQL.qnaListDetail", rVO);
	}
	
	public String getId(int bno) {
		return sqlSession.selectOne("reSQL.getId", bno);
	}
	
	public int qnaWrite(ReviewVO rVO) {
		return sqlSession.insert("reSQL.qnaWrite", rVO);
	}
	
	public int qnaWriteAdmin(ReviewVO rVO) {
		return sqlSession.update("reSQL.qnaWriteAdmin", rVO);
	}
	
	public int qnaEdit(ReviewVO rVO) {
		return sqlSession.update("reSQL.qnaEdit", rVO);
	}
	
	public int qnaEditAdmin(ReviewVO rVO) {
		return sqlSession.update("reSQL.qnaEditAdmin", rVO);
	}
	
	public int qnaDel(int bno) {
		return sqlSession.update("reSQL.qnaDel", bno);
	}

}
