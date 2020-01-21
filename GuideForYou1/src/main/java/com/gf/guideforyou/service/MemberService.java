package com.gf.guideforyou.service;

import com.gf.guideforyou.vo.*;

public interface MemberService {

public abstract void joinMember(MemberBasicVo memberBasicVo);
	
	public abstract SessionUserDataVo login(MemberBasicVo memberBasicVo);
	
	public abstract void withdraw(MemberBasicVo memberBasicVo); 
	
	public abstract boolean checkPassword(MemberBasicVo memberBasicVo);
	
	public abstract void editProfile (MemberBasicVo memberBasicvo);
	
	public MemberBasicVo readProfile(MemberBasicVo memberVo); 
	
	public abstract String passwordMaker (MemberBasicVo memberVo);
	
}
