package com.gf.guideforyou.vo;

public class MemberFindPw {

	private boolean pwExit;
	private String pwResult;
	
	
	public MemberFindPw() {
		super();
	}
	
	
	public MemberFindPw(boolean pwExit, String pwResult) {
		super();
		this.pwExit = pwExit;
		this.pwResult = pwResult;
	}
	
	
	public boolean isPwExit() {
		return pwExit;
	}
	public void setPwExit(boolean pwExit) {
		this.pwExit = pwExit;
	}
	public String getPwResult() {
		return pwResult;
	}
	public void setPwResult(String pwResult) {
		this.pwResult = pwResult;
	}
	
	
}
