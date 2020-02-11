<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
     <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/myPage_css/myPageTotalCss.css">
    <link href="https://fonts.googleapis.com/css?family=East+Sea+Dokdo&display=swap" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

    <script>
            function openBoard(evt, cityName) {
              var i, tabcontent, tablinks;
              tabcontent = document.getElementsByClassName("board_tabcontent");
              for (i = 0; i < tabcontent.length; i++) {
                tabcontent[i].style.display = "none";
              }
              tablinks = document.getElementsByClassName("myBoardReading_main_tablinks");
              for (i = 0; i < tablinks.length; i++) {
                tablinks[i].className = tablinks[i].className.replace(" active", "");
              }
              document.getElementById(cityName).style.display = "block";
              evt.currentTarget.className += " active";
            }

         

    </script>
    

    <script>
        $(document).ready(function(){

            $(".review_flip").click(function(){
                var submenu = $(this).next("ul");
 
                if( submenu.is(":visible") ){
                    submenu.slideUp();
                }else{
                    submenu.slideDown();
                }
            });
        });



        </script>

    <title>Guide review control</title>
    
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
           

            <main class="guideManageReview_main">
                <div class="myBoardReading_main_header">Guide Review</div>
                <div class="myBoardReading_main_tab">
                    <button class="myBoardReading_main_tablinks" onclick="openBoard(event, 'guide_write_review')">Reviews I wrote</button>
                    <div class="tablinks_divide"></div>
                    <button class="myBoardReading_main_tablinks" onclick="openBoard(event, 'guide_get_review')">Reviews I got</button>
                </div>    

                <!-- Reviews I wrote -->
                <ul id="guide_write_review" class="guideManageReview_main_write_review  board_tabcontent  ">
                  <c:forEach items="${guideMTCustomerInfo}" var="customer">
                	<li class="guideManageReview_main_review_wrap menu">
                        <div class="guideManageReview_main_review_top">
                            <div class="guideManageReview_main_review_top_column">
                                <div class="review_top_column_profile">
                                    <a href="#" class="guideReservation_photo_column ">
                                    <img src="myPageImg/basic_img.jpg" class="guideReservation_photo">
                                    </a> 
                                    <div>${customer.memberBasicVo.member_nick}</div>
                                </div>
                                <div class="guideManage_task_div "></div>
                                <div>${customer.tourBasicVo.tour_intro}</div> 
                                <div class="guideManage_task_div "></div>
                                <a href="./guideManageCustomerReviewPageAction?customer_idx=${customer.customer_EvaluationBasicVo.customer_idx }" class="review_delete">
                                	<div class="review_delete_btn">Delete Review</div>
                                </a> 
                            </div>
                          
                        </div>
                            <a class="review_flip">
                                <i class="fas fa-sort-down"></i>
                                <div class="watch_review">See review</div>
                            </a>
                        <ul  class="guideManageReview_main_review_bottom  review_panel hide" >
                            <li class="guideManageReview_main_review_bottom_column">
                                <div class="review_bottom_column_review">${customer.customer_EvaluationBasicVo.customer_review}</div>
                                <div class="review_bottom_column_score">
                                    <img src="myPageImg/star-on-small.png" class="review_bottom_column_star_img">
                                    <div class="review_bottom_column_star_value">${customer.customer_EvaluationBasicVo.customer_score}</div>
                                </div>
                            </li>  
                        </ul>
                    </li>
                  </c:forEach>
                    
                </ul>

                <!-- REviews I got -->
                <ul id="guide_get_review" class="guideManageReview_main_write_review  board_tabcontent  ">
                
                	<c:forEach items="${guideMTGuideInfo}" var="guide">
                		<li class="guideManageReview_main_review_wrap menu">
                            <div class="getreview_top_column_get_top">
                                <div class=" getreview_top_column_get">
                                    <div class="review_top_column_profile">
                                        <a href="#" class="guideReservation_photo_column ">
                                        <img src="myPageImg/basic_img.jpg" class="guideReservation_photo">
                                        </a> 
                                        <div>${guide.memberBasicVo.member_nick}</div>
                                    </div>
                                    <div class="guideManage_task_div "></div>
                                    <div>${guide.tourBasicVo.tour_intro}</div> 
                                </div>
                            </div>
                                <a  class="review_flip">
                                    <i class="fas fa-sort-down"></i>
                                    <div class="watch_review">See review</div>
                                </a>
                            <ul  class="guideManageReview_main_review_bottom  review_panel hide" >
                                <li class=" getreview_top_column_get_bottom">
                                    <div class="review_bottom_column_review">${guide.guide_EvaluationBasicVo.guide_review }</div>
                                    <div class="review_bottom_column_score">
                                        <img src="myPageImg/star-on-small.png" class="review_bottom_column_star_img">
                                        <div class="review_bottom_column_star_value">${guide.guide_EvaluationBasicVo.guide_score }</div>
                                    </div>
                                </li>  
                            </ul>
                        </li>
                	</c:forEach>
                
                        
                    </ul>
                
            </main>

            
        </div>



        <script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
         <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    
</body>
</html>
