<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


    
    <style>
        
        /*div{border: 1px solid red; box-sizing: border-box;}*/
        .wrap{width: 1000px; height: 800px; margin: auto; }

        .wrap>div{width: 100%;}
        

        /* 메뉴 아래 선 */
        #underLine{
            background-color: rgb(192, 189, 189);
            height: 1.5px;
            width: 80%;
            
        }

        #mypage{height: 100%; margin-top: 50px;}

        /*큰제목*/
        #mainTitle {font-size: 23px; font-weight: bolder;}
        
       
        /* mypage안의 세부영역 */
        #mypage>div{height: 100%;}
        #content{width: 100%; margin-left:150px;}

        /*------공통---------*/

        
        /* main content */
        #main_1{height: 30%; margin-top: 50px;}
        #main_2{height: 30%;}
        #main_3{height: 30%; margin-top: 150px;}
        

        #main_3>div{float: left;}
        #main_3_1{width: 45%;}
        #main_3_2{width: 45%;}
        
        

        /* 펀딩내역 */
        #count{
          background-color: rgba(41, 128, 185, 0.16);
          width: 300px;
          margin-left: 300px;
          margin-top: 50px;
          font-size: 30px;
          border-radius: 40px;
          text-align: center;
        }

        /* 좋아요 */
        #main_2>.like{float: left; padding: 10px;}
        .like>table{width: 90%;}


        /* 문의내역 */
        #main_3_1>table{width: 90%;}
        #qTitle{width: 70%; height: 60px;}
        #qDate{width: 30%;}
        
        
        /* 팔로잉 테이블 */
        #main_3_2>table{width: 100%;}
        #profile{width: 10%; height: 60px;}
        #user{width: 60%}
        #status{width: 20%}

        #id{font-size: 12px; font-weight: bold;}
        #idDetail{font-size: 10px;}

       
        a{text-decoration: none; color: black;}

    </style>



</head>
<body>
	
	
    
    <div class="wrap myPageMenu">
        
        <!-- 나의 펀딩 내역  -->
        <div id="mypage">
            <div id="content">
                
                <!-- 나의 펀딩 목록-->
                <div id="main_1">
                  <p id="mainTitle"><a href="">나의 펀딩 내역</a></p>
                  <div id="underLine"></div>

                  <div id="count">펀딩 참여<br> ${fundingCount} 회</div>


                </div>
                
                
                <!--좋아요-->
                <div id="main_2">
                  <p id="mainTitle"><a href="">좋아요</a></p>
                  <div id="underLine"></div>

                  <div class="like">
                    
                    <c:choose>
                    	<c:when test="${ empty mainLikeList }">
                    		<div>
                    			좋아요 목록이 없습니다
                    		</div>
                    		
                    	</c:when>
                    	<c:otherwise>
                    		<c:forEach var="likeList" items="${ mainLikeList }" end="2">
	                    		<div>
			                        <table>
			                            <tr>
			                                <td colspan="2">
			                                	<c:choose>
			                                		<c:when test="${ empty likeList.projectThum }">
			                                			<img src="resources/project_thumbnail/no_image.jpg"  width="250" height="200">
			                                		</c:when>
			                                		<c:otherwise>
			                                			<img src="${ likeList.projectThum }"  width="250" height="200">
			                                		</c:otherwise>
			                                	</c:choose>
			                                </td>
			                            </tr>
			                            <tr>
			                                <td colspan="2">${ likeList.projectTitle }</td>
			                            </tr>
			                            <tr>
			                                <td>${ likeList.projectGPrice }</td>
			                                <td>~ ${ likeList.projectEndDt }</td>
			                            </tr>
			                        </table>
			                    </div>
                    		</c:forEach>
                    	</c:otherwise>
                    </c:choose>
                  
                  </div>
				</div>

                
                <!--나의문의 & 팔로잉-->
                <div id="main_3">
                  
                  <div id="main_3_1">
                    <p id="mainTitle"><a href="">나의 문의 내역</a></p>
                    <div id="underLine"></div>

                    <!--3개-->
                    <c:choose>
                		<c:when test="${ empty mainQueryList }">
                			1:1 문의 내역이 없습니다
                		</c:when>
                		<c:otherwise>
                			<table>
		                        
                				<c:forEach var="queryList" items="${ mainQueryList }" end="2">
                				  <tr>
		                            
		                            <td>${ queryList.otoTitle }</td>
		                            <td>${ queryList.otoDate }</td>
		                            
		                          </tr>
		                       
                				</c:forEach>
                			</table>
                		</c:otherwise>
                	</c:choose>
				  </div>    
                  
                  
                  <div id="main_3_2">
                    <p id="mainTitle"><a href="">팔로잉</a></p>
                    <div id="underLine"></div>

                    <!--3개-->
                    <c:choose>
                    	<c:when test="${ empty mainFollowList }">
                    		팔로우 목록이 없습니다
                    	</c:when>
                    	<c:otherwise>
	                    	<c:forEach var="m" items="${ mainFollowList }" end="2">
	                    	   <table id="followTable">
		                      	<tr>
			                        <th id="profile">
			                        <c:choose>
			                        	<c:when test="${ empty m.memberProfile }">
			                            	<img src="resources/member_profile/profile_basic.jpg" width="80" height="80" class="rounded-circle" >
			                        	</c:when>
			                        	<c:otherwise>
			                        		<img src="${ m.memberProfile }" width="80" height="80" class="rounded-circle" >
			                        	</c:otherwise> 
			                        </c:choose> 
			                        </th>
			                        <th id="user">
			                          <div id="id">${ m.partnerName }</div>
			                          <div id="idDetail">파트너</div>
			                          <div id="followMemberNo" style="display: none;" >${ m.memberNo }</div>
			                          
			                        </th>
			                        <input type="hidden" value="${ m.memberNo }" name="followMemberNo" id="followMemberNo">
			                       
			                      </tr>
								</table>
							</c:forEach>	
                    	</c:otherwise>
                    </c:choose>
				  </div>
				  
				  
				
                  
                
                
                
                
                
                </div>
            
            </div>
            
        </div>
        

    </div>
</body>
</html>