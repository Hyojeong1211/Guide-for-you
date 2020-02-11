<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>header</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link href="https://fonts.googleapis.com/css?family=East+Sea+Dokdo&display=swap" rel="stylesheet">
</head>
<body>
    <!--헤더ui-->

   
        <!--메인indexPage header-->
      <c:choose>
      	<c:when test="${empty memberSession }">
      		<header>
            	<div class="header_wrapper indexPage_headerWrapper">
                	<a href="./indexPage">
                    	<div class="header_column1">
                       		<img src="MainImages/logo3.gif" alt="로고">
                       		<div class="header-web_name">GuideForYou</div>
                    	</div>
                	</a>
                	<div class="header_column2">
                    	<a href="./loginPage" class="headerWhenNotLogin headerWhenNotLogin_first login-blackLine_first">
                        	<div class="header-login blackText">Sign in</div>
                    	</a>
                    	<a href="./joinMemberPage" class="headerWhenNotLogin login-blackLine_second">
                        	<div class="header-join blackText">Sign out</div>
                    	</a>
                	</div>
            	</div>
        	</header>
      	</c:when>
      	<c:otherwise>
      		<header>
                <div class="header_wrapper indexPage_headerWrapper">
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
                            <div class="header-row blackText">투어게시</div>
                        </a>
                    </div>
                </div>
        	</header>
      	</c:otherwise>
      </c:choose>
        
        
        <!--배경사진이 있는 페이지-->
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
                        		<div class="header-row header_mypageText">my page</div>
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
    

        <!--배경사진이 없는 페이지-->
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
                            	<div class="header-row blackText">Sign ouy</div>
                        	</a>
                        	<a href="./tourEnrollPage" class="headerWhenLogin headerWhenLogin_third notLogin-blackLine_third">
                            	<div class="header-row blackText">post my tour</div>
                        	</a>
                    	</div>
                	</div>
            	</header>
        	</c:otherwise>
        </c:choose>
    
 
        

</body>
</html>
