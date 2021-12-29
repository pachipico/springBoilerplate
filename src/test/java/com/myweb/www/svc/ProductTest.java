package com.myweb.www.svc;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.myweb.www.domain.ProductVO;
import com.myweb.www.service.ProductService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class ProductTest {
	private static Logger logger = LoggerFactory.getLogger(ProductTest.class);
	
	@Inject
	private ProductService psv;
	
	@Test
	public void insertProductDummy() throws Exception{
		ProductVO pvo = new ProductVO();
				
		psv.register(pvo);
	}
}
