package com.mid.pro.dao;

import static org.junit.Assert.*;

import javax.inject.Inject;

import org.junit.Test;

import com.mid.pro.TestAbstractCase;
import com.mid.pro.model.MemberVO;

public class MemberDAOTest extends TestAbstractCase{

	@Inject
	private MemberDAO memberDAO;
	
	//@Test
	public void memberJoinTest()throws Exception{
		MemberVO memberVO = new MemberVO();
		memberVO.setId("test");
		memberVO.setPw("test");
		memberVO.setName("test1");
		memberVO.setEmail("t@gmail.com");
		memberVO.setTel("0102111111");
		memberVO.setReg_number(211);
		
		int result = memberDAO.memberJoin(memberVO);
		assertEquals(1, result);
	}
	
	//@Test
	public void memberLoginTest()throws Exception{
		MemberVO memberVO = new MemberVO();
		
		memberVO.getId();
		memberVO.getPw();
		
		memberVO = memberDAO.memberLogin(memberVO);
		
		assertEquals(1, memberVO);
		
	}
	
	@Test
	public void memberUpdateTest()throws Exception{
		MemberVO memberVO = new MemberVO();
		
		memberVO.setId("test");
		memberVO.setEmail("k@g.com");
		
		int result = memberDAO.memberUpdate(memberVO);
		
		assertEquals(1, result);
	}

}
