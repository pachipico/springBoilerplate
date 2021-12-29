package com.myweb.www.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.myweb.www.domain.ProductVO;

public interface ProductService {
	int register(ProductVO pvo);

	List<ProductVO> getList();

	ProductVO getDetail(long pno);

	int modify(ProductVO pvo);

	int remove(long pno);

}
