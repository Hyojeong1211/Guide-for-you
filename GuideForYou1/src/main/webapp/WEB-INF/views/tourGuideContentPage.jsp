<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>tourGuideContentPage</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link href="https://fonts.googleapis.com/css?family=East+Sea+Dokdo&display=swap" rel="stylesheet">
</head>
<body class="tourGuideContentPage_body">

    <!-- 가이드게시글페이지 -->

        <c:choose>
        	<c:when test="${empty memberSession }">
        		<header>
        			<div class="header_wrapper">
            			<a href="./indexPage">
                			<div class="header_column1">
                   				<img src="MainImages/logo3.gif" alt="로고">
                   				<div class="header-web_name">GuideForYou</div>
                			</div>
            			</a>
            			<div class="header_column2">
                			<a href="./loginPage" class="headerWhenNotLogin headerWhenNotLogin_first login-blackLine_first ">
                    			<div class="header-login blackText">Sign in</div>
                			</a>
                			<a href="./joinMemberPage" class="headerWhenNotLogin login-blackLine_second ">
                    			<div class="header-join blackText">Sign up</div>
                			</a>
            			</div>
        			</div>
    			</header>
        	</c:when>
        	<c:otherwise>
        		<header>
                	<div class="header_wrapper">
                    	<a href="./indexPage">
                        	<div class="header_column1">
                           		<img src="MainImages/logo3.gif" alt="로고">
                           		<div class="header-web_name">GuideForYou</div>
                        	</div>
                    	</a>
                    	<div class="header_column2">
                        	<a href="./myPage" class="headerWhenLogin headerWhenLogin_first notLogin-blackLine_first">
                            	<c:choose>
                        			<c:when test="${memberSession.member_profile_photo == 'n' }">
                        				<img alt="member_profile_photo" class="header_memberProfilePhoto" src="MainImages/basicMemberProfile.png">
                        			</c:when>
                        			<c:otherwise>
                        				<img alt="member_profile_photo" class="header_memberProfilePhoto" src="${memberSession.member_profile_photo }">
                        			</c:otherwise>
                        		</c:choose> 
                            	<div class="header-row blackText">My page</div>
                        	</a>
                        	<a href="./logoutAction" class="headerWhenLogin headerWhenLogin_second notLogin-blackLine_second">
                            	<div class="header-row blackText">Sign out</div>
                        	</a>
                        	<a href="./tourEnrollPage" class="headerWhenLogin headerWhenLogin_third notLogin-blackLine_third">
                            	<div class="header-row blackText">Post my tour</div>
                        	</a>
                    	</div>
                	</div>
            	</header>
        	</c:otherwise>
        </c:choose>----</div>

        <!--가이드게시글 tour_photo-->
        <main class="tourGuideContentPage_main1">
            <img alt="#tour_photo" class="tourGuideContentPage_signiturePhoto" src="https://t1.daumcdn.net/cfile/tistory/997D12365BA4E4E11F" class="d-block w-100">
            <div class="tourGuideContentPage_tourPhotos">
                <div class="tourGuideContentPage_tourPhotoRow">
                    <img  alt="#tour_photo" src="https://cdn.ppomppu.co.kr/zboard/data3/2019/0407/20190407014159_gquuquzs.jpg" class="d-block w-100" >
                    <img  alt="#tour_photo" src="https://cdn.pixabay.com/photo/2018/08/21/17/26/korea-3621711__340.jpg" class="d-block w-100" >
                </div>
                <div class="tourGuideContentPage_tourPhotoRow">
                    <img  alt="#tour_photo" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRBuFdlEMwf565EMQ66-hm-5ZJZzT7Dg8Bvz1PMoX0BB7-HBKj0" >
                    <img  alt="#tour_photo" src="https://i.pinimg.com/originals/b0/63/2d/b0632dadbde9e94e7118d0cb6edb0cf2.jpg" >
                </div>
            </div>         
        </main>

        <!-- 가이드 게시글 정보 소개 -->
        <main class="tourGuideContentPage_main2-Content">
            <!-- 가이드 member_photo, member_nick, tour_title -->
            <section class="tourGuideContentPage_main2-section1">
                <a href="./credit_infoPage?member_idx=${mainTourContentData.memberBasicVo.member_idx }"> <!--가이드의 member_idx 넘겨줄것-->
                    <div class="tourGuideContentPage_main2-section1_profile">
                        <img alt="#member_photo" src="http://kinimage.naver.net/20161216_196/1481870491951kYMeq_JPEG/Na1455870757504.jpg">
                        <div class="tourGuideContentPage_section1-memberNick">${mainTourContentData.memberBasicVo.member_nick }</div>
                        <div class="tourGuideContentPage_main2-section1_lookReview">
                                                        See Reviews/Start point
                        </div>
                    </div>
                </a>
                <div class="tourGuideContentPage_main2-section1_tourTitle">
                    ${mainTourContentData.tourBasicVo.tour_intro }
                </div>
                <div class="tourGuideContentPage_emptyDiv"></div>
            </section>
            <!-- 가이드 게시글--가이드정보-->
            <section class="tourGuideContentPage_main2-row">
                <div class="tourGuideContentPage_main2-row_text">Guide's information</div>
                <div class="tourGuideContentPage_main2-row_Box">
                    <div class="tourGuideContentPage_main2-column tourGuideContentPage_guideInfo">
                        <div class="tourGuideContentPage_main2-column_title">
                            	Residence:
                        </div>
                        <div class="tourGuideContentPage_main2-column_insert">
                        <c:if test="${mainTourContentData.memberBasicVo.member_address == 1}">
                        	Seoul
                        </c:if>
                        <c:if test="${mainTourContentData.memberBasicVo.member_address == 2}">
                        	Gyeonggi
                        </c:if>
                        <c:if test="${mainTourContentData.memberBasicVo.member_address == 3}">
                        	Gangwon
                        </c:if>
                        <c:if test="${mainTourContentData.memberBasicVo.member_address == 4}">
                        	Chungcheong
                        </c:if>
                        <c:if test="${mainTourContentData.memberBasicVo.member_address == 5}">
                        	Jeonla
                        </c:if>
                        <c:if test="${mainTourContentData.memberBasicVo.member_address == 6}">
                        	Gyeongsang
                        </c:if>
                        <c:if test="${mainTourContentData.memberBasicVo.member_address == 7}">
                        	Jeju
                        </c:if>
                        </div>
                    </div>
                    <div class="tourGuideContentPage_main2-column tourGuideContentPage_guideInfo">
                        <div class="tourGuideContentPage_main2-column_title">
                            	Age:
                        </div>
                        <div class="tourGuideContentPage_main2-column_insert">
                            ${mainTourContentData.memberBasicVo.member_age }
                        </div>
                    </div>
                    <div class="tourGuideContentPage_main2-column tourGuideContentPage_guideInfo">
                        <div class="tourGuideContentPage_main2-column_title">
                            	Gender:
                        </div>
                        <div class="tourGuideContentPage_main2-column_insert">
                            ${mainTourContentData.memberBasicVo.member_gender }
                        </div>
                    </div>
                    <!-- <div class="tourGuideContentPage_emptyDiv">
                        
                    </div> -->
                </div>
            </section>
            <!-- 가이드 게시글--투어정보-->
            <section class="tourGuideContentPage_main2-row">
                    <div class="tourGuideContentPage_main2-row_text">TOur information</div>
                    <div class="tourGuideContentPage_main2-row_Box">
                        <div class="tourGuideContentPage_main2-column tourGuideContentPage_tourInfo">
                            <div class="tourGuideContentPage_main2-column_title">
                                	Phone:
                            </div>
                            <div class="tourGuideContentPage_main2-column_insert">
                                ${mainTourContentData.memberBasicVo.member_kakao }
                            </div>
                        </div>
                        <div class="tourGuideContentPage_main2-column tourGuideContentPage_tourInfo">
                            <div class="tourGuideContentPage_main2-column_title">
                                	Max Participants:
                            </div>
                            <div class="tourGuideContentPage_main2-column_insert">
                                ${mainTourContentData.tourBasicVo.tour_max_number }
                            </div>
                        </div>
                        <div class="tourGuideContentPage_main2-column tourGuideContentPage_tourInfo">
                            <div class="tourGuideContentPage_main2-column_title">
                                	Transportation:
                            </div>
                            <div class="tourGuideContentPage_main2-column_insert">
                                ${mainTourContentData.tourBasicVo.tour_vehicle }
                            </div>
                        </div>
                        <div class="tourGuideContentPage_main2-column tourGuideContentPage_tourInfo">
                            <div class="tourGuideContentPage_main2-column_title">
                                	Tour date:
                            </div>
                            <div class="tourGuideContentPage_main2-column_insert">
                            	<fmt:parseDate var="tourDate" value="${mainTourContentData.tourBasicVo.tour_tourdate }" pattern="yyyy-MM-dd"/> 
                        		<fmt:formatDate value="${tourDate}" pattern="yyyy-MM-dd"/>                            
                            </div>
                        </div>
                    </div>
                </section>
                <!-- 가이드 게시글--투어소개-->
                <section class="tourGuideContentPage_main2-tourContent">
                  <div class="tourGuideContentPage_main2-row_text">Tour contents</div>
                  <div class="tourGuideContentPage_main2-tourContentBox">
                     <div class="tourGuideContentPage-tourContent">
                        ${mainTourContentData.tourBasicVo.tour_content }
                     </div>
                    </div>
                </section>
                <div class="tourGuideContentPage_goBack">
                    <a href="./kindOfLocalPage?location_idx=${mainTourContentData.tourBasicVo.location_idx }">
                        <div class="tourGuideContentPage_goBack-btn">
                            	List
                        </div>
                    </a>
                </div>
        </main>

        <!--수정, 삭제, 예약신청 등-->
        <main class="tourGuideContentPage_main3-fixedBar">
            <c:choose>
            	
            	<c:when test="${empty memberSession }">
           			<a href="./loginPage" class="tourGuideContentPage_needLoginBox">
                		<div class="tourGuideContentPage_needLogin">
                    		Reservation can be made after Sign in
                		</div>
            		</a>
            	</c:when>    
        		
        		<c:otherwise>
            		
            		<c:if test="${mainTourContentData.memberBasicVo.member_idx != memberSession.member_idx }">
             			<a href="./tourReservationPage?tour_idx=${mainTourContentData.tourBasicVo.tour_idx }" class="tourGuideContentPage_bookingBox">
                			<div class="tourGuideContentPage_main3-bookingBtn">
                    			Book the tour!
                			</div>
            			</a> 
            		</c:if>
            		
            		<c:if test="${mainTourContentData.memberBasicVo.member_idx == memberSession.member_idx }">
            			<div class="tourGuideContentPage_updateDeleteBox">
                				<a href="./tourContentUpdatePage?tour_idx=${mainTourContentData.tourBasicVo.tour_idx }" class="tourGuideContentPage_updateDeleteBox-column">
                    				<div class="tourGuideContentPage_updateDeleteBox-Btn">Edit</div>
                				</a>
                				<a href="./tourDeleteAction?tour_idx=${mainTourContentData.tourBasicVo.tour_idx }" class="tourGuideContentPage_updateDeleteBox-column">
                    				<div class="tourGuideContentPage_updateDeleteBox-Btn">Delete</div>
                				</a>
            			</div> 
            		</c:if>
            	</c:otherwise>
            </c:choose>
        </main>  
    

</body>
</html>
