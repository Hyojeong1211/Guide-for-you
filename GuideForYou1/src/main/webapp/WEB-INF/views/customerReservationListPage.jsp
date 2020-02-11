<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/myPageCustomer_css/myPageTotalCss.css">
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
        <title>Guest tour Reservation list </title>
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
        
           
            <main class="guideReservationPeaple_main">
            	<div class="guideReservationList_main_title">Tour Reservation List</div>
    
     			<div class="discribe_title">
                	<div class="guideReservationList_main_tab">
                		<button class="guideReservationList_main_tablinks" onclick="openBoard(event, 'guide_party_b')">Confirming</button>
                    	<div class="guideReservationList_main_div"></div>
                    	<button class="guideReservationList_main_tablinks" onclick="openBoard(event, 'guide_party_y')">Confirmed Tour</button>
                    	<div class="guideReservationList_main_div"></div>
                    	<button class="guideReservationList_main_tablinks" onclick="openBoard(event, 'guide_party_n')">Rejected Tour</button>
                	</div>
                
                	<div class="task container-fluid guide_navigation ">
                    	<div class="guide_nav title guidelList_content col-2"></div>
                        <div class="guide_nav title guidelList_content col-3">Guide</div>
                        <div class="task_div"></div>
                        <div class="guide_nav region guidelList_content col-3">Tour</div>
                        <div class="task_div"></div>
                        <div class="guide_nav date guidelList_content col-3">Tour Date</div>
                        <div class="guide_nav title guidelList_content col-1"></div>
                  	</div>
              </div>
                	<!--Confirming list-->
					<section id="guide_party_b" class=" guideReservationList_notcomp board_tabcontent">			
					<c:forEach items="${customerReservationList }" var="customerRData">		
						<c:if test="${customerRData.reservationBasicVo.reservation_confirm == 'b' }">			
                        	<div class="task container-fluid">
                            	<div class="col-1" class="guideReservation_photo_column ">
                                	<img src="myPageImg/basic_img.jpg" class="guideReservation_photo">
                            	</div>
                            	<div class="nick guidelList_content col-3">${customerRData.memberBasicVo.member_nick }</div>
                            	<div class="guidelList_task_div "></div>
                            	<div class=" col-4">
                                	<a href="./tourGuideContentPage?tour_idx=${customerRData.tourBasicVo.tour_idx }" class="title guidelList_content">
                                    	${customerRData.tourBasicVo.tour_intro }
                                	</a>
                            	</div>
                            	<div class="guidelList_task_div "></div>
                            	
                            	<div class="date guidelList_content col-2">
									<fmt:parseDate value="${customerRData.tourBasicVo.tour_tourdate }" var="customertourdate" pattern="yyyy-MM-dd"></fmt:parseDate>
                            		<fmt:formatDate value="${customertourdate}" pattern="yyyy-MM-dd"/>
								</div>
                            	<div class="guidelList_task_div "></div>
                            	<a href="./customerWatchTourReservationFormPage?reservation_idx=${customerRData.reservationBasicVo.reservation_idx }" class="n_guide_arrow col-2 watch_reservationList"><div>See reservation form</div><i class="fas fa-chevron-right "></i></a>
                    		</div>
                    	</c:if>        	
                    </c:forEach>
                    </section>
                   
                    
                    <!--Confirmed List-->
                    <section id="guide_party_y" class="guideReservationList_comp board_tabcontent">
                    <c:forEach items="${customerReservationList }" var="customerRData">
                       <c:if test="${customerRData.reservationBasicVo.reservation_confirm == 'y' }">	
                        <div class="task container-fluid">
                            <div class="col-1" class="guideReservation_photo_column ">
                                <img src="myPageImg/basic_img.jpg" class="guideReservation_photo">
                            </div>
                            <div class="nick guidelList_content col-3">${customerRData.memberBasicVo.member_nick }</div>
                            <div class="guidelList_task_div "></div>
                            <div class=" col-4">
                                <a href="./tourGuideContentPage?tour_idx=${customerRData.tourBasicVo.tour_idx }" class="title guidelList_content">
                                    ${customerRData.tourBasicVo.tour_intro }
                                </a>
                            </div>
                            <div class="guidelList_task_div "></div>
                            <div class="date guidelList_content col-2">
								<fmt:parseDate value="${customerRData.tourBasicVo.tour_tourdate }" var="customertourdate" pattern="yyyy-MM-dd"></fmt:parseDate>
                            	<fmt:formatDate value="${customertourdate}" pattern="yyyy-MM-dd"/>
							</div>
                            <div class="guidelList_task_div "></div>
                            <a href="./customerWatchTourReservationFormPage?reservation_idx=${customerRData.reservationBasicVo.reservation_idx }" class="n_guide_arrow col-2 y_watch_reservationList"><div></div><i class="fas fa-chevron-right "></i></a>
                        </div>
                       </c:if> 
                    </c:forEach>
                    </section>
                    

                    <!--Canceled list-->
                    <section id="guide_party_n" class="guideReservationList_comp board_tabcontent">
                    <c:forEach items="${customerReservationList }" var="customerRData">
                      <c:if test="${customerRData.reservationBasicVo.reservation_confirm == 'n' }">
                        <div class="task container-fluid">
                            <div class="col-1" class="guideReservation_photo_column ">
                                <img src="myPageImg/basic_img.jpg" class="guideReservation_photo">
                            </div>
                            <div class="nick guidelList_content col-3">${customerRData.memberBasicVo.member_nick }</div>
                            <div class="guidelList_task_div "></div>
                            <div class=" col-4">
                                <a href="./tourGuideContentPage?tour_idx=${customerRData.tourBasicVo.tour_idx }" class="title guidelList_content">
                                    ${customerRData.tourBasicVo.tour_intro }
                                </a>
                            </div>
                            <div class="guidelList_task_div "></div>
                            <div class="date guidelList_content col-2">
								<fmt:parseDate value="${customerRData.tourBasicVo.tour_tourdate }" var="customertourdate" pattern="yyyy-MM-dd"></fmt:parseDate>
                            	<fmt:formatDate value="${customertourdate}" pattern="yyyy-MM-dd"/>
							</div>
                            <div class="guidelList_task_div "></div>
                            <a href="./customerWatchTourReservationFormPage?reservation_idx=${customerRData.reservationBasicVo.reservation_idx }" class="n_guide_arrow col-2 watch_reservationList"><div>See reservation form</div><i class="fas fa-chevron-right "></i></a>
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
