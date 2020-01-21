package com.gf.guideforyou.vo;

//++한솔추가
public class JinsunmiTourIdxAvgTourScoreJoinVo {
	private int tour_idx;
	private double tourAvgScore;
	
	public JinsunmiTourIdxAvgTourScoreJoinVo() {
		super();
	}

	public JinsunmiTourIdxAvgTourScoreJoinVo(int tour_idx, double tourAvgScore) {
		super();
		this.tour_idx = tour_idx;
		this.tourAvgScore = tourAvgScore;
	}

	public int getTour_idx() {
		return tour_idx;
	}

	public void setTour_idx(int tour_idx) {
		this.tour_idx = tour_idx;
	}

	public double getTourAvgScore() {
		return tourAvgScore;
	}

	public void setTourAvgScore(double tourAvgScore) {
		this.tourAvgScore = tourAvgScore;
	}
	
	
	
	
}
