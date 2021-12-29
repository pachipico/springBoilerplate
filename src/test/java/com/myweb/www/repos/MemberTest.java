package com.myweb.www.repos;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.myweb.www.domain.MemberVO;
import com.myweb.www.repository.MemberDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class MemberTest {
	private static Logger logger = LoggerFactory.getLogger(MemberTest.class);

	@Inject
	private MemberDAO mdao;

	@Test
	public void insertMemberDummy() throws Exception {
		MemberVO mvo = new MemberVO();
		mvo.setEmail("test@test.com");
		mvo.setNickName("testNickName");
		mvo.setPwd("123");
		mdao.insert(mvo);
	}

	@Test
	public void InsertMemberDummies() throws Exception {
		for (int i = 0; i < 100; i++) {
			MemberVO mvo = new MemberVO();
			mvo.setEmail("test" + i + "@test.com");
			mvo.setNickName("testNickName" + i);
			mvo.setPwd("123");
			mdao.insert(mvo);
		}
	}

	@Test
	public void getMemberList() throws Exception {
		List<MemberVO> list = mdao.selectList();
	}
	
	@Test
	public void getMemberDetail() throws Exception{
		MemberVO mvo = mdao.selectOne("test@test.com");
	}
	
	@Test
	public void loginMember() throws Exception{
		MemberVO mvo = new MemberVO();
		mvo.setEmail("test@test.com");
		mvo.setPwd("123");
		mdao.update("test@test.com");
		mdao.selectOne(mvo);
	}
	
	@Test
	public void modifyMember() throws Exception {
		MemberVO mvo = new MemberVO();
		mvo.setEmail("test@test.com");
		mvo.setPwd("123");
		mvo.setGrade(50);
		mvo.setNickName("modifiedNickName");
		mdao.update(mvo);
	}
	
	@Test
	public void lastLoginMember() throws Exception{
		mdao.update("test@test.com");
		mdao.selectOne("test@test.com");
	}
	
	@Test
	public void removeMember() throws Exception{
		for (int i = 0; i < 100; i++) {
			mdao.delete("test"+i+"@test.com");
		}
	}
}
