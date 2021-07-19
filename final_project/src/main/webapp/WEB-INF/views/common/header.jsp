<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<!-- jQuery 라이브러리 -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<!-- 부트스트랩에서 제공하고 있는 스타일 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
	<!-- 부트스트랩에서 제공하고 있는 스크립트 -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

    <style>
        @import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap');
        
		.headerOuter{
            width: 1200px; 
            margin: auto; 
            height: 117px; 
            padding: 10px;
        }
		.headerOuter div{display: table-cell;}
		.headerOuter a{
			text-decoration: none;
            color: rgb(64, 64, 64);
            font-weight: 600;
            font-size: 17px;
            margin-right: 10px;
		}
        .headerLeft{
            float: left;
            margin-top: 33px;
            margin-left: 30px;
        }
        .headerCenter{
            float: left;
            margin-left: 158px;
        }
        #searchIcon{
            margin-top: 28px;
            width: 31px;    
            margin-right: -170px;
        }
        .headerRight{
            float: right;
            margin-right: 50px;
            margin-top: 33px;
        }
    </style>
</head>
<body>
	<div class="headerOuter" align="center" >
	
		<div class="headerLeft">
			<img src="resources/images/catIcon.PNG" width="25px" style="margin-top: -6px;">
			<a href="" style="color: rgb(52, 152, 219);"> 프로젝트 둘러보기 </a>
			<a href=""> 프로젝트 올리기</a>
		</div>
		
		<div class="headerCenter">
			<a href="${ pageContext.request.contextPath }"><img src="${ pageContext.request.contextPath }/resources/images/logo.PNG" width="165px" id="logoImg"></a>
		</div>
        
        <input type="image" src="resources/images/searchIcon.PNG" id="searchIcon">
		
		<c:choose>
			<c:when test="${ empty loginUser }">
		
				<!-- 로그인전 -->
				<div class="headerRight">
					<a data-toggle="modal" data-target="#loginModal">로그인</a>
					<a href=""> 회원가입</a>
					<img src="resources/images/memberIcon.PNG" width="30px" style="margin-left: -3px; margin-top: -6px;">
				</div>
			
			</c:when>
			<c:otherwise>
				<!-- 로그인후 -->
				<div class="headerRight" style="">
					<a href="logout.me">로그아웃</a>
					<a href="myPage.me"> 마이페이지</a>
					<img src="resources/images/memberIcon.PNG" width="30px" style="margin-left: -3px; margin-top: -6px;">
				</div>
			
			</c:otherwise>
		</c:choose>




		<!-- 관리자 -->
		<div class="headerRight" style="display:none">
			<a href="">로그아웃</a>
			<a href=""> 관리자</a>
			<img src="resources/images/memberIcon.PNG" width="30px" style="margin-left: -3px; margin-top: -6px;">
		</div>
	</div>
	
	
	
	<c:if test="${ !empty alertMsg }">
		<script>
			alert("${alertMsg}");
		</script>
		<c:remove var="alertMsg" scope="session"/>
	</c:if>
	
	
	
	<!-- 로그인 클릭 시 뜨는 모달 (기존에는 안보이다가 위의 a 클릭시 보임) -->
    <div class="modal fade" id="loginModal">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">Login</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button> 
            </div>

            <form action="login.me" method="post">
                <!-- Modal Body -->
                <div class="modal-body">
                    <label for="userId" class="mr-sm-2">ID :</label>
                    <input type="text" name="memberId" class="form-control mb-2 mr-sm-2" placeholder="Enter ID" id="memberId"> <br>
                    <label for="userPwd" class="mr-sm-2">Password:</label>
                    <input type="password" name="memberPwd" class="form-control mb-2 mr-sm-2" placeholder="Enter password" id="memberPwd">
                </div>
                
                <!-- Modal footer -->
                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary">로그인</button>
                    <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
                </div>
            </form>
            </div>
        </div>
    </div>
    
    	<!-- 채널톡 api -->
		<!-- Channel Plugin Scripts -->
		<script>
		  (function() {
		    var w = window;
		    if (w.ChannelIO) {
		      return (window.console.error || window.console.log || function(){})('ChannelIO script included twice.');
		    }
		    var ch = function() {
		      ch.c(arguments);
		    };
		    ch.q = [];
		    ch.c = function(args) {
		      ch.q.push(args);
		    };
		    w.ChannelIO = ch;
		    function l() {
		      if (w.ChannelIOInitialized) {
		        return;
		      }
		      w.ChannelIOInitialized = true;
		      var s = document.createElement('script');
		      s.type = 'text/javascript';
		      s.async = true;
		      s.src = 'https://cdn.channel.io/plugin/ch-plugin-web.js';
		      s.charset = 'UTF-8';
		      var x = document.getElementsByTagName('script')[0];
		      x.parentNode.insertBefore(s, x);
		    }
		    if (document.readyState === 'complete') {
		      l();
		    } else if (window.attachEvent) {
		      window.attachEvent('onload', l);
		    } else {
		      window.addEventListener('DOMContentLoaded', l, false);
		      window.addEventListener('load', l, false);
		    }
		  })();
		  ChannelIO('boot', {
		    "pluginKey": "0185b07b-a1f9-41d1-a372-32418a4cc7db"
		  });
		</script>
		<!-- End Channel Plugin -->
	
	
	

</body>
</html>