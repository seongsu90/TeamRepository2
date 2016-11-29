package com.mycompany.teamapp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.mycompany.teamapp.dao.MemberDao;
import com.mycompany.teamapp.dto.Member;

@Component
public class MemberService {
	public static final int JOIN_SUCCESS = 0;
	public static final int JOIN_FAIL = 1;
	
	public static final String LOGIN_SUCCESS = "success";
	public static final String LOGIN_FAIL_MID = "fail_mid";
	public static final String LOGIN_FAIL_MPASSWORD = "fail_mpassword";
	
	public static final int LOGOUT_SUCCESS = 0;
	public static final int LOGOUT_FAIL = 1;
	
	public static final int MODIFY_SUCCESS = 0;
	public static final int MODIFY_FAIL = 1;
	
	public static final String WITHDRAW_SUCCESS = "success";
	public static final String WITHDRAW_FAIL = "fail";
	
	public static final int ADD_PENALTY_SUCCESS = 0;
	public static final int ADD_PENALTY_FAIL = 1;
	
	@Autowired
	private MemberDao memberDao;
	
	public int join(Member member) {
		memberDao.insert(member);
		return JOIN_SUCCESS;
	}
	
	public String login(String mid, String mpassword) {
		Member member = memberDao.selectByMid(mid);
		if ( member == null ) return LOGIN_FAIL_MID;
		if ( member.getMpassword().equals(mpassword) == false ) return LOGIN_FAIL_MPASSWORD;
		return LOGIN_SUCCESS;
	}
	
	public int logout(String mid) {
		return LOGOUT_SUCCESS;	
	}
	
	public String findMid(String mname, String mphone) {
		return memberDao.selectMidByMnameAndMphone(mname, mphone);
	}
	
	public String getMid(int mresid) {
		return memberDao.selectMidByMresid(mresid);
	}
	
	public Member info(String mid, String mpassword) {
		Member member = memberDao.selectByMid(mid);
		if ( member.getMpassword().equals(mpassword) == false ) return null;
		return member;
	}
	
	public Member info(String mid) {
		return memberDao.selectByMid(mid);
	}
	
	public int modify(Member member) {
		int row = memberDao.update(member);
		if ( row != 1 ) return MODIFY_FAIL;
		return MODIFY_SUCCESS;
	}
	
	public String withdraw(String mid, String mpassword) {
		Member member = memberDao.selectByMid(mid);
		if ( member.getMpassword().equals(mpassword) == false ) return WITHDRAW_FAIL;
		memberDao.delete(mid);
		return WITHDRAW_SUCCESS;
	}
	
	public boolean isMid(String mid) {
		Member member = memberDao.selectByMid(mid);
		if ( member == null ) return false;
		return true;
	}
	
	public int addPenalty(String mid) {
		Member member = memberDao.selectByMid(mid);
		if ( member == null ) return ADD_PENALTY_FAIL;
		member.setMrank(member.getMrank()-1);
		int row = memberDao.update(member);
		if ( row != 1 ) return ADD_PENALTY_FAIL;
		return ADD_PENALTY_SUCCESS;
	}
	
	public int getCount(String find) {
		return memberDao.count(find);
	}
	
	public List<Member> list(int pageNo, int rowsPerPage, String find) {
		return memberDao.selectByPage(pageNo, rowsPerPage, find);
	}

}
	