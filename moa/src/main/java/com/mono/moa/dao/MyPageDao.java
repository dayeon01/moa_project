package com.mono.moa.dao;

import java.util.*;

import org.mybatis.spring.*;
import org.springframework.beans.factory.annotation.*;

public class MyPageDao {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	public List getPayList(String id) {
		return sqlSession.selectList("mypSQL.payList", id);
	}
}
