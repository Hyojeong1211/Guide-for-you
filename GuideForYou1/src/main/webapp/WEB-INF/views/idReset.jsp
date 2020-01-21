<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/login_css/loginGlobals.css">
    <link href="https://fonts.googleapis.com/css?family=East+Sea+Dokdo&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <title>idReset</title>
        <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <style>
      
        body{ top:0;
            margin:0;
            padding:0;
            background: url("./login_css/images/loginPageBackground.jpg") no-repeat center center fixed;
            background-size: cover;
            -webkit-background-size: cover;
            -moz-background-size: cover;
            -o-background-size: cover;
            background-size: cover;
            }
    </style>
    
    <script type="text/javascript">
    		
   		function findId() {
   			
   			console.log("ID matching check is running............");

   			var params = $('#form1').serialize();
   			
   			console.log(params);
   			
   			$.ajax({
   				dataType : "json",
   				type : "post",
   				url : "./rest_idReset",
   				data : params,
   				success : function(result) {

   					if (result.idExit == true) {
   						
   						alert("Your ID is  "+result.idResult);
   						location.href="./loginPage";
   						
   					} else {
   						
   						alert("ID matching the information you entered does not exist.");
   						$('#member_name').val('');
   						$('#member_name').focus();
   						$('#member_age').val('');
   						$('#member_phone').val('');
   					}

   				}
   			});
			
			

   		}

   	
   			
   </script>
   
  
   	
   			
 
    
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
                    			<div class="header-login">Sgin in</div>
                			</a>
                			<a href="./joinMemberPage" class="headerWhenNotLogin">
                    			<div class="header-join">Sgin up</div>
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
                        				<img alt="member_profile_photo" class="header_memberProfilePhoto" src="MainImages/basicMemberProfile.jpg">
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
                        		<div class="header-row">Update my tour</div>
                    		</a>
                		</div>
            		</div>
        		</header>
        	</c:otherwise>
        </c:choose>
    
    
    <main class="Reset-main">
    <div class="idReset-top-text">Find my ID
    </div>
        


         <form id="form1" method="post" name="form1" class="idResetForm">

            <div  class="idresetbox_colum">
                <div class="idReset-text name">Name</div>
                <input type="text" id="member_name" name="member_name" class="idReset-input">
            </div> 
                      
            <div  class="idresetbox_colum">
                <div class="idReset-text">Birthday</div>
                <input type="date" id="member_age" name="member_age" class="idReset-input">
            </div> 
                      
                      
            <div  class="idresetbox_colum">
                <div class="idReset-text">Phone Number</div>
                <input type="text" id="member_phone"  name="member_phone" class="idReset-input" placeholder="ex) 01012345678">
            </div>

            <button type="button" class="idreset_button" onclick="findId()">Find my ID</div>
        </form>
    </main>
    
    
    <footer>
        푸터입니다.
    </footer>

</body>
</html>