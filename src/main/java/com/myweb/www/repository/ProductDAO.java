package com.myweb.www.repository;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.myweb.www.domain.ProductVO;

public interface ProductDAO {
	int insert(ProductVO pvo);
	List<ProductVO> selectList();
	ProductVO selectOne(long pno);
	int update(ProductVO pvo);
	int delete(long pno);
}
