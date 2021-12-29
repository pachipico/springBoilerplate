package com.myweb.www.svc;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.myweb.www.domain.CommentVO;
import com.myweb.www.service.CommentService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class CommentTest {
	private static Logger logger = LoggerFactory.getLogger(CommentTest.class);

	@Inject
	private CommentService csv;

	@Test
	public void insertCommentDummies() throws Exception {
		for (int i = 100; i > 50; i--) {
			int rcount = (int) (Math.random()*64);
			for (int j = 0; j < rcount; j++) {
				CommentVO cvo = new CommentVO();
				cvo.setContent("this is comment of" + i + " > " + j);
				cvo.setWriter("test" + (int) (Math.random()*100) + "@test.com");
				cvo.setPno(i);
				csv.register(cvo);
			}
		}
	}
	
	@Test
	public void getCommentList() {
		csv.getList(70L);
	}
	
	@Test
	public void removeComment() {
		csv.remove(239L);
	}

}
