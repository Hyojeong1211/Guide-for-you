<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>가이드섹터 고객 예약신청서 확인</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/myPage_css/myPageTotalCss.css">
    <link href="https://fonts.googleapis.com/css?family=East+Sea+Dokdo&display=swap" rel="stylesheet"> 
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
   <script type="text/javascript">
   		function confirmYN() {
   			
   			var xmlhttp = new XMLHttpRequest();

   			xmlhttp.onreadystatechange = function(){
				//...
				console.log("onreadystatechange 얘가 호출 되었다..");
				
				if(xmlhttp.readyState==4 && xmlhttp.status == 200){
					//alert(xmlhttp.responseText);

					var result = JSON.parse(xmlhttp.responseText);
					console.log(xmlhttp.responseText);
					if(result.r == "yes"){
						alert("Applicant is added");
						location.href="./guideReservationPeaplePage?tour_idx=${guideRMTData.tourBasicVo.tour_idx}";
					}else{
						alert("Exceeded the number of people");
						location.href="./guideReservationPeaplePage?tour_idx=${guideRMTData.tourBasicVo.tour_idx}";
					}
				}
   			};
   			
   			xmlhttp.open("post","./rest_guideTourReservationYesCheckAction" , true);
			xmlhttp.setRequestHeader("Content-type",
			"application/x-www-form-urlencoded");
			xmlhttp.send("reservation_idx=${guideRMTData.reservationBasicVo.reservation_idx}");
			
   			}
   	
   			
   </script>

    
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
        
        
		.tourReservationPage_cancle_btn{
			display: flex;
    		width: 100%;
    
  		  flex-direction:column;
    		align-items: center;
		}

		.cancle_btn{
    		padding-bottom:15px;
		}
    </style>
