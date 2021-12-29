package com.myweb.www.repos;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.myweb.www.domain.ProductVO;
import com.myweb.www.repository.CommentDAO;
import com.myweb.www.repository.ProductDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class ProductTest {
	private static Logger logger = LoggerFactory.getLogger(ProductTest.class);
	
	@Inject
	private ProductDAO pdao;
	
	@Inject
	private CommentDAO cdao;
	
	@Test
	public void insertProductDummy() throws Exception{
		ProductVO pvo = new ProductVO();
		pvo.setCategory("testCategory");
		pvo.setPname("testName");
		pvo.setPrice(10000);
		pvo.setWriter("testWriter");
		pvo.setMadeBy("testMadeBy");
		pvo.setDescription("test description");
		pdao.insert(pvo);
	}
	
	@Test
	public void insertProductDummies() throws Exception{
		for (int i = 0; i < 100; i++) {
			ProductVO pvo = new ProductVO();
			pvo.setCategory("A" + i);
			pvo.setPname("testName" + i);
			pvo.setPrice(10000);
			pvo.setWriter("testWriter"+ i);
			pvo.setMadeBy("testMadeBy" + i);
			pvo.setDescription("test description" + i);
			pdao.insert(pvo);
		}
	}
	
	@Test
	public void getProductList() throws Exception {
		pdao.selectList();
	}
	
	@Test
	public void getProductDetail() throws Exception{
		pdao.updateRC(1L);
		pdao.selectOne(1L);
	}
	
	@Test
	public void modifyProduct() throws Exception{
		ProductVO pvo = new ProductVO();
		pvo.setCategory("modifiedCategory");
		pvo.setPname("modifiedName");
		pvo.setPrice(99999);
		pvo.setMadeBy("modifiedMadeBy");
		pvo.setDescription("modified description");
		pvo.setPno(1);
		pdao.update(pvo);
		pdao.selectOne(1);
	}
	
	@Test
	public void deleteProduct() throws Exception{
		cdao.deleteAll(1L);
		pdao.delete(1L);
	}
}
