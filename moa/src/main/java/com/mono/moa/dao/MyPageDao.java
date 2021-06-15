package com.mono.moa.dao;

import java.util.*;

import org.mybatis.spring.*;
import org.springframework.beans.factory.annotation.*;

import com.mono.moa.vo.*;

public class MyPageDao {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	public List getPayList(PayVO payVO) {
		return sqlSession.selectList("mypSQL.payList", payVO);
	}
}
