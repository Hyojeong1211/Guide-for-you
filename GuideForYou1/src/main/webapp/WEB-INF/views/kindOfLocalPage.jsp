<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>kindOfLocalPage</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link href="https://fonts.googleapis.com/css?family=East+Sea+Dokdo&display=swap" rel="stylesheet">
    <style>
        body{
            margin:0;
            padding:0;
        }
    </style>
</head>
<body>
    <!-- Local page -->

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
                        				<img alt="member_profile_photo" class="header_memberProfilePhoto" src="${memberSession.member_profile_photo}">
                        			</c:otherwise>
                        		</c:choose> 
                            	<div class="header-row blackText">My page</div>
                        	</a>
                        	<a href="./logoutAction" class="headerWhenLogin headerWhenLogin_second notLogin-blackLine_second">
                            	<div class="header-row blackText">Sgin out</div>
                        	</a>
                        	<a href="./tourEnrollPage" class="headerWhenLogin headerWhenLogin_third notLogin-blackLine_third">
                            	<div class="header-row blackText">Post my tour</div>
                        	</a>
                    	</div>
                	</div>
            	</header>
        	</c:otherwise>
        </c:choose>
    
    <main class="kindOfLocalPage_main1">

        <!-- 지역별 진선미 profile -->
        <section class="kindOfLocalPage_section1">
            <div class="kindOfLocalPage_section1-bestGuide">
                <div class="kindOfLocalPage_section1-bestGuide-titleText">
                 This month's Top three Guides
                </div>
                <div class="kindOfLocalPage_section1-bestGuide-jinsunmi">
                	
                <c:if test="${mainJinsunmiInfoList[0] == null }">
                	You can be the Top gudie too!
                </c:if>
                
                 <c:if test="${fn:length(mainJinsunmiInfoList) == 1 && mainJinsunmiInfoList[0] != null}">
                	<div class="kindOfLocalPage_section1-bestGuide-peopleProfiles">
                        <div class="jinsunmi-title">
                            <i class="fas fa-trophy"></i>
                            <i class="fas fa-trophy"></i>
                            <i class="fas fa-trophy"></i>
                            <div>NO.1</div>
                        </div>
                        <div class="jinsunmi-profile">
                            <a href="./credit_infoPage?member_idx=${mainJinsunmiInfoList[0].memberBasicVo.member_idx }">
                                <c:choose>
                            		<c:when test="${mainJinsunmiInfoList[0].memberBasicVo.member_profile_photo == 'n' }">
                            			<img class="jinsunmi-profile_memberPhoto" alt="#member_photo" src="login_css/images/profilePic.png">
                            		</c:when>
                            		<c:otherwise>
                            			<img  class="jinsunmi-profile_memberPhoto" alt="#member_photo" src="${mainJinsunmiInfoList[0].memberBasicVo.member_profile_photo }">                            		
                            		</c:otherwise>
                            	</c:choose>
                                <div class="jinsunmi-profile_nick">${mainJinsunmiInfoList[0].memberBasicVo.member_nick }</div>
                            </a>
                            <div class="jinsunmi-profile_AVGscore">
                                <img class="jinsunmi-profile_AVGscore-startImg" src="MainImages/star.png" alt="score_star">
                                <div class="jinsunmi-profile_AVGscore-scoreText">
                                    ${mainJinsunmiInfoList[0].tourAvgScore }/5점
                                </div>
                            </div>
                            <a href="./jinSunMiPage?member_idx=${mainJinsunmiInfoList[0].memberBasicVo.member_idx }">
                                <div class="jinsunmi-profile_lookingTour">투어보기</div>
                            </a>
                        </div>
                    </div>
                </c:if>
                
                 <c:if test="${fn:length(mainJinsunmiInfoList) == 2 }">
                	<div class="kindOfLocalPage_section1-bestGuide-peopleProfiles">
                        <div class="jinsunmi-title">
                            <i class="fas fa-trophy"></i>
                            <i class="fas fa-trophy"></i>
                            <i class="fas fa-trophy"></i>
                            <div>NO.1</div>
                        </div>
                        <div class="jinsunmi-profile">
                            <a href="./credit_infoPage?member_idx=${mainJinsunmiInfoList[0].memberBasicVo.member_idx }">
                                <c:choose>
                            		<c:when test="${mainJinsunmiInfoList[0].memberBasicVo.member_profile_photo == 'n' }">
                            			<img class="jinsunmi-profile_memberPhoto" alt="#member_photo" src="login_css/images/profilePic.png">
                            		</c:when>
                            		<c:otherwise>
                            			<img  class="jinsunmi-profile_memberPhoto" alt="#member_photo" src="${mainJinsunmiInfoList[0].memberBasicVo.member_profile_photo }">                            		
                            		</c:otherwise>
                            	</c:choose>
                                <div class="jinsunmi-profile_nick">${mainJinsunmiInfoList[0].memberBasicVo.member_nick }</div>
                            </a>
                            <div class="jinsunmi-profile_AVGscore">
                                <img class="jinsunmi-profile_AVGscore-startImg" src="MainImages/star.png" alt="score_star">
                                <div class="jinsunmi-profile_AVGscore-scoreText">
                                    ${mainJinsunmiInfoList[0].tourAvgScore }/5
                                </div>
                            </div>
                            <a href="./jinSunMiPage?member_idx=${mainJinsunmiInfoList[0].memberBasicVo.member_idx }">
                                <div class="jinsunmi-profile_lookingTour">see Tour</div>
                            </a>
                        </div>
                    </div>
                    <div class="kindOfLocalPage_section1-bestGuide-peopleProfiles">
                        <div class="jinsunmi-title">
                            <i class="fas fa-trophy"></i>
                            <i class="fas fa-trophy"></i>
                            <div>NO.2</div>
                        </div>
                        <div class="jinsunmi-profile">
                            <a href="./credit_infoPage?member_idx=${mainJinsunmiInfoList[1].memberBasicVo.member_idx }">
                            	<c:choose>
                            		<c:when test="${mainJinsunmiInfoList[1].memberBasicVo.member_profile_photo == 'n' }">
                            			<img  class="jinsunmi-profile_memberPhoto" alt="#member_photo" src="login_css/images/profilePic.png">
                            		</c:when>
                            		<c:otherwise>
                            			<img  class="jinsunmi-profile_memberPhoto" alt="#member_photo" src="${mainJinsunmiInfoList[1].memberBasicVo.member_profile_photo }">                            		
                            		</c:otherwise>
                            	</c:choose>
                                <div class="jinsunmi-profile_nick">${mainJinsunmiInfoList[1].memberBasicVo.member_nick }</div>
                            </a>
                            <div class="jinsunmi-profile_AVGscore">
                                <img class="jinsunmi-profile_AVGscore-startImg" src="MainImages/star.png" alt="score_star">
                                <div class="jinsunmi-profile_AVGscore-scoreText">
                                    ${mainJinsunmiInfoList[1].tourAvgScore }/5
                                </div>
                            </div>
                            <a href="./jinSunMiPage?member_idx=${mainJinsunmiInfoList[1].memberBasicVo.member_idx }">
                                <div class="jinsunmi-profile_lookingTour">See tour</div>
                            </a>
                        </div>
                    </div>
                </c:if>
                
                <c:if test="${fn:length(mainJinsunmiInfoList) == 3 }">
                	<div class="kindOfLocalPage_section1-bestGuide-peopleProfiles">
                        <div class="jinsunmi-title">
                            <i class="fas fa-trophy"></i>
                            <i class="fas fa-trophy"></i>
                            <div>NO.2</div>
                        </div>
                        <div class="jinsunmi-profile">
                            <a href="./credit_infoPage?member_idx=${mainJinsunmiInfoList[1].memberBasicVo.member_idx }">
                            	<c:choose>
                            		<c:when test="${mainJinsunmiInfoList[1].memberBasicVo.member_profile_photo == 'n' }">
                            			<img  class="jinsunmi-profile_memberPhoto" alt="#member_photo" src="login_css/images/profilePic.png">
                            		</c:when>
                            		<c:otherwise>
                            			<img  class="jinsunmi-profile_memberPhoto" alt="#member_photo" src="${mainJinsunmiInfoList[1].memberBasicVo.member_profile_photo }">                            		
                            		</c:otherwise>
                            	</c:choose>
                                <div class="jinsunmi-profile_nick">${mainJinsunmiInfoList[1].memberBasicVo.member_nick }</div>
                            </a>
                            <div class="jinsunmi-profile_AVGscore">
                                <img class="jinsunmi-profile_AVGscore-startImg" src="MainImages/star.png" alt="score_star">
                                <div class="jinsunmi-profile_AVGscore-scoreText">
                                    ${mainJinsunmiInfoList[1].tourAvgScore }/5
                                </div>
                            </div>
                            <a href="./jinSunMiPage?member_idx=${mainJinsunmiInfoList[1].memberBasicVo.member_idx }">
                                <div class="jinsunmi-profile_lookingTour">See tour</div>
                            </a>
                        </div>
                    </div>
                    <div class="kindOfLocalPage_section1-bestGuide-peopleProfiles">
                        <div class="jinsunmi-title">
                            <i class="fas fa-trophy"></i>
                            <i class="fas fa-trophy"></i>
                            <i class="fas fa-trophy"></i>
                            <div>NO.1</div>
                        </div>
                        <div class="jinsunmi-profile">
                            <a href="./credit_infoPage?member_idx=${mainJinsunmiInfoList[0].memberBasicVo.member_idx }">
                                <c:choose>
                            		<c:when test="${mainJinsunmiInfoList[0].memberBasicVo.member_profile_photo == 'n' }">
                            			<img class="jinsunmi-profile_memberPhoto" alt="#member_photo" src="login_css/images/profilePic.png">
                            		</c:when>
                            		<c:otherwise>
                            			<img  class="jinsunmi-profile_memberPhoto" alt="#member_photo" src="${mainJinsunmiInfoList[0].memberBasicVo.member_profile_photo }">                            		
                            		</c:otherwise>
                            	</c:choose>
                                <div class="jinsunmi-profile_nick">${mainJinsunmiInfoList[0].memberBasicVo.member_nick }</div>
                            </a>
                            <div class="jinsunmi-profile_AVGscore">
                                <img class="jinsunmi-profile_AVGscore-startImg" src="MainImages/star.png" alt="score_star">
                                <div class="jinsunmi-profile_AVGscore-scoreText">
                                    ${mainJinsunmiInfoList[0].tourAvgScore }/5
                                </div>
                            </div>
                            <a href="./jinSunMiPage?member_idx=${mainJinsunmiInfoList[0].memberBasicVo.member_idx }">
                                <div class="jinsunmi-profile_lookingTour">See tour</div>
                            </a>
                        </div>
                    </div>
                    <div class="kindOfLocalPage_section1-bestGuide-peopleProfiles">
                        <div class="jinsunmi-title">
                            <i class="fas fa-trophy"></i>
                            <div>NO.3</div>
                        </div>
                        <div class="jinsunmi-profile">
                            <a href="./credit_infoPage?member_idx=${mainJinsunmiInfoList[2].memberBasicVo.member_idx }">
                            	<c:choose>
                            		<c:when test="${mainJinsunmiInfoList[2].memberBasicVo.member_profile_photo == 'n' }">
                            			<img class="jinsunmi-profile_memberPhoto" alt="#member_photo" src="login_css/images/profilePic.png">
                            		</c:when>
                            		<c:otherwise>
                            			<img  class="jinsunmi-profile_memberPhoto" alt="#member_photo" src="${mainJinsunmiInfoList[2].memberBasicVo.member_profile_photo }">                            		
                            		</c:otherwise>
                            	</c:choose>
                                
                                <div class="jinsunmi-profile_nick">${mainJinsunmiInfoList[2].memberBasicVo.member_nick }</div>
                            </a>
                            <div class="jinsunmi-profile_AVGscore">
                                <img class="jinsunmi-profile_AVGscore-startImg" src="MainImages/star.png" alt="score_star">
                                <div class="jinsunmi-profile_AVGscore-scoreText">
                                    ${mainJinsunmiInfoList[2].tourAvgScore }/5
                                </div>
                            </div>
                            <a href="./jinSunMiPage?member_idx=${mainJinsunmiInfoList[2].memberBasicVo.member_idx }">
                                <div class="jinsunmi-profile_lookingTour">See tour</div>
                            </a>
                        </div>
                    </div>
                </c:if>     
                </div>
            </div>
             <!-- 지역 nav -->
            <nav class="kindOfLocalPage_nav">
                <a href="./kindOfLocalPage?location_idx=1">
                   	 Seoul
                </a>
                <a href="./kindOfLocalPage?location_idx=2">
                  	 Gyeonggi
                </a>
                <a href="./kindOfLocalPage?location_idx=3">
                                         Gangwon
                </a>
                <a href="./kindOfLocalPage?location_idx=4">
                  Chungcheong                       
                </a>
                <a href="./kindOfLocalPage?location_idx=5">
                                         Jeonla
                </a>
                <a href="./kindOfLocalPage?location_idx=6">
                                         Geyongsang
                </a>
                <a href="./kindOfLocalPage?location_idx=7">
                                        Jeju
                </a>
            </nav>
        </section>

        
    </main>

    <!-- 지역별 가이드게시글 list-->
    <main class="kindOfLocalPage_main2">
        <div class="kindOfLocalPage_main2-top">
        	<c:if test="${mainKindOfLocalPageLocation_name.location_idx == 1 }">
        		#Seoul
        	</c:if>
        	<c:if test="${mainKindOfLocalPageLocation_name.location_idx == 2 }">
        		# Gyeonggi
        	</c:if>
        	<c:if test="${mainKindOfLocalPageLocation_name.location_idx == 3 }">
        		#  Gangwon
        	</c:if>
        	<c:if test="${mainKindOfLocalPageLocation_name.location_idx == 4 }">
        		#Chungcheong
        	</c:if>
        	<c:if test="${mainKindOfLocalPageLocation_name.location_idx == 5 }">
        		#Jeonla
        	</c:if>
        	<c:if test="${mainKindOfLocalPageLocation_name.location_idx == 6 }">
        		#Gyeongsang
        	</c:if>
        	<c:if test="${mainKindOfLocalPageLocation_name.location_idx == 7 }">
        		#Jeju
        	</c:if>
        </div>
        
       	 <ul class="LocalPage_section2_tourContentBox">
       	 
                <!-- #반복문 집어넣을 부분!!!-->
                <c:forEach items="${mainKindOfLocalPageContentLists}" var="localContentList">
                	<a href="./tourGuideContentPage?tour_idx=${localContentList.tourBasicVo.tour_idx }"> <!-- tour_idx넘겨주기 -->
                    	<li class="LocalPage_section2-guideContent">
                    		<c:choose>
                    			<c:when test="${localContentList.tourBasicVo.tour_photo1 == null }">
                        			<img class="LocalPage_section2-guideTourPhoto" src="https://post-phinf.pstatic.net/MjAxODAxMjZfMTYg/MDAxNTE2OTUwMTA3NzU1.vBit51uENBRF-qDqE71hNoH51C4noBi_bswXoWbObBsg.MLr_3StniQoh9wrvhTiymYTdjWwHO2pF0vxM2ApcPb0g.JPEG/iphone-wallpaper04.jpg?type=w1200" alt="basic tour picture">
                        		</c:when>
                        		<c:otherwise>
                        			<img class="LocalPage_section2-guideTourPhoto" src="${localContentList.tourBasicVo.tour_photo1 }" alt="Tour picture">
                        		</c:otherwise>
                        	</c:choose>
                        	<div class="LocalPage_section2-guideTourTitle">${localContentList.tourBasicVo.tour_intro }</div>
                        	<div class="LocalPage_section2-guideProfile">
                        		<c:choose>
                        			<c:when test="${localContentList.memberBasicVo.member_profile_photo == 'n' }">
                        				<img class="LocalPage_section2-guideProfile_memberPhoto" alt="#member_photo" src="MainImages/basicMemberProfile.png" >
                        			</c:when>
                        			<c:otherwise>
                        				<img class="LocalPage_section2-guideProfile_memberPhoto" alt="#member_photo" src="${localContentList.memberBasicVo.member_profile_photo }" >
                        			</c:otherwise>                          	
                            	</c:choose>
                            	<div class="LocalPage_section2-guideProfile_memberNick">${localContentList.memberBasicVo.member_nick }</div>
                        	</div>
                        	<div class="LocalPage_section2-guideAVGscore">
                            	<img class="LocalPage_section2-guideAVGscore_starImg" src="MainImages/star.png">
                            	<div class="LocalPage_section2-guideAVGscore_scoreText">
                                	${localContentList.guideAvgScore }/5
                            	</div>
                        	</div>   
                    	</li>
                	</a>
                </c:forEach>
                <!-- # 반복문 끝-->
        </ul>
    </main>

  

    <script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
</body>
</html>
