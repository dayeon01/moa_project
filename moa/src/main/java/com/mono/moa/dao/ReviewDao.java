package com.mono.moa.dao;

import org.mybatis.spring.*;
import org.springframework.beans.factory.annotation.*;

public class ReviewDao {

	@Autowired
	SqlSessionTemplate sqlSession;
}