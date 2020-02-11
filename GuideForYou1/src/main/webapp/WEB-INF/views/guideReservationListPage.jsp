<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>가이드 예약 신청 내역</title>

        <link rel="stylesheet" href="${pageContext.request.contextPath}/myPage_css/myPageTotalCss.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link href="https://fonts.googleapis.com/css?family=East+Sea+Dokdo&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
        <style type="text/css">
        
        		
			.discribe_title{
    			display: flex;
    			flex-direction: column;
    			justify-content: center;
    			align-items: center;
    			border-bottom: 1px solid rgba(66, 65, 65, 0.5);
			}

			.guide_navigation{
    			color: rgb(86, 88, 223);
			}
        </style>
        <script>
            function openBoard(evt, cityName) {
              var i, tabcontent, tablinks;
              tabcontent = document.getElementsByClassName("board_tabcontent");
              for (i = 0; i < tabcontent.length; i++) {
                tabcontent[i].style.display = "none";
              }
              tablinks = document.getElementsByClassName("guideReservationList_main_tablinks");
              for (i = 0; i < tablinks.length; i++) {
                tablinks[i].className = tablinks[i].className.replace(" active", "");
              }
              document.getElementById(cityName).style.display = "block";
              evt.currentTarget.className += " active";
            }
    </script>
    </head>

    <body>

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
		
        <div class="container myPage_wrapper">
           

            <main class="guideReservationList_main">
                <div class="guideReservationList_main_title">my tour reservation</div>


                
                <div class="discribe_title">
                	<div class="guideReservationList_main_tablinks doingTour">Current Tour</div>
                	<div class="task container-fluid guide_navigation ">
                            <div class="guide_nav title guidelList_content col-4">Title</div>
                            <div class="task_div"></div>
                            <div class="guide_nav region guidelList_content col-2">Tour Residence</div>
                            <div class="task_div"></div>
                            <div class="guide_nav date guidelList_content col-2">Tour Date</div>
                            <div class="task_div"></div>
                            <div class="guide_nav max_participate guidelList_content col-3">(Applicants/Max)</div>
                            
                   </div>
                </div>
                
                 

                <!--Unfinished Tour-->
                	   
                           
                           
                    <section id="guidelList_notcomp" class=" guideReservationList_notcomp board_tabcontent">
                        
                        <c:forEach items="${guideGuideRservationListInfo}" var="gudieTourInfo">
                        	<c:if test="${gudieTourInfo.tourBasicVo.tour_complete == 'n'}">
                        	
                        		 <div class="task container-fluid">
                                	<div class="title guidelList_content col-4">${gudieTourInfo.tourBasicVo.tour_intro}</div>
                                	<div class="task_div"></div>
                                	<div class="region guidelList_content col-2">${gudieTourInfo.tourBasicVo.tour_tourspot}</div>
                                	<div class="task_div"></div>
                                	<div class="date guidelList_content col-2">
                                		<fmt:parseDate var="tourdate" value="${gudieTourInfo.tourBasicVo.tour_tourdate}" pattern="yyyy-MM-dd"/>
                                		<fmt:formatDate value="${tourdate}" pattern="yyyy-MM-dd" /> 
                                	</div>
                                	<div class="task_div"></div>
                                	<div class="max_participate guidelList_content col-2">(${gudieTourInfo.sumParticipate}/${gudieTourInfo.tourBasicVo.tour_max_number})</div>
                                	<a href="./guideReservationPeaplePage?tour_idx=${gudieTourInfo.tourBasicVo.tour_idx}" class="n_guide_arrow col-2 watch_reservationList"><div>See Applicants</div><i class="fas fa-chevron-right "></i></a>
                            	</div>
                        	</c:if>
                        	
                        </c:forEach>
                        
                </section>
            </main>

    
           
    
    
          
        </div>
       

        <script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    </body>
</html>
