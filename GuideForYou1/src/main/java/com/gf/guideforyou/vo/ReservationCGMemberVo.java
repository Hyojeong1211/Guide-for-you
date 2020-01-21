package com.gf.guideforyou.vo;

public class ReservationCGMemberVo {
	
	private ReservationBasicVo reservationBasicVo;
	private MemberBasicVo memberCVo;
	private MemberBasicVo memberGVo;
	private TourBasicVo tourBasicVo;
	
	
	public ReservationCGMemberVo() {
		super();
	}

	public ReservationCGMemberVo(ReservationBasicVo reservationBasicVo, MemberBasicVo memberCVo,
			MemberBasicVo memberGVo, TourBasicVo tourBasicVo) {
		super();
		this.reservationBasicVo = reservationBasicVo;
		this.memberCVo = memberCVo;
		this.memberGVo = memberGVo;
		this.tourBasicVo = tourBasicVo;
	}

	public ReservationBasicVo getReservationBasicVo() {
		return reservationBasicVo;
	}

	public void setReservationBasicVo(ReservationBasicVo reservationBasicVo) {
		this.reservationBasicVo = reservationBasicVo;
	}

	public MemberBasicVo getMemberCVo() {
		return memberCVo;
	}

	public void setMemberCVo(MemberBasicVo memberCVo) {
		this.memberCVo = memberCVo;
	}

	public MemberBasicVo getMemberGVo() {
		return memberGVo;
	}

	public void setMemberGVo(MemberBasicVo memberGVo) {
		this.memberGVo = memberGVo;
	}

	public TourBasicVo getTourBasicVo() {
		return tourBasicVo;
	}

	public void setTourBasicVo(TourBasicVo tourBasicVo) {
		this.tourBasicVo = tourBasicVo;
	}
	
	
}
