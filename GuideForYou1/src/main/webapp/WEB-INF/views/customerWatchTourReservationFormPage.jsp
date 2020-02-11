<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Guest Reservation form check</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link href="https://fonts.googleapis.com/css?family=East+Sea+Dokdo&display=swap" rel="stylesheet"> 
    <link rel="stylesheet" href="${pageContext.request.contextPath}/myPage_css/myPageTotalCss.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <style>
        body{
            top:0;
            margin:0;
            padding:0;
            background: url("https://cdn.pixabay.com/photo/2016/01/09/18/27/old-1130731_960_720.jpg") no-repeat center center fixed; 
            -webkit-background-size: cover;
            -moz-background-size: cover;
            -o-background-size: cover;
            background-size: cover; 
        }
    </style>
</head>
<body class="tourReservationPage_body">
    
    <!--Tour Resrvation form page-->

        <c:choose>
        	<c:when test="${empty memberSession }">
        		<header class="dark_header">
        			<div class="header_wrapper">
            			<a href="./indexPage">
                			<div class="header_column1">
                   				<img src="MainImages/logo3.gif" alt="로고">
                   				<div class="header-web_name">GuideForYou</div>
                			</div>
            			</a>
            			<div class="header_column2">
                			<a href="./loginPage" class="headerWhenNotLogin headerWhenNotLogin_first">
                    			<div class="header-login">Sign in</div>
                			</a>
                			<a href="./joinMemberPage" class="headerWhenNotLogin">
                    			<div class="header-join">Sign up</div>
                			</a>
            			</div>
        			</div>
    			</header>
        	</c:when>
        	<c:otherwise>
        		<header class="dark_header">
            		<div class="header_wrapper">
                		<a href="./indexPage">
                    		<div class="header_column1">
                       			<img src="MainImages/logo3.gif" alt="로고">
                       			<div class="header-web_name">GuideForYou</div>
                    		</div>
                		</a>
                		<div class="header_column2">
                    		<a href="./myPage" class="headerWhenLogin headerWhenLogin_first">
                        		<c:choose>
                        			<c:when test="${memberSession.member_profile_photo == 'n' }">
                        				<img alt="member_profile_photo" class="header_memberProfilePhoto" src="MainImages/basicMemberProfile.png">
                        			</c:when>
                        			<c:otherwise>
                        				<img alt="member_profile_photo" class="header_memberProfilePhoto" src="${memberSession.member_profile_photo }">
                        			</c:otherwise>
                        		</c:choose> 
                        		<div class="header-row header_mypageText">My page</div>
                    		</a>
                    		<a href="./logoutAction" class="headerWhenLogin headerWhenLogin_second">
                        		<div class="header-row">Sign out</div>
                    		</a>
                    		<a href="./tourEnrollPage" class="headerWhenLogin headerWhenLogin_third">
                        		<div class="header-row">Post my tour</div>
                    		</a>
                		</div>
            		</div>
        		</header>
        	</c:otherwise>
        </c:choose>

        <main class="tourReservationPage_main">
            <div class="tourReservationPage_main-top">
                My Reservation form
            </div>
            <div action="#" method="get" class="tourReservationPage_main-form">
                <!--Tour summary--> 
                <div class="tourReservationPage_form-tourSummary">
                    <div class="tourReservationPage_form-tourSummary_tourGuide">
                        <img alt="#member_photo"class="tourReservationPage_tourSummary-guidePhoto" src="http://kinimage.naver.net/20161216_196/1481870491951kYMeq_JPEG/Na1455870757504.jpg">
                        <div class="tourReservationPage_tourSummary-guideNick">${customerRData.memberGVo.member_nick }</div>    
                    </div>
                    <div class="tourReservationPage_form-tourSummary_tourTitle">
                        ${customerRData.tourBasicVo.tour_intro }
                    </div>
                    <div class="tourReservationPage_form-tourSummary_tourDate">
                        <div class="tourReservationPage_form-tourSummary_tourDate-text">Tour date</div>
                        <div class="tourReservationPage_form-tourSummary_tourDate-insert">${customerRData.tourBasicVo.tour_tourdate }</div>
                    </div>
                </div>
                 <!--Toure Reservation form-->
                <div class="tourReservationPage_main-form-customerInfo">
                    <div class="tourReservationPage_main-form-customerInfo_row">
                        <div class="tourReservationPage_main-form-customerInfo_column1">
                             Name
                        </div>
                        <div class="tourReservationPage_main-form-customerInfo_column2">
                        	${customerRData.memberCVo.member_name }
                        </div>
                    </div>
                    <div class="tourReservationPage_main-form-customerInfo_row">
                        <div class="tourReservationPage_main-form-customerInfo_column1">
                             Age
                        </div>
                        <div class="tourReservationPage_main-form-customerInfo_column2">
                            ${customerRData.memberCVo.member_age }
                        </div>
                    </div>
                    <div class="tourReservationPage_main-form-customerInfo_row">
                        <div class="tourReservationPage_main-form-customerInfo_column1">
                             Gender
                        </div>
                        <div class="tourReservationPage_main-form-customerInfo_column2">
                       		${customerRData.memberCVo.member_gender }
                        </div>
                    </div>
                    <div class="tourReservationPage_main-form-customerInfo_row">
                        <div class="tourReservationPage_main-form-customerInfo_column1">
                             Phone
                        </div>
                        <!-- reservation_call 넘겨주기-->
                        <div class="tourReservationPage_main-form-customerInfo_column2">
                        ${customerRData.reservationBasicVo.reservation_call }
                        </div>
                    </div>
                    <div class="tourReservationPage_main-form-customerInfo_row">
                        <div class="tourReservationPage_main-form-customerInfo_column1">
                             Participants
                        </div>
                        <!-- reservation_participate  넘겨주기-->
                        <div class="tourReservationPage_main-form-customerInfo_column2">
                        	${customerRData.reservationBasicVo.reservation_participate }
                        </div>
                    </div>
                    <div class="tourReservationPage_main-form-customerInfo_wish">
                        <div class="tourReservationPage_main-form-customerInfo_column1">
                             wish
                        </div>
                        <!-- reservation_wish 넘겨주기-->
                        <div class="tourReservationPage_main-form-customerInfo_column2">
                        	${customerRData.reservationBasicVo.reservation_wish }
                        </div>
                    </div>
                     <!--Reservation staitment--comferming(b)로(reservation_confirm), --Tour canceled (n)(reservation_tour_cancel)  -->
                        <div class="tourReservationPage_confirm_btn">
                            <a href="./customerUpdateTourReservationFormPage?reservation_idx=${customerRData.reservationBasicVo.reservation_idx }">
                                <div class="tourReservationPage_confirm_btn_column">Edit</div>
                            </a>
                            <a href="./cancelReservationAction?reservation_idx=${customerRData.reservationBasicVo.reservation_idx }">
                                <div class="tourReservationPage_confirm_btn_column">Delete</div>
                            </a>
                        </div>
                </div>
            </div>
        </main>

    

</body>
</html>
