<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
 
    request.setCharacterEncoding("UTF-8");
 
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    
	<style>
        
        /*div{border: 1px solid red; box-sizing: border-box;}*/
        .wrap{width: 1000px; height: 1000px; margin: auto;}

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
        #content{width: 100%; margin-left: 150px;}

        /*큰제목*/
        p{font-size: 23px; font-weight: bolder;}

        
        /* fundingDetail content */
        .fundingDetail #content_1{height: 20%; margin-top: 50px;}
        .fundingDetail #content_2{height: 30%; margin-top: 150px;}
        .fundingDetail #content_3{height: 30%; margin-top: 80px;}

        
        /* 각각 테이블 */
        .fundingDetail table{margin-left: 20px; width: 80%; border: black solid 1px;}
        #orderBasic th{width: 150px; height: 40px;}
        #orderBasic td{width: 150px; height: 30px;}

        #orderDetail th{width: 150px; height: 40px;}
        #orderDetail td{height: 50px;}

        #delivery th{width: 150px; height: 40px; }
        #delivery td{height: 40px;}

        
        #payInfo td{width: 200px; height: 40px; text-align: center;}
        #payInfo th{width: 200px; height: 100px; text-align: center;}
        
        
        
        

        /* .fundingDetail 버튼 부분 */
        .fundingDetail .buttonArea{height: 150px; text-align: center;}

        .fundingDetail #btn1{background-color: rgb(52, 152, 219); color: honeydew;}
        .fundingDetail button{width: 200px;}

		/* 팝업*/
		#popup01{ display: none;}
		
		#popup01{
			width: 500px;
			height: 600px;
			position: absolute;
			top: 50%;
			left: 50%;
			margin: 250px;
			background-color: #fff;
			z-index: 2;
		 }
		 
		.backon{
		    content: "";
		    width: 100%;
		    height: 100%;
		    background: #00000054;
		    position: fixed;
		    top: 0;
		    left: 0;
		    z-index: 1;
		}
		
		
		.openPopup{
		  cursor:pointer;
		}

    </style>
    
