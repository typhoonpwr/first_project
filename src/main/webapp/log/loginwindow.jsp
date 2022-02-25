<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.loginwindow-container{
  position: absolute;
width: 910px;
height: 507px;
left: 500px;
top: 285px;

background: #FFFFFF;
box-shadow: 0px 0px 50px rgba(0, 0, 0, 0.35);
border-radius: 10px;
}

.loginwindow_form{
position: absolute;
width: 420px;
height: 400px;
left: 360px;
top: 0px;
}


.loginwindow-button{
position: absolute;
width: 337px;
height: 60px;
left: 0px;
top: 0px;

font-family: Roboto;
font-style: normal;
font-weight: 600;
font-size: 25px;
line-height: 117.69%;

display: center;
align-items: flex-end;
letter-spacing: 0.1em;

color: #573EF2;

background: #FFFFFF;
border: 2px solid #573EF2;
box-sizing: border-box;
border-radius: 10px;

}

.loginwindow-button2{
position: absolute;
width: 337px;
height: 60px;
left: 20px;
top: 310px;

font-family: Roboto;
font-style: normal;
font-weight: 600;
font-size: 25px;
line-height: 117.69%;

display: center;
align-items: flex-end;
letter-spacing: 0.1em;

color: #FFFFFF;

background: #573EF2;
border-radius: 10px;

}

.loginwindow-login{
width:100px;
font-family: Roboto;
font-style: normal;
font-weight: 600;
font-size: 25px;
line-height: 117.69%;

display: flex;
align-items: flex-end;

color: #27243A;

position: absolute;
left: 20px;
top: 0px;

}

.loginwindow-password{
width:100px;
font-family: Roboto;
font-style: normal;
font-weight: 600;
font-size: 25px;
line-height: 117.69%;

display: flex;
align-items: flex-end;

color: #27243A;

position: absolute;
left: 20px;
top: 110px;

}

.loginwindow-input-sm{
background: #FFFFFF;
border: 1px solid #7D7C89;
box-sizing: border-box;
border-radius: 10px;

position: absolute;
width: 380px;
height: 47px;
left: 20px;
top: 40px;
}

.loginwindow-input-sm2{
position: absolute;
width: 380px;
height: 47px;
left: 20px;
top: 150px;

background: #FFFFFF;
border: 1px solid #7D7C89;
box-sizing: border-box;
border-radius: 10px;
}
.loginwindow-image{
position: absolute;
width: 238px;
height: 189px;
left: 100px;
top: 80px;
background: url(../image/M_logo.png);
}

.loginwindow-findid{
position: absolute;
width: 200px;
height: 23px;
left: 500px;
top: 215px;

font-family: Roboto;
font-style: normal;
font-weight: 500;
font-size: 20px;
line-height: 23px;

color: #7D7C89;

}

.loginwindow-findpass{
position: absolute;
width: 200px;
height: 23px;
left: 630px;
top: 215px;

font-family: Roboto;
font-style: normal;
font-weight: 500;
font-size: 20px;
line-height: 23px;

color: #7D7C89;

}

.loginwindow-button-t{
position: absolute;
width: 200px;
height: 18px;
left: 90px;
top: 270px;

font-family: Roboto;
font-style: normal;
font-weight: 500;
font-size: 15px;
line-height: 18px;

color: #7D7C89;

}
.loginwindow-background{
position: absolute;
width: 100%;
height: 100%;
background-image: url("../image/movie-theater.jpg");
}

.loginwindow-background-a{
position: absolute;
width: 100%;
height: 100%;


background: linear-gradient(180deg, rgba(47, 47, 47, 0.3) 8.85%, rgba(21, 20, 30, 0.681818) 43.23%, #27243A 81.25%);
}

.loginwindow_form2{
position: absolute;
width: 380px;
height: 65px;
left: 0px;
top: 310px;
}


</style>

</head>
<body>
<div class="loginwindow-background">
	<div class="loginwindow-background-a"></div>
</div>
  <div class="loginwindow-container">
	       <div class="loginwindow-image">
	       
    
    	<form method="post" action="../log/login.do" class="loginwindow_form">
	     
	         <p class="loginwindow-login" width=30% >아이디</p>
	         <input type=text name=u_id size=15 class="loginwindow-input-sm" width=70%>
	         
	         <p class="loginwindow-password" width=30%>비밀번호</p>
	         <input type=password name=u_pw size=15 class="loginwindow-input-sm2" width=70%>
	         <input type=submit value="로그인" class="loginwindow-button2">
    	</form>
	        
	 <span class="loginwindow-findid"><a href="../find/findid.jsp">아이디찾기</a></span>
	 
	      
	 <span class="loginwindow-findpass"><a href="../find/findpass_input.jsp">비밀번호찾기</a></span>
	 
	         <p class="loginwindow-button-t">무빗을 처음 이용하시나요?</p>
	         
	 <form method="post" action="../join/join.jsp" class="loginwindow_form2">
	         <input type=submit value="회원가입하기" class="loginwindow-button" >
	 </form>        
	        
	   
	 
	      
    </div>
  
  
</body>
</html>






