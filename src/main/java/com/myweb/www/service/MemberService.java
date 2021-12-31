package com.myweb.www.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.myweb.www.domain.MemberVO;

public interface MemberService {
	int register(MemberVO mvo);
	MemberVO login(MemberVO mvo);
	List<MemberVO> getList();
	MemberVO getDetail(String email);
	int modify(MemberVO mvo);
	int remove(String email);
	int dupleCheck(String email);
	int updateGrade(MemberVO mvo);
}
