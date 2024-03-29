<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title> Write review</title>

        <link rel="stylesheet" href="${pageContext.request.contextPath}/myPageCustomer_css/myPageTotalCss.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link href="https://fonts.googleapis.com/css?family=East+Sea+Dokdo&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
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


            function completeReview(){
                alert("Reviews have been written");
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
            

            <main class="customerEvaluationWrite_main">
                <div class="customerEvaluationWrite_main_title">${customerGuideNTourInfoForWriteReview.memberBasicVo.member_nick } Guide review</div>


                <form action="./customerEvaluationWriteAction" method="post" >
                    <div class="customerEvaluationWrite_form">
                        <div class="customerEvaluationWrite_form_score_inputBox">
                        	<!-- tour_idx 넘겨주기 -->
                        	<input type="hidden" name="tour_idx" value="${customerGuideNTourInfoForWriteReview.tourBasicVo.tour_idx }">
                        	<!-- member_idx(고객) 넘겨주기 -->
                        	<input type="hidden" name="member_idx" value="${memberSession.member_idx }">
                            <div class="customerEvaluationWrite_form_text">Guide star point</div>
                            <div class="customerEvaluationWrite_form_star">
                                <div id="star"></div>
                                <div class="customerEvaluationWrite_form_star_value">
                                    
                                    <div id="displayStarRating"></div>
                                    <div class="customerEvaluationWrite_form_star_total">/  5</div>
                                </div>
                            </div>
                        </div>
                        <div class="customerEvaluationWrite_form_review_inputBox">
                            <div class="customerEvaluationWrite_form_text">Review</div>
                            <textarea name="guide_review" placeholder="  100자 내외" class="customerEvaluationWrite_form_review"></textarea>
                        </div>
                        <button type="submit" class="customerEvaluationWrite_Btn" onclick="completeReview()">Save review</button>
                    </div>
                </form>

            </main>
        </div>
       

        <script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        
        <script src="http://code.jquery.com/jquery-latest.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/myPage_js/jquery.raty.js"></script>
        <script type="text/javascript">
            $(function() {
                $('div#star').raty({
                    score: 5
                    ,path : ""
                    ,width : 200
                    ,click: function(score, evt) {
                        $("#starRating").val(score);
                        $("#displayStarRating").html(score);
                    }
                });
            });
        </script>
    </body>
</html>
