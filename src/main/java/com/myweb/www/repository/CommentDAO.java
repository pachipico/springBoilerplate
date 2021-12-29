package com.myweb.www.repository;

import java.util.List;

import com.myweb.www.domain.CommentVO;
import com.myweb.www.domain.MemberVO;

public interface CommentDAO {
	int insert(CommentVO cvo); // register

	List<CommentVO> selectList(); // list

	int update(CommentVO cvo); // modify

	int deleteOne(long cno); // delete

	int deleteAll(long pno);// delete all
}
