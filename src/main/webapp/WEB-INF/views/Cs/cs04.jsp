<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="<%=request.getContextPath() %>"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${contextPath}/resources/bootstrap.css">
<script src="${contextPath }/resources/jquery-3.6.0.min.js"></script>
<script src="${contextPath }/resources/bootstrap.js"></script>
<style type ="text/css">
.in1{ background-color: gray; padding: 120px 0 250px 0}
.in2{ display: flex; justify-content: center;  }
.in3{justify-content: center;}
.in4{text-align: center; }

.n1{font-size: 15px; border-radius: 5px; border-color: white;}
.n2{ width:80px; height:20px; }
.n3{display: flex; justify-content: center; align-items: center; margin-top: 20px;}


.ch{background-color: ; width :1000px; height:70px; }
.chl{background-color: ; width :1000px; height:100px; }
.che{background-color: ; width :1000px; height:50px; }

.chg{background-color: ; width :1000px; height:500px;}
.cha{background-color: ; width :1000px; height:50px; text-align: right;  }
.chn{background-color: ; width :1000px; height:50px; text-align: center; }

.b{ font-family: Georgia; font-size:24px;}
.lb{ font-size: 40px; }
.nal{ width :1500px; height: 720px; background-color: white;}


</style>
</head>
<body>
<div>
	<jsp:include page="../default/header.jsp"/>
		
	<div class="in1">		
		<div class="in2">			
		<div class="nal">
			<div class="in3">
				<div class="in4">
					<b class="lb">Q&A</b><br><br><br>
				</div>	
				<input type="text" name="" class="chg"><br>
			</div>
		
		<!--  
			<div class="in4">
						 
				<input type="text" name="" placeholder="제목" class="che"><br>
				<input type="text" name="" placeholder="작성자 시간" class="che"><br>				
				<input type="text" name="" placeholder="내용" class="ch"><br><hr>
			</div> 
			<div class="in4">
				<input type="text" name="" placeholder="제목" class="che"><br>			
				<input type="text" name="" placeholder="작성자 시간" class="che"><br>
				<input type="text" name="" placeholder="내용" class="chl"><br><hr>
			</div>
			-->
			<div class="in3">
				<input type="text" name="" placeholder="답변" class="cha"><br>	
				<button name="" class="chn">제출</button>
			</div>
				
			
		</table>	
		</div>
		</div>

	</div>
	

	<jsp:include page="../Cs/cs_back.jsp"/>
	<jsp:include page="../default/footer.jsp"/>
</div>
	
	
	


</body>
</html>