<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>tourEnrollPage</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link href="https://fonts.googleapis.com/css?family=East+Sea+Dokdo&display=swap" rel="stylesheet"> 
    <style>
        body{
            top:0;
            margin:0;
            padding:0;
            background: url("https://cdn.pixabay.com/photo/2015/07/13/14/40/paris-843229_960_720.jpg") no-repeat center center fixed; 
            -webkit-background-size: cover;
            -moz-background-size: cover;
            -o-background-size: cover;
            background-size: cover;  
        }
    </style>
</head>
<body class="tourEnrollPage_body">
    <!-- 투어등록수정 페이지 -->

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

    <main class="tourEnrollPage_main">
        <div class="tourEnrollPage_main-top">
            	Edit tour
        </div>
        <form action="./tourContentUpdateAction" method="post">
            <div class="tourEnrollPage_main-form">
            <input type="hidden" name="tour_idx" value="${mainTourContentUpdateData.tourBasicVo.tour_idx}">
                <div class="tourEnrollPage_main-form_inputBox">
                    <!-- 가이드의 member_idx 넘겨주기-->
                    <input name="member_idx" value="${mainTourContentUpdateData.memberBasicVo.member_idx }" type="hidden">
                    <div class="tourEnrollPage_main-text">Guide</div>
                    <div class="tourEnrollPage_main-input">${mainTourContentUpdateData.memberBasicVo.member_name }</div>
                </div>
                <div class="tourEnrollPage_main-form_inputBox">
                    <div class="tourEnrollPage_main-text">phone</div>
                    <div class="tourEnrollPage_main-input">${mainTourContentUpdateData.memberBasicVo.member_kakao}</div>
                </div>
                <div class="tourEnrollPage_main-form_inputBox">
                    <!-- 지역카테고리 location_idx 넘겨주기-->
                    <div class="tourEnrollPage_main-text">Tour Residence</div>
                    <select name="location_idx">
                        <option value="1">Seoul</option>
                        <option value="2">Gyeonggi</option>
                        <option value="3">Gangwon</option>
                        <option value="4">Chungcheong</option>
                        <option value="5">Jeonla</option>
                        <option value="6">Gyeongsang</option>
                        <option value="7">Jeju</option>
                    </select>
                </div>
                <div class="tourEnrollPage_main-form_inputBox">
                    <!-- 투어장소세부지역 tour_tourspot 넘겨주기-->
                    <div class="tourEnrollPage_main-text">Tour area</div>
                    <input name="tour_tourspot" type="text" value="${mainTourContentUpdateData.tourBasicVo.tour_tourspot }" >
                </div>
                <div class="tourEnrollPage_main-form_inputBox">
                    <!-- tour_max_number 넘겨주기-->
                    <div class="tourEnrollPage_main-text">Max Participants</div>
                    <input name="tour_max_number" type="number" value="${mainTourContentUpdateData.tourBasicVo.tour_max_number }">
                </div>
                <div class="tourEnrollPage_main-form_inputBox">
                    <!-- tour_vehicle 넘겨주기-->
                    <div class="tourEnrollPage_main-text">transportation</div>
                    <input name="tour_vehicle" type="text"  value="${mainTourContentUpdateData.tourBasicVo.tour_vehicle }">
                </div>
                <div class="tourEnrollPage_main-form_inputBox">
                    <!--tour_tourdate넘겨주기-->
                    <div class="tourEnrollPage_main-text">Tour date</div>
                    <input name="tour_tourdate" type="date">
                </div>
                <div class="tourEnrollPage_main-form_inputBox tourEnroll_content">
                    <!--tour_intro넘겨주기-->
                    <div class="tourEnroll_content_text">Title</div>
                    <textarea name="tour_intro" class="tourEnroll_content-tourTile">${mainTourContentUpdateData.tourBasicVo.tour_intro }</textarea>
                </div>
                <div class="tourEnrollPage_main-form_inputBox tourEnroll_content">
                    <!--tour_content넘겨주기-->
                    <div class="tourEnroll_content_text">Tour contents</div>
                    <textarea name="tour_content" class="tourEnroll_content-tourContent">${mainTourContentUpdateData.tourBasicVo.tour_content }</textarea>
                </div>
                <!--투어 완료 여부 (n) 넘겨주기-->
                <input name="tour_complete" value="n" type="hidden">
                <div class="tourEnrollPage_main-form_Photo">
                    <!--투어 사진 넘겨주기-->
                    <div class="tourEnrollPage_main_photo-text">Upload photo</div>
                    <div class="tourEnrollPage_main-photoBox">
                       <div class="tourEnrollPage_main_photo-text">upload</div>
                    <div class="tourEnrollPage_main-photoBox">
                        <div class="tourPhoto_input">
							<!--  <input type="type" readonly="readonly" id="file_route">
                            <label>
                                	사진첨부
                             	<input type="file" name="files" onchange="javascriptdocument.getElementById('file_route').value=this.value">
                            </label> -->
                            <div class="buttons">            
                                <input type="file" name="files"> <input type="button" class="btnAdd" value="Add"><br>        
                            </div>
						</div>
                     
                </div>
                <button type="submit" class="tourEnrollBtn">Post!</button>
            </div>
        </form>
    </main>

 

    
</body>
</html>
