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

        #mypage{height: 100%; margin-top: 50px; }
        
       
        /* mypage안의 세부영역 */
        #mypage>div{height: 100%;}
        #content{width: 100%;}

        /* 입력요소 */
        #partnerJoin{height: 700px;}
        #pTitle{font-size: 20px; font-weight: 900;}
        #pInput{width: 300px; margin-top: 5px;}
        #sub{font-size: 13px; font-weight: 800; color: rgb(52, 152, 219);  margin-bottom: 30px; }
        

        #partnerJoin>tbody{
            border-top:  rgb(192, 189, 189) solid 0.2px;
            border-bottom: rgb(192, 189, 189) solid 0.2px;
           }

       
        label{font-size: 14px; font-weight: 700;}
        #icon{width: 30px; height: 30px; margin-right: 10px;}
        
        /* 버튼 부분 */
        .buttonArea{height: 80px; text-align: center;}

        #btn1{background-color: rgb(52, 152, 219); color: honeydew;}
        button{width: 200px;}

    </style>
</head>
<body>
    <div class="wrap">
        
        <!-- 파트너등록 -->
        <div id="mypage" align="center">
            <table id="partnerJoin">
                <thead>
                    <tr>
                        <td id="pTitle">파트너명</td>
                    </tr>
                    <tr>
                        <td><input type="text" value="" id="pInput">
                            <div id="sub">프로젝트에 사용될 이름을 입력해주세요</div>
                        </td>
                    </tr>
                    <tr>
                        <td id="pTitle">파트너소개</td>
                    </tr>
                    <tr>
                        <td>
                            <div style="margin-left: 100px; margin-top: 20px;">
                                <img src="city1.PNG" width="100" height="100" class="rounded-circle" >
                            </div>
                            <div style="margin-left: 110px; margin-top: 5px; margin-bottom: 10px;">
                                <label>편집</label>
                                <label style="margin-left: 20px;">삭제</label>
                            </div>
                            
                        </td>
                    </tr>
                
                    <tr>
                        <td>
                            <textarea name="" id="pInput" cols="40" rows="5" style="resize: none;"></textarea>
                            <div id="sub">프로젝트에 사용될 소개글을 입력해주세요</div>
                        </td>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><input type="checkbox" value=""  id="pCheckbox" style="margin-top: 20px;">&nbsp;전체동의</td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" value=""  id="pCheckbox">&nbsp;가치가자이용동의(필수)</td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" value=""  id="pCheckbox" style="margin-bottom: 20px;">&nbsp;만 18세 이상(필수)</td>
                    </tr>
                </tbody>
                <tfoot>
                    <tr>
                        <td>
                            <div style="margin-top: 10px;"><img src="help.png" id="icon" >펀딩프로젝트 헬프센터</div>
                        </td>
                    </tr>    
                    <tr>
                        <th class="buttonArea">
                            <button type="button" class="btn btn-light" id="btn1">프로젝트 시작하기</button>
                        </th>
                    </tr>
                </tfoot>

            </table>
        </div>
        

    </div>
</body>
</html>