package com.myweb.www.repos;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.myweb.www.domain.CommentVO;
import com.myweb.www.repository.CommentDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class CommentTest {
	private static Logger logger = LoggerFactory.getLogger(CommentTest.class);

	@Inject
	CommentDAO cdao;

	@Test
	public void registerComment() throws Exception {
		CommentVO cvo = new CommentVO();
		
		
		cvo.setPno(1);
		cvo.setWriter("testWriter");
		cvo.setContent("testContent");
		cdao.insert(cvo);
		
	}

	@Test
	public void getCommentList() throws Exception {
		cdao.selectList(1L);
	}
	
	@Test
	public void modifyComment() throws Exception{
		CommentVO cvo = new CommentVO();
		cvo.setCno(1);
		cvo.setContent("modifiedTestContent");
		cdao.update(cvo);
		cdao.selectList(1L);
	}
	
	@Test
	public void deleteComment() throws Exception{
		
	}
	
	@Test 
	public void deleteAllComments() throws Exception{
		
	}
}
