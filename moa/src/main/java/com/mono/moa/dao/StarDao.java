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
	
	public int getTotal() {
		return sqlSession.selectOne("sSQL.getTotal");
	}
	
	public List reviewList(PageUtil page) {
		return sqlSession.selectList("sSQL.reviewList", page);
	}
	public ReviewVO reviewListDetail(ReviewVO rVO) {
		return sqlSession.selectOne("sSQL.reviewListDetail", rVO);
	}
	public List replyList(ReviewVO rVO) {
		return sqlSession.selectList("sSQL.replyList", rVO);
	}
	public int addReply(ReviewVO rVO) {
		return sqlSession.insert("sSQL.addReply", rVO);
	}
	
	public int addFile(FileVO fVO) {
		return sqlSession.insert("sSQL.addFile", fVO);
	}
	
	public List subFileList(int bno) {
		return sqlSession.selectList("sSQL.subFile", bno);
	}
}
