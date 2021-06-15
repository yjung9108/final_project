<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    
    <style>
        
        /*div{border: 1px solid red; box-sizing: border-box;}*/
        .wrap{width: 1000px; height: 800px; margin: auto;}

        .wrap>div{width: 100%;}

        /* 메뉴 아래 선 */
        #underLine{
            background-color: rgb(192, 189, 189);
            height: 1.5px;
            width: 80%;
            
        }

        #mypage{height: 100%; margin-top: 50px;}
        
       
        /* mypage안의 세부영역 */
        #mypage>div{height: 100%;}
        #content{width: 100%; margin-left:150px;}

        /*큰제목*/
        #mainTitle{font-size: 23px; font-weight: bolder;}

        /* 페이징 */
        #pagingArea{width:fit-content; margin:auto;}



        /* follow content */
        .follow #content_1{height: 80%; width: 80%; margin-top: 50px; margin-left: 30px;}
        .follow #content_2{height: 10%; width: 80%;}
        
        
        /* 팔로잉 테이블 */
        .follow table{width: 100%;}
        .follow #profile{width: 15%; height: 100px;}
        .follow #user{width: 60%}
        .follow #status{width: 20%}

        .follow #id{font-size: 18px; font-weight: bold;}
        .follow #idDetail{font-size: 12px;}
       
        .follow .btn{background-color: rgb(178, 185, 223); color: white;}
        





    </style>
</head>
<body>
    <div class="wrap">
        
        <!-- 나의 문의내역  -->
        <div id="mypage">
            <div id="content" class="follow">
                <p id="mainTitle">팔로잉</p>
                <div id="underLine"></div>
                
                <div style="margin-top: 20px;">
                  파트너들의 펀딩 활동을 보실 수 있습니다.
                </div>
                
                <!-- 팔로잉 목록-->
                <!-- 최대 5개-->

                <div id="content_1">
                    <c:choose>
                    	<c:when test="${ empty list }">
                    		팔로우 목록이 없습니다
                    	</c:when>
                    	<c:otherwise>
	                    	<table>
		                      <c:forEach var="m" items="${ list }">
			                      <tr>
			                        <td id="profile">
			                        <c:choose>
			                        	<c:when test="${ empty m.memberProfile }">
			                            	<img src="resources/profile/profile_blank.jpg" width="80" height="80" class="rounded-circle" >
			                        	</c:when>
			                        	<c:otherwise>
			                        		<img src="${ m.memberProfile }" width="80" height="80" class="rounded-circle" >
			                        	</c:otherwise> 
			                        </c:choose> 
			                        </td>
			                        <td id="user">
			                          <div id="id">${ m.partnerName }</div>
			                          <div id="idDetail">오픈펀딩 20</div>
			                        </td>
			                        <td id="status">
			                          <button type="button" class="btn btn-sm">팔로잉</button>
			                        </td>
			                      </tr>
								</c:forEach>
							</table>	
                    	</c:otherwise>
                    </c:choose>
                </div>
                
                
                <!-- 페이징 -->
                <div id="content_2">
                    <div id="pagingArea">
                        <ul class="pagination">
                        
                        	<!-- list가 있을때만 페이지버튼 -->
                        	<c:if test="${ !empty list }">
	                        	<c:choose>
	                        		<c:when test="${ pi.currentPage eq 1 }">
	                        			<li class="page-item"><a class="page-link" href="#">Previous</a></li>
	                        		</c:when>
		                            <c:otherwise>
		                            	<li class="page-item"><a class="page-link" href="followlist.me?currentPage=${ pi.currentPage-1 }">Previous</a></li>
		                            </c:otherwise>
		                        </c:choose>
		                        
		                        <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
			                    	<li class="page-item"><a class="page-link" href="followlist.me?currentPage=${ p }">${ p }</a></li>
			                    </c:forEach>
		                       
		                        <c:choose>
			                    	<c:when test="${ pi.currentPage eq pi.maxPage }">
				                    	<li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
				                    </c:when>
				                    <c:otherwise>
				                    	<li class="page-item"><a class="page-link" href="followlist.me?currentPage=${ pi.currentPage+1 }">Next</a></li>
			                    	</c:otherwise>
			                    </c:choose>
		                    </c:if>
	                      </ul>
                    
                    </div>
                </div>
            
            </div>
            
        </div>
        

    </div>
</body>
</html>