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

        
        /* info content */
        #info_1{height: 50%;}
        #info_2{height: 30%; margin-top: 150px;}
        #info_3{height: 20%; margin-top: 100px;}

        #info_1_1{margin-top: 20px;}
        #info_2_1{margin-top: 20px;}
        #info_3_1{margin-top: 20px;}
        
        /*큰제목*/
        #mainTitle{font-size: 23px; font-weight: bolder;}

        /* 입력요소 */
        .info table{margin-left: 20px;}
        .info th{width: 200px; height: 40px;}
        .info input{width: 300px}
        .info label{cursor: pointer; font-size: 12px;}
        #readonly{background-color: lightgray;}
        

        /* 버튼 부분 */
        .info .buttonArea{height: 150px; text-align: center;}

        .info #btn1{background-color: rgb(52, 152, 219); color: honeydew;}
        .info button{width: 200px;}
        
        a{text-decoration: none; color: black;}

    </style>
</head>
<body>
    <div class="wrap">
        
        <!-- 회원 정보수정 -->
        <div id="mypage">
            <div id="content" class="info">
                
                <!-- 기본정보 수정-->
                <div id="info_1">
                    
                    <p id="mainTitle">기본정보 수정</p>
                    <div id="underLine"></div>
                    
                    <div id="info_1_1">
                        <table>
                            <tr>
                                <th>프로필사진</th>
                                <td>
                                    <!-- 등록프사가 있을경우 없을경우 -->
                                    <c:choose>
						            	<c:when test="${ empty loginUser.memberProfile }">    
								            <div style="margin-left: 100px; margin-top: 20px;">
	                                        	<img src="resources/profile/profile_blank.jpg" width="100" height="100" class="rounded-circle" id="titleImg" >
	                                    	</div>
							           	</c:when>
							           	<c:otherwise>
							           		<div style="margin-left: 100px; margin-top: 20px;">
		                                        <img src="${ loginUser.memberProfile }" width="100" height="100" class="rounded-circle" id="titleImg" >
		                                    </div>
							           	</c:otherwise> 
						            </c:choose>
                                    
                                    <div style="margin-left: 110px; margin-top: 5px; margin-bottom: 10px;">
                                        <label data-toggle="modal" data-target="#myModal">편집</label>
                                        <label style="margin-left: 20px;" id="deleteFile">삭제</label>
                                    </div>
                                    
                                </td>
                            </tr>
                            <tr>
                                <th>이름</th>
                                <td><input type="text" value="${ loginUser.memberName }" readonly id="readonly"></td>
                            </tr>
                            <tr>
                                <th>이메일</th>
                                <td><input type="text" value="${ loginUser.memberId }" readonly id="readonly"></td>
                            </tr>
                            <tr>
                                <th>휴대폰</th>
                                <td><input type="text" value="${ loginUser.memberPhone }"></td>
                            </tr>
                            <tr>
                                <th colspan="2" class="buttonArea">
                                    <button type="button" class="btn btn-light" id="btn1">정보수정</button>
                                </th>
                                
                            </tr>
    
                        </table>

                    </div>
                </div>
                
                <!-- 프로필사진 첨부 Modal -->
				  <div class="modal" id="myModal">
				    <div class="modal-dialog">
				      <div class="modal-content">
				      
				        <!-- Modal Header -->
				        <div class="modal-header">
				          <h4 class="modal-title">프로필사진 첨부</h4>
				          <button type="button" class="close" data-dismiss="modal">&times;</button>
				        </div>
				        
				        <!-- Modal body -->
				        <div class="modal-body">
				          <input type="file" name="upfile" id="upfile"  onchange="loadImg(this, 1);">
				        </div>
				        
				        <!-- Modal footer -->
				        <div class="modal-footer">
				          <button type="button" class="btn btn-danger" data-dismiss="modal">완료</button>
				        </div>
				        
				      </div>
				    </div>
				  </div>
				  
				  <script>
                               
                                function loadImg(inputFile, num){
                                    // inputFile : 현재 변화가 생긴 input type="file" 요소객체
                                    // num : 몇 번째 input요소인지 확인 후 해당 그 영역에 미리보기하기 위해
                                    
                                    // 파일을 선택하는 순간 inputFile.files라는 속성배열에 0번 인덱스에 파일 담김
                                    //console.log(inputFile.files);
                                    if(inputFile.files.length == 1){ // 선택된 파일이 있을 경우
                                        // 파일을 읽어들일 FileReader 객체 생성
                                        var reader = new FileReader();
                                        // 선택된 파일을 읽어들이기
                                        // => 읽어들이는 순간 해당 그 파일만의 고유한 url부여됨
                                        reader.readAsDataURL(inputFile.files[0]);
                                        // 파일 읽어들이기가 완료된 순간 실행할 함수 정의
                                        reader.onload = function(e){
                                            // 각 영역에 맞춰서 이미지 미리보기
                                            switch(num){
                                                case 1: $("#titleImg").attr("src", e.target.result); break;
                                               
                                            }
                                        }
                                    }else{ // 선택된 파일이 사라졌을 경우
                                        switch(num){
                                            case 1: $("#titleImg").attr("src", null); break;
                                            
                                        }
                                    }
                                }
                                
                                
                                $(function(){

                  			        $("#deleteFile").click(function(){ 

                  			            $("#upfile").val("");
                  			        	$("#titleImg").empty();
                  			        	
                  			        	
                  			        });

                  			    })
                            </script>
			                
                
                
                
                
                
                
                
                
                
                
                
                <!-- 비밀번호 변경-->
                <div id="info_2" >
                 
                    <p id="mainTitle">비밀번호 변경</p>
                    <div id="underLine"></div>

                    <div id="info_2_1">
                        <table>
                            <tr>
                                <th>현재 비밀번호</th>
                                <td><input type="password"></td>
                            </tr>
                            <tr>
                                <th>새 비밀번호</th>
                                <td><input type="password"></td>
                            </tr>
                            <tr>
                                <th>새 비밀번호 확인</th>
                                <td><input type="password"></td>
                            </tr>
                            <tr>
                                <th colspan="2" class="buttonArea">
                                    <button type="button" class="btn btn-light" id="btn1">비밀번호 변경</button>
                                </th>
                            </tr>

                        </table>
                    </div>
                </div>
                
                <!-- 회원 탈퇴-->
                <div id="info_3">
                
                    <p id="mainTitle">회원탈퇴</p>
                    <div id="underLine"></div>
                

                    <div id="info_3_1">
                        <table>
                            <tr>
                                <td>
                                    
                                    	유의사항 안내 페이지를 확인하신 후 신중하게 진행해 주시기 바랍니다.
                                      
                                </td>
                            </tr>
                            <tr>
                                <td class="buttonArea">
                                    <button type="button" class="btn btn-outline-secondary"><a href="deleteForm.me">회원탈퇴로 이동</a></button>
                                </td>
                            </tr>
                        </table>
                        
                          
                        
                    </div>

                </div>
            
            </div>
            
        </div>
        

    </div>
</body>
</html>