</head>
<body>
    <div class="wrap">
        
        <!-- 펀딩내역 상세 -->
        <div id="mypage">
            <div id="content" class="fundingDetail">
              
              <p>펀딩내역</p>
              <div id="underLine"></div>
                
              <table id="orderBasic">
                <tr>
                  <th>펀딩날짜 : ${orderList[0].orderDate }</th>
                  <th>주문번호 : ${orderList[0].orderNo } </th>
                  <th> 상태 :
	                  <c:choose>
					    <c:when test="${orderList[0].orderStatus eq '1'}">
					                결제완료
					    </c:when>
					    <c:when test="${orderList[0].orderStatus eq '2'}">
					          취소요청
					    </c:when>
					    <c:otherwise>
					         취소완료
					    </c:otherwise>
				     </c:choose>              	                
	              </th>
                </tr>
              </table>
              
                
                <!-- 펀딩상품-->
                <div id="content_1">
                
                  <p>펀딩상품</p>

                  <table id="orderDetail">
                    <tr>
                      <th style="width: 60%;">상품명</th>
                      <th style="width: 15%;">리워드금액</th>
                      <th style="width: 8%;">수량</th>
                      
                    </tr>
                    <c:forEach var="orderList" items="${ orderList }">
	                    <tr>
	                      <td>
	                        <div style="margin-top: 20px;">${orderList.projectTitle }</div>
	                        <div>${orderList.rewardTitle }</div>
	                        <div>${orderList.rewardContent }</div>
	                       
	                        <!-- 옵션값 자리 -->
							<div id="options"> <input type="button" id="selectOption" value="${orderList.rewardNo }"></div>
	                        
                
	                        
	                      </td>
	                      <td>${orderList.rewardPrice }</td>
	                      <td>${orderList.count }</td>
	                      
	                    </tr>
					</c:forEach>
                  </table>
                  
                </div>
                <input type="hidden" name="orderNo" value="${ orderList[0].orderNo }">
                
                
                <!-- 옵션 내역들 가져오기 ajax -->
                <script>
                
                $(function() {
					$('#orderDetail #selectOption').click( function() {
                	   var rewardNo = $(this).val();
					   var orderNo = $("input[name=orderNo]").val();
					   
					   //console.log(rewardNo);
					   //console.log(orderNo);
					   var data = {"rewardNo":rewardNo, "orderNo":orderNo}
            			
						$.ajax({
			    			url:"optionList.me",
			    			type : "POST",
			    			data:JSON.stringify(data),
			    			dataType: "json",
			    		    contentType:"application/json;charset=UTF-8",

			    					
							success:function(list){
			    				console.log(list);
			    				
			    				$.each(list, function(i, obj){
			    					value += "<tr>"
			    								+ "<td>" + obj.optionContent + "</td>"
			    								
			    							+ "</tr>";	
			    				})
			    				
			    				
			    				$("#orderDetail #options").html(value);
			    				
			    			
			    			}, error:function(){
			    				console.log("ajax 실패")
			    			}	
			    			
			    		})
			    	})
                })
                
                </script>

                
                <!-- 배송지 정보 / 배송지가 필요한 리워드인경우에만 보여짐????? 없으면 걍 빈칸으로 둘까 생각즁-->
                <form action="updateOrder.me" method="post">
	                <c:choose>
	                	<c:when test="${orderList[0].rewardShip eq 'Y' }">
	                		<div id="content_2">
			                  <p>배송지 정보</p>
			                  <table id="delivery">
			                    <tr>
			                      <th>받는사람</th>
			                      <td style="width: 600px;"><input type="text" placeholder="이름" value="${orderList[0].receiverName }" name="receiverName" readonly required></td>
			                    </tr>
			                    <tr>
			                      <th>휴대폰번호</th>
			                      <td><input type="text" placeholder="휴대폰번호" value="${orderList[0].receiverPhone }" name="receiverPhone" id="receiverPhone" readonly required></td>
			                    </tr>
			                    <tr>
			                      <th>주소</th>
			                      <td>
			                        <input type="text" id="sample6_postcode" placeholder="우편번호" style="width: 100px;" value="${orderList[0].addressNo}" name="addressNo" readonly required>
			                        <button type="button" onclick="sample6_execDaumPostcode()"disabled style="width: 150px;">우편번호검색</button>
			                        <br>
			                        <input type="text" id="sample6_address" placeholder="주소" value="${orderList[0].address }" name="address" style="width: 300px;" readonly required>
			                        <br>
			                        <input type="text" id="sample6_detailAddress" placeholder="상세주소" value="${orderList[0].addressDetail }" name="addressDetail" style="width: 300px;" readonly required>
			                        <input type="text" id="sample6_extraAddress" placeholder="참고항목" style="display:none;">
			                      </td>
			                    </tr>
			                    <tr>
			                      <th>배송상황</th>
			                      <td>
			                          <div>
				                          <c:choose>
							            	<c:when test="${orderList[0].shippingStatus eq '1'}">
							                                          배송준비중
							                </c:when>
							                <c:when test="${orderList[0].shippingStatus eq '2'}">
							                     	배송중
							                </c:when>
							                <c:otherwise>
							                     	배송완료
							                </c:otherwise>
							              </c:choose>      
			                          </div>
			                          <div>${orderList[0].shippingCom }  ${orderList[0].shippingNo }</div>
			                          <!--시간되면 택배조회 api-->
			                      </td>
			                    </tr>
			                    <tr>
			                      <td colspan="2" class="buttonArea">
			                      	<input type="hidden" value="${orderList[0].orderNo }" name="orderNo">
			                        <button type="submit" id="modify" disabled>배송지수정</button>
			                      </td>
			                    </tr>
			                  </table>
			                </div>
	                	</c:when>
	                	<c:otherwise>
	                	</c:otherwise>
	                </c:choose>
                </form>
                
                
                <!-- 배송준비중일경우 input, button에 readonly 제거 -->
                <input type="hidden" value="${orderList[0].shippingStatus}"  id="shippingStatus">
                <script>
                    
                
			        $(document).ready(function(){
			        	var shippingStatus = $("#shippingStatus").val();
			        	
			        	console.log(shippingStatus);
			        	
			            if(shippingStatus =='1'){
			            	
			            	$("input").removeAttr("readonly");
			            	$("button").removeAttr("disabled");
			            }
			
			        });
			    </script>
			    
			    <!-- 핸드폰번호 -->
			    <script>
					$(function(){
	
					    $("#receiverPhone").on('keydown', function(e){
					    // 숫자만 입력받기
					    var trans_num = $(this).val().replace(/-/gi,'');
						var k = e.keyCode;
									
						if(trans_num.length >= 11 && ((k >= 48 && k <=126) || (k >= 12592 && k <= 12687 || k==32 || k==229 || (k>=45032 && k<=55203)) ))
						{
					  	    e.preventDefault();
						}
					    }).on('blur', function(){ // 포커스를 잃었을때 실행합니다.
					        if($(this).val() == '') return;
	
					        // 기존 번호에서 - 를 삭제합니다.
					        var trans_num = $(this).val().replace(/-/gi,'');
					      
					        // 입력값이 있을때만 실행합니다.
					        if(trans_num != null && trans_num != '')
					        {
					            // 총 핸드폰 자리수는 11글자이거나, 10자여야 합니다.
					            if(trans_num.length==11 || trans_num.length==10) 
					            {   
					                // 유효성 체크
					                var regExp_ctn = /^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})([0-9]{3,4})([0-9]{4})$/;
					                if(regExp_ctn.test(trans_num))
					                {
					                    // 유효성 체크에 성공하면 하이픈을 넣고 값을 바꿔줍니다.
					                    trans_num = trans_num.replace(/^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})-?([0-9]{3,4})-?([0-9]{4})$/, "$1-$2-$3");                  
					                    $(this).val(trans_num);
					                }
					                else
					                {
					                    alert("유효하지 않은 전화번호 입니다.");
					                    $(this).val("");
					                    $(this).focus();
					                }
					            }
					            else 
					            {
					                alert("유효하지 않은 전화번호 입니다.");
					                $(this).val("");
					                $(this).focus();
					            }
					      }
					  });  
					});
				</script>
                
                
                <!-- 카카오 우편번호 api -->
                <script>
				    function sample6_execDaumPostcode() {
				        new daum.Postcode({
				            oncomplete: function(data) {
				                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
				
				                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
				                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				                var addr = ''; // 주소 변수
				                var extraAddr = ''; // 참고항목 변수
				
				                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
				                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
				                    addr = data.roadAddress;
				                } else { // 사용자가 지번 주소를 선택했을 경우(J)
				                    addr = data.jibunAddress;
				                }
				
				                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
				                if(data.userSelectedType === 'R'){
				                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
				                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
				                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
				                        extraAddr += data.bname;
				                    }
				                    // 건물명이 있고, 공동주택일 경우 추가한다.
				                    if(data.buildingName !== '' && data.apartment === 'Y'){
				                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
				                    }
				                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
				                    if(extraAddr !== ''){
				                        extraAddr = ' (' + extraAddr + ')';
				                    }
				                    // 조합된 참고항목을 해당 필드에 넣는다.
				                    document.getElementById("sample6_extraAddress").value = extraAddr;
				                
				                } else {
				                    document.getElementById("sample6_extraAddress").value = '';
				                }
				
				                // 우편번호와 주소 정보를 해당 필드에 넣는다.
				                document.getElementById('sample6_postcode').value = data.zonecode;
				                document.getElementById("sample6_address").value = addr;
				                
				                // 커서를 상세주소 필드로 이동한다. 상세주소 null로 만들고,
				                document.getElementById("sample6_detailAddress").value='';
				                document.getElementById("sample6_detailAddress").focus();
				            }
				        }).open();
				    }
				</script>
                

                
                
                <!-- 결제정보-->
                <div id="content_3">
                
                  <p>결제정보</p>

                  <table id="payInfo">
                    <tr>
                      <td>리워드금액</td>
                      <td>추가후원금</td>
                      <td>배송비</td>
                    </tr>
                    <tr>
                      <td>총금액 원</td>
                      <td>
	                      <c:choose>
				          	<c:when test="${!empty orderList[0].orderPlus }">
				                	${ orderList[0].orderPlus} 원
				            </c:when>
				            <c:otherwise>
				                     	0 원  
				            </c:otherwise>
				          </c:choose>     
                      </td>
                      <td>0원</td>
                      <!-- 배송비 -->
                    </tr>
                    <tr>
                      <th style="text-align: right;" colspan="2" id="finalPrice">최종 결제 금액</th>
                      <th style="text-align: right;" id="finalPrice">최종결제 원</th>
                    </tr>
                    
                    
                  </table>
                </div>
            
                <!-- 주문상태가 결제완료상태일때만 반환신청 버튼 -->
                <div class="buttonArea">
                  <button><a href="myFunding.me">목록</a></button>
                  <c:if test="${orderList[0].orderStatus eq '1'}">
				  	<button class="openPopup">펀딩 반환 신청</button>
				  </c:if>
                  
                </div>
                
                <!-- 환불신청 팝업 -->
                <div id="popup01">
				    
				    <form action="refundRequest.me" method="post" enctype="multipart/form-data" >
					    <div> 펀딩금 반환신청</div>
					      <table border="1">
					        
					        <tr>
					          <td>반환 사유 입력</td>
					        </tr>
					        <tr>
					          <td>
					          	  <textarea cols="30" rows="10" style="resize: none;" id="rReason" name="rReason"></textarea>
					          </td>
					        </tr>
					        <tr>
					          <td><input type="file" name="file" accept="image/*"></td>
					          <!-- 이미지만 -->
					        </tr>
					      </table>
					
					      <table border="1">
					        <tr>
					          <td colspan="2">반환 금액</td>
					        </tr>
					        
					        <tr>
					          <td colspan="2">상세 내역</td>
					        </tr>
					        <tr>
					          <td>리워드 금액</td>
					          <td>000 원</td>
					        </tr>
					        <tr>
					          <td>추가후원금</td>
					          <td>${ orderList[0].orderPlus} 원</td>
					        </tr>
					        <tr>
					          <td>배송비</td>
					          <td>0원</td>
					        </tr>
					        <tr>
					          <th>반환 신청금액</th>
					          <td>0000 원</td>
					        </tr>
					        
					      </table>
						  <input type="hidden" name="orderNo" value="${ orderList[0].orderNo }">
					      <button type="submit" onclick="return validate();">신청</button>
					      <button type="button" class="cancel" >취소</button>
				
					</form>
				</div>
				
				<!-- 환불신청 팝업 -->
				<script>
				  $(document).ready(function(){     
				    $(".openPopup").on("click", function(event) { 
				    $("#popup01").show();  
				    $("body").append('<div class="backon"></div>');
				    });
				    
				    $("body").on("click", function(event) { 
				        if(event.target.className == 'cancel' || event.target.className == 'backon'){
				        	
				        	
				        	var result = confirm("환불신청을 취소하시겠습니까?");
		                	
		                	if(result){
		                		
		                		$("#popup01").hide();
					      	    $(".backon").hide();
		                	
		                	} else {
		                		alert("환불신청이 취소되었습니다");
		                		return false;
		                	}
				        	
				        }
				      });
				
				  });
				
				</script>
				
				<!-- 환불신청긍록 유효성검사 -->
				<script>
				
				function validate(){
                	
                	var rReason = document.getElementById("rReason");
                	var regExp = /[\S+$]/; // 공백을 제외한 모든 문자로 1글자이상 등록
                	
                	
                	if(!regExp.test(rReason.value)){ 
                		alert("환불신청 사유를 입력해주세요");
                	
                		rReason.value="";
                		rReason.focus();
                		
                		return false;
                	}
                	
                	
                	var result = confirm("환불신청을 하시겠습니까?");
                	
                	if(result){
                		
                	} else {
                		alert("환불신청이 취소되었습니다");
                		return false;
                	}
                
                }				
				
				
				
				</script>
				
                                    
                

            </div>
            
        </div>
        

    </div>
    
    
</body>
</html>