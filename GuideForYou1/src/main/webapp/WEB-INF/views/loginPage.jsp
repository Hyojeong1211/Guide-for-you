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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/login_css/EditProfilePage.css">
    <title>loginPage</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/login_css/loginGlobals.css"> 
    <link href="https://fonts.googleapis.com/css?family=East+Sea+Dokdo&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <style>
        body{
            top:0;
            margin:0;
            padding:0;
            background: url("https://i.imgur.com/x5CfXzp.jpg") no-repeat center center fixed; 
            -webkit-background-size: cover;
            -moz-background-size: cover;
            -o-background-size: cover;
            background-size: cover;
        } 
        
        .loginPage_main{
    width:305px;
    margin:0 auto;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    margin-bottom: 230px;
    margin-top:120px;
}
    </style>
</head>
<body>
    <div class="back-shadow">
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
                        		<div class="header-row header_mypageText">My Page</div>
                    		</a>
                    		<a href="./logoutAction" class="headerWhenLogin headerWhenLogin_second">
                        		<div class="header-row">Sign out</div>
                    		</a>
                    		<a href="./tourEnrollPage" class="headerWhenLogin headerWhenLogin_third">
                        		<div class="header-row">Tour update</div>
                    		</a>
                		</div>
            		</div>
        		</header>
        	</c:otherwise>
        </c:choose>

            <main class="loginPage_main">

                <section class="main_section1">
                  <div class="main_section1-topBox">
                    <div class="topBox_loginText">Sign in</div>
                     <!--<div class="topBox_forgotPassword">아이디/비밀번호 찾기</div>-->
                    <div class="btn topBox_forgotPassword" data-toggle="modal" data-target="#exampleModal">Forget your Id/Password?</div>
                    </div>
                
                  <form action="./loginAction" method="post">
                      <div class="main_section1-loginBox">
                            <input type="text" placeholder="ID"  name="member_id" class="LonIn_input">
                            <input type="password" name="member_pw" placeholder="password" class="LonIn_input">    
                      </div>
                      <button type="submit" class="login_button">Sign in</button>
                  </form>
                </section>
              
                <section class="main_section2">
                  <div class="main_section2-text">Are you not a member of Guide For You yet?</div>
                  <a href="./joinMemberPage">
                    <div class="main_section2-joinMember">
                       	 Sign Up
                    </div>
                  </a>
               
                </section>

            </main>    

            

        


    </div>




    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
              <div class="modal-content">
                <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                  </button>
                </div>
                <div class="modal-body">
                    
                     <div class="ResetButtons"> 
                        <a href="./idReset">
                            <div class="idResetButton"> Id</div>  
                        </a>
                        <a href="./passwordReset">
                            <div class="passwordResetButton">Password</div>  
                        </a>
                    </div>
                    </div>
                </div>
              </div>
            </div>
          </div>
    
    
          <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    </body>
    </html>
</body>
</html>