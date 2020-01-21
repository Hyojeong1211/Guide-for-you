package com.gf.guideforyou.service;

import org.springframework.stereotype.Service;

import com.gf.guideforyou.mapper.MemberSQLMapper;
import com.gf.guideforyou.vo.MemberBasicVo;
import com.gf.guideforyou.vo.MemberConfrimIdResult;
import com.gf.guideforyou.vo.SessionUserDataVo;

import org.springframework.aop.aspectj.annotation.*;
import org.springframework.beans.factory.annotation.Autowired;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberSQLMapper memberSQLMapper;

	public void joinMember(MemberBasicVo memberBasicVo) {
		memberSQLMapper.insertMember(memberBasicVo);

	}

	@Override
	public SessionUserDataVo login(MemberBasicVo memberBasicVo) {

		MemberBasicVo memberVo = memberSQLMapper.selectMemberInfoByMemberId(memberBasicVo.getMember_id());

		if (memberVo != null && memberVo.getMember_pw().equals(memberBasicVo.getMember_pw())) {

			SessionUserDataVo sessionUserDataVo = new SessionUserDataVo(memberVo.getMember_idx(),
					memberVo.getMember_nick(), memberVo.getMember_profile_photo());
			return sessionUserDataVo;
		}

		return null;

	}

	@Override
	public void withdraw(MemberBasicVo memberBasicVo) {

		memberSQLMapper.updateQuitMember(memberBasicVo);

	}

	@Override
	public boolean checkPassword(MemberBasicVo memberBasicVo) {
		MemberBasicVo memberVo = memberSQLMapper.selectMemberInfoByMemberIdx(memberBasicVo.getMember_idx());
		if (memberVo != null && memberVo.getMember_pw().equals(memberBasicVo.getMember_pw())) {
			return true;

		} else
			return false;
	}

	@Override
	public void editProfile(MemberBasicVo memberBasicVo) {

		memberSQLMapper.updateMemberProfile(memberBasicVo);

	}

	@Override
	public MemberBasicVo readProfile(MemberBasicVo memberBasicVo) {
		MemberBasicVo memberVo = memberSQLMapper.selectMemberInfoByMemberIdx(memberBasicVo.getMember_idx());

		return memberVo;
	}

	@Override
	public String passwordMaker(MemberBasicVo memberVo) {
		char pwCollection[] = new char[] { '1', '2', '3', '4', '5', '6', '7', '8', '9', '0', 'A', 'B', 'C', 'D', 'E',
				'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z',
				'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u',
				'v', 'w', 'x', 'y', 'z', '!', '@', '#', '$', '%', '^', '&', '*', '(', ')' };
		String ranPw = "";

		for (int i = 0; i < 10; i++) {
			int selectRandomPw = (int) (Math.random() * (pwCollection.length));
			ranPw += pwCollection[selectRandomPw];
		}

		memberVo.setMember_pw(ranPw);
		
		memberSQLMapper.passwordMaking(memberVo);

		return ranPw;
	}
}
