<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>jinSunMiPage</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link href="https://fonts.googleapis.com/css?family=East+Sea+Dokdo&display=swap" rel="stylesheet">
    <script>
            function openCity(evt, cityName) {
              var i, tabcontent, tablinks;
              tabcontent = document.getElementsByClassName("jinsunmi_section2-Contents");
              for (i = 0; i < tabcontent.length; i++) {
                tabcontent[i].style.display = "none";
              }
              tablinks = document.getElementsByClassName("jinsunmi-ContentBtn");
              for (i = 0; i < tablinks.length; i++) {
                tablinks[i].className = tablinks[i].className.replace(" active", "");
              }
              document.getElementById(cityName).style.display = "flex";
              evt.currentTarget.className += " active";
              
            }
        </script>
</head>
<body>

    <!--진선미 페이지-->

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
        </c:choose>

    <section class="jinSunMiPage-main_header">
        <div class="jinSunMiPage-main_headerBox">
            <div class="jinSunMiPage_main-top">See all "${mainJinsunmiPageMemberInfo.member_nick }"'s tour</div>
            <!--진선미 가이드 프로필-->
            <div class="jinsunmiPage_main-section1">
                <a href="./credit_infoPage?member_idx=${mainJinsunmiPageMemberInfo.member_idx }"> 
                	<c:choose>
                		<c:when test="${mainJinsunmiPageMemberInfo.member_profile_photo == 'n' }">
                			<img  class="jinsunmi_section1-memberPhoto" alt="#member_photo" src="MainImages/basicMemberProfile.png">
                		</c:when>
                		<c:otherwise>
                    		<img  class="jinsunmi_section1-memberPhoto" alt="#member_photo" src="${mainJinsunmiPageMemberInfo.member_profile_photo }">
                    	</c:otherwise>
                    </c:choose>
                    <div class="jinsunmi_section1-memberNick">${mainJinsunmiPageMemberInfo.member_nick } </div>
                </a>
            </div>
        </div>
    </section>
    
    <main class="jinsunmiPage_main">
        <!--진선미 게시물 한번에 보기-->
        <section class="jinsunmiPage_main-section2">
            <div class="jinsunmi_section2-buttonBox">
                <button class="jinsunmi-ContentBtn" onclick="openCity(event, 'ingContents')">Current Post</button>
                <button class="jinsunmi-ContentBtn" onclick="openCity(event, 'edContents')">Past post</button>
            </div>

          
            <ul id="ingContents" class="jinsunmi_section2-Contents">
                <!-- member_idx의 현재 게시물 반복문 시작 --><!--해당 tour_idx 파라미터 넘겨주기-->
                <c:forEach items="${mainJinsunmiPageTourInfo }" var="tourInfo">
                	<c:if test="${tourInfo.tour_complete == 'n' }">
                		<a href="#move to post">
                    		<li class="jinsunmi-Content">
                        		<img  class="jinsunmi-Content_tourImg" src="https://i.pinimg.com/474x/06/95/5b/06955bb98bdad070b52f1ea3aa1fd200.jpg" alt="tour_photo">
                        		<div class="jinsunmi-Content_tourTitle">${tourInfo.tour_intro}</div>
                    		</li>
                		</a>
                	</c:if>
                </c:forEach>
                <a>
                    <li class="jinsunmi-Content">
                        <img  class="jinsunmi-Content_tourImg" src="https://i.pinimg.com/originals/15/75/ea/1575eacc7bdbdcd2b46dff16da09c21b.jpg" alt="tour_photo">
                        <div class="jinsunmi-Content_tourTitle">#tourTitle</div>
                    </li>
                </a>
                <a>
                    <li class="jinsunmi-Content">
                        <img  class="jinsunmi-Content_tourImg" src="https://t1.daumcdn.net/cfile/tistory/997D123C5C74DF5438" alt="tour_photo">
                        <div class="jinsunmi-Content_tourTitle">#tourTitle</div>
                    </li>
                </a>
                <a>
                    <li class="jinsunmi-Content">
                        <img  class="jinsunmi-Content_tourImg" src="https://s2.best-wallpaper.net/wallpaper/iphone/1612/Seoul-city-night-view-Korea_iphone_750x1334.jpg" alt="tour_photo">
                        <div class="jinsunmi-Content_tourTitle">#tourTitle</div>
                    </li>
                </a>
                <a>
                    <li class="jinsunmi-Content">
                        <img  class="jinsunmi-Content_tourImg" src="http://image.downloadwap.co.uk/wallpapers/p2/new/18/MxUiMPAB.jpg" alt="tour_photo">
                        <div class="jinsunmi-Content_tourTitle">#tourTitle</div>
                    </li>
                </a>
                <a>
                    <li class="jinsunmi-Content">
                        <img  class="jinsunmi-Content_tourImg" src="https://i.pinimg.com/originals/3d/12/4e/3d124e717a8d4511332c1d201754182d.jpg" alt="tour_photo">
                        <div class="jinsunmi-Content_tourTitle">#tourTitle</div>
                    </li>
                </a>
            </ul>
            
            <ul id="edContents" class="jinsunmi_section2-Contents">
                <!-- member_idx의 과거 게시물 반복문 시작 --><!--해당 tour_idx 파라미터 넘겨주기-->
                <c:forEach items="${mainJinsunmiPageTourInfo }" var="tourInfo">
                	<c:if test="${tourInfo.tour_complete == 'y' }">
                		<a href="#해당게시글로 이동">
                    		<li class="jinsunmi-Content">
                        		<img  class="jinsunmi-Content_tourImg" src="https://i.pinimg.com/474x/06/95/5b/06955bb98bdad070b52f1ea3aa1fd200.jpg" alt="tour_photo">
                        		<div class="jinsunmi-Content_tourTitle">${tourInfo.tour_intro }</div>
                    		</li>
                		</a>
                	</c:if>
                </c:forEach>
                <a>
                    <li class="jinsunmi-Content">
                        <img  class="jinsunmi-Content_tourImg edTourImage" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTwFbtnEdci2ZpZMQoYawS0vIJegzGHQ6hz5QALBRC7nw6ZAicp3Q" alt="tour_photo">
                        <div class="jinsunmi-Content_tourTitle edTourTitle">#tourTitle</div>
                    </li>
                </a>
                <a>
                    <li class="jinsunmi-Content">
                        <img  class="jinsunmi-Content_tourImg edTourImage" src="https://t1.daumcdn.net/cfile/tistory/99781C4E5D2E6B9A29" alt="tour_photo">
                        <div class="jinsunmi-Content_tourTitle edTourTitle">#tourTitle</div>
                    </li>
                </a>
            </ul>
        </section>
    </main>

    
    

</body>
</html>
