<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="${pageContext.request.contextPath}//login_css/loginGlobals.css">
    <link href="https://fonts.googleapis.com/css?family=East+Sea+Dokdo&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
            <title>editProfilePage</title>
           
    <style>
        body{ top:0;
            margin:0;align-self: auto;
            padding:0;
            background: url("https://cdn.pixabay.com/photo/2016/11/10/08/15/aircraft-1813731_960_720.jpg") no-repeat center center fixed;
            background-size: cover;
            -webkit-background-size: cover;
            -moz-background-size: cover;
            -o-background-size: cover;
            background-size: cover;
            }
            
    </style>
</head>
<body>
 
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
    
    
	<main class="EditProfilePage-main">
    	<div class="EditProfilePage-main-top">
      	  Edit profile
    	</div>
    	<form action="./editProfileAction" method="post" class="EditProfilePage-Form" enctype="multipart/form-data">

         <div class="EditProfilePage-Form-profilePic">
                <div class="EditProfilePage-profilepic">
                	<c:choose>
                		<c:when test="${memberSession.member_profile_photo == 'n' }">
                			<img  class="EditProfilePage-profilepic2" src="./login_css/images/profilePic.png">
                		</c:when>
                		<c:otherwise>
                			<img  class="EditProfilePage-profilepic2" src="${memberSession.member_profile_photo }">
                		</c:otherwise>
                	</c:choose>
                </div> 
                <input type="file" name="files">
                
                <!-- 김효정님꺼 우선 주석 
                <button type="button" class="btn EditProfilePage-Form-profilepic-edit" data-toggle="modal" data-target="#exampleModal">
                        	프로필사진변경
                </button> -->
                
                <!-- 프로필사진변경버튼을 누르면 뜨는 파일업로드 창 -->
                
       <!--          <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="exampleModalLabel">Change profile picture</h5>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
                <input type="file" name="files" class="profile-update">
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
              <button type="submit" class="btn btn-primary" value="프로필사진 변경"></button>
            </div>
          </div>
        </div>
      </div>
        </div>  -->    

        <div class="EditProfilePage-Form-column">
            <div class="EditProfilePage-Form-text">ID</div>
            <!--readonly 변경불가 input 속성(읽기전용)-->
            <div class="EditProfilePage-Form-input readonly">${memberEditProfileInfo.member_id}</div>
            <input type="hidden" name="member_idx" value="${memberEditProfileInfo.member_idx}">
        </div>
        
        <div class="EditProfilePage-Form-column">
            <div class="EditProfilePage-Form-text">Name</div>
            <div class="EditProfilePage-Form-input readonly">${memberEditProfileInfo.member_name}</div>
        </div>
        
    <div class="EditProfilePage-Form-column">
        <div class="EditProfilePage-Form-text">Birthday</div>
        <div class="EditProfilePage-Form-input readonly">${memberEditProfileInfo.member_age}</div>
    </div>        

    <div class="EditProfilePage-Form-column">
        <div class="EditProfilePage-Form-text">Gender</div>
        <div class="EditProfilePage-Form-input readonly">${memberEditProfileInfo.member_gender}</div>
    </div>    

    <div class="EditProfilePage-Form-column">
    	<!-- nick 수정 -->
        <div class="EditProfilePage-Form-text">Nickname</div>
        <input class="EditProfilePage-Form-input" type="text" value="${memberEditProfileInfo.member_nick}" name="member_nick">
    </div>
    
    <div class="EditProfilePage-Form-column">
    	<!-- nick 수정 -->
        <div class="EditProfilePage-Form-text">Phone</div>
        <input class="EditProfilePage-Form-input" type="text" value="${memberEditProfileInfo.member_phone}" name="member_phone">
    </div>    
    
    <div class="EditProfilePage-Form-column">
        <div class="EditProfilePage-Form-text">Residence</div>
        <select name="member_address" class="EditProfilePage-Form-select">Residence
                <option value="1">Seoul</option>
                <option value="2">Gyeonggi</option>
                <option value="3">Gangwon</option>
                <option value="4">Chungcheong</option>
                <option value="5">Jeonla</option>
                <option value="6">Geyongsang</option>
                <option value="7">jeju</option>
            </select>
    </div>    

    <div class="EditProfilePage-Form-column">
            <div class="EditProfilePage-Form-text">Contact</div>
            <input class="EditProfilePage-Form-input" value="${memberEditProfileInfo.member_kakao}" type="text" name="member_kakao">
    </div>   

    <div class="EditProfilePage-Form-column">
            <div class="EditProfilePage-Form-text">Email</div>
            <input class="EditProfilePage-Form-input" type="text" value="${memberEditProfileInfo.member_email}" name="member_email">
        </div>   
     
        <button type="submit" class="EditProfilePage-Form-button" >Edit profile </button>
    </form>
</main>






      <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>
