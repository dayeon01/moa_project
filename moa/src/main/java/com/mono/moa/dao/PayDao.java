package com.mono.moa.dao;

import org.mybatis.spring.*;
import org.springframework.beans.factory.annotation.*;

import com.mono.moa.vo.*;

public class PayDao {

	@Autowired
		SqlSessionTemplate sqlSession;
	
	//결제 정보 등록 전담 처리 함수
	public int addpayinfo(PayVO payVO) {
		return sqlSession.insert("paySQL.addpay", payVO);
	}
	
}