</head>
<body class="tourReservationPage_body">
    
    <!--투어예약신청 페이지-->

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
               Tour Reservation
            </div>
            <div action="#" method="get" class="tourReservationPage_main-form">
                <!--신청투어 요약--> 
                <div class="tourReservationPage_form-tourSummary">
                     <div class="tourReservationPage_form-tourSummary_tourGuide">
                     	<c:choose>
                     		<c:when test="${guideRMTData.memberBasicVo.member_profile_photo == 'n'}">
                     			<img alt="#member_photo"class="tourReservationPage_tourSummary-guidePhoto" src="http://kinimage.naver.net/20161216_196/1481870491951kYMeq_JPEG/Na1455870757504.jpg">
                     		</c:when>
                     		<c:otherwise>
                     			<img alt="#member_photo"class="tourReservationPage_tourSummary-guidePhoto" src="http://kinimage.naver.net/20161216_196/1481870491951kYMeq_JPEG/Na1455870757504.jpg">
                     		</c:otherwise>
                     	</c:choose>
                        <div class="tourReservationPage_tourSummary-guideNick">${guideRMTData.memberBasicVo.member_nick}</div>    
                    </div>
                    <div class="tourReservationPage_form-tourSummary_tourTitle">
                        ${guideRMTData.memberBasicVo.member_nick}'s Reservation
                    </div>
                    <div class="tourReservationPage_form-tourSummary_tourDate">
                        <div class="tourReservationPage_form-tourSummary_tourDate-text">Tour Date</div>
                        <div class="tourReservationPage_form-tourSummary_tourDate-insert">${guideRMTData.tourBasicVo.tour_tourdate}</div>
                    </div>
                 </div>
                 
                 <!--신청투어 양식-->
                 <div class="tourReservationPage_main-form-customerInfo">
                     <div class="tourReservationPage_main-form-customerInfo_row">
                        <div class="tourReservationPage_main-form-customerInfo_column1">
                             	Name
                        </div>
                        <div class="tourReservationPage_main-form-customerInfo_column2">
                             ${guideRMTData.memberBasicVo.member_name}
                        </div>
                     </div>
                     <div class="tourReservationPage_main-form-customerInfo_row">
                        <div class="tourReservationPage_main-form-customerInfo_column1">
                             	Age
                        </div>
                        <div class="tourReservationPage_main-form-customerInfo_column2">
                                ${guideRMTData.memberBasicVo.member_age}
                        </div>
                     </div>
                     <div class="tourReservationPage_main-form-customerInfo_row">
                        <div class="tourReservationPage_main-form-customerInfo_column1">
                            	 Gender
                        </div>
                        <div class="tourReservationPage_main-form-customerInfo_column2">
                                ${guideRMTData.memberBasicVo.member_gender}
                        </div>
                     </div>
                     <div class="tourReservationPage_main-form-customerInfo_row">
                        <div class="tourReservationPage_main-form-customerInfo_column1">
                            	 Phone
                        </div>
                        <!-- reservation_call 넘겨주기-->
                        <div class="tourReservationPage_main-form-customerInfo_column2">
                            ${guideRMTData.reservationBasicVo.reservation_call}
                        </div>
                     </div>
                     <div class="tourReservationPage_main-form-customerInfo_row">
                        <div class="tourReservationPage_main-form-customerInfo_column1">
                            	 
                        </div>
                        <!-- reservation_participate  넘겨주기-->
                        <div class="tourReservationPage_main-form-customerInfo_column2">
                            ${guideRMTData.reservationBasicVo.reservation_participate}명
                        </div>
                     </div>
                     <div class="tourReservationPage_main-form-customerInfo_wish">
                        <div class="tourReservationPage_main-form-customerInfo_column1">
                              Request
                        </div>
                        <!-- reservation_wish 넘겨주기-->
                        <div class="tourReservationPage_main-form-customerInfo_column2">
                            ${guideRMTData.reservationBasicVo.reservation_wish}
                        </div>
                     </div>
                     <!--예약상태--보류(b)로(reservation_confirm), 투어신청취소여부--(n)으로(reservation_tour_cancel) 넘겨주기 -->
                     <!-- 보류 -->
                     <c:if test="${guideRMTData.reservationBasicVo.reservation_confirm =='b'}">
                     	<div class="tourReservationPage_confirm_btn">
                            <div>
                            	<div class="tourReservationPage_confirm_btn_column" onclick="confirmYN()">confirm</div>
                            </div>
                            <a href="./guideTourReservationNoCheckAction?reservation_idx=${guideRMTData.reservationBasicVo.reservation_idx}&tour_idx=${guideRMTData.tourBasicVo.tour_idx}">
                            	<div class="tourReservationPage_confirm_btn_column">Cancel</div>
                            </a>
                        </div>
                     </c:if>
                     
                      <!-- 확정 -->
                     <c:if test="${guideRMTData.reservationBasicVo.reservation_confirm =='y'}">
                     	<div class="tourReservationPage_cancle_btn">
                            <div><div class="cancle_btn">Your reservation has benn confirmed</div></div>
                            <a href="./guideTourReservationNoCheckAction?reservation_idx=${guideRMTData.reservationBasicVo.reservation_idx}&tour_idx=${guideRMTData.tourBasicVo.tour_idx}">
                            	<div class="tourReservationPage_confirm_btn_column">Cancel</div>
                            </a>
                        </div>
                     </c:if>
                     
                      <!-- cancled -->
                     <c:if test="${guideRMTData.reservationBasicVo.reservation_confirm =='n'}">
                     	<div class="tourReservationPage_cancle_btn">
                            <div><div class="cancle_btn">Your reservation has been canceled</div></div>
                            <div>
                            	<div class="tourReservationPage_confirm_btn_column" onclick="confirmYN()">Add</div>
                            </div>
                        </div>
                     </c:if>
                        
                     </div>
                </div>
        </main>

       

<!-- guideTourReservationYesCheckAction?reservation_idx=${guideRMTData.reservationBasicVo.reservation_idx}&tour_idx=${guideRMTData.tourBasicVo.tour_idx} -->

</body>
</html>
