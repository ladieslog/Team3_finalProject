<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="<%=request.getContextPath() %>"/>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>diaryView</title>
<style type="text/css">
	.writewrap{ margin:auto; height: 650px;  background-color: #DEF4F9; color:black;}
	.img{ height: 90px; width: 190px;}
	.div{ text-align: center; display: flex; justify-content: center; align-items: center;}
	.text{font-size: 15px; border-radius: 5px; border-color: white;}
	.table{ margin-top: 60px;}
	.te1{ width:200px; border-radius: 5px; border-color: white;}
	.te2{ width:200px; border-radius: 5px; border-color: white;}
	.te3{ width:200px; border-radius: 5px; border-color: white;}
	.te4{ width:200px; border-radius: 5px; border-color: white;}
	
	.td1{ width: 200px; background-color: #DEF4F9;}
	.submit{ width:80px; height:20px; }
	.sub{ background-color: #DEF4F9 ; font-size: 15px; color:black; border-radius: 5px; border-color: #DEF4F9; font-family: Georgia; margin-bottom:70px; }
	.b{ font-family: Georgia; font-size:20px;}
	
	.divsize{ width: 600px; height: 500px; background-color: white; display: flex; justify-content: center; align-items: center; border-radius: 10px;}
	.imgsize{ width: 550px; height: 400px; margin:auto; background-color: #DEF4F9; display: flex; justify-content: center; align-items: center;}
	.siz{ width:550px; height: 400px; }
	.textbox{ width:550px; height: 60px; margin:auto; background-color:#DEF4F9; display: flex; justify-content: center; align-items: center;}
	.box{ width: 520px; height:30px; border-radius: 5px; border-color: white; }
	td{ height: 100px; }
	.td{ width: 30px; height: 30px; }
</style>
<script src="${contextPath }/resources/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="${contextPath }/resources/diaryscript/diaryViewScript.js"></script>

</head>
<body style="overflow-x: hidden ">

	<jsp:include page="../default/header.jsp"/>
<c:set var="dto" value="${diary}"></c:set>	
<c:set var="count" value="1"/>

	<div class="writewrap">
	<div class="div">
	
		<table class="table" >
			<tr>
				<td class="b">Title</td> <td><input type="text" class="te1" value="${dto.title}" readonly></td>
				<td class="td" rowspan="5"></td>
				<td class="td" rowspan="5"></td>
				<td rowspan="5" colspan="1">
				<input id="check" type="hidden" value="0">
				<div class="divsize" id="imgtext" style="display:none;">
				<div >
				<div class="imgsize">
				<img class="siz" id="view1" src="${contextPath }/resources/diaryimg/diary_plus.png">
				</div>
				<div class="textbox">
				<input type="text" id="txtview1" class="box" >
				</div>
				</div>
				</div>
				
				<div class="divsize" id="textarea" style="display: none;">
				<div style="width: 550px; height: 460px;">
				<div class="textbox" style="width: 550px; height: 460px;">
				<textarea id="textView1"style="height: 431px; width: 519px; resize: none;"class="box" readonly></textarea>
				</div>
				</div>
				</div>
				
				<c:choose>
					<c:when test="${dto.image1!=null }">
						<script type="text/javascript">
							document.getElementById("imgtext").style.display="flex";
							document.getElementById("check").value="2";		
							$('#view1').attr('src', '<spring:url value='/image/${dto.image1}'/>' )
							document.getElementById("txtview1").value="${dto.coment1}"
						</script>					
					</c:when>
					<c:otherwise>
						<script type="text/javascript">
							document.getElementById("textarea").style.display="flex";
							document.getElementById("check").value="1";
							document.getElementById("textView1").value="${dto.coment1}"
						</script>
					</c:otherwise>
				</c:choose>
				
				</td>
				<td class="td"></td>
				<td class="td"></td>
				<td class="td1">
				<c:choose>
					<c:when test="${dto.image1==null }">
						<img class="img" id="preView1" onclick="imgView1()" src="${contextPath}/resources/diaryimg/diary_plus.png">
					</c:when>
					<c:otherwise>
						<img class="img" id="preView1" onclick="imgView1()" src="<spring:url value='/image/${dto.image1}'/>">
					</c:otherwise>
				</c:choose>
				</td>
			</tr>
				
			<tr>
				<td class="b">Place</td> <td style="display: table-caption">
				<input style="margin-top:15px;" type="text" value="${dto.location1}" class="te2" readonly>
				<input style="margin-top:10px;" type="text" value="${dto.location2}" class="te2" readonly>
				<input style="margin-top:10px;" type="text" value="${dto.location3}" class="te2" readonly>
				</td>
				<td class="td"></td>
				<td class="td"></td>
				<td class="td1">
				<c:choose>
					<c:when test="${dto.image2!=null }">
						<img class="img" id="preView2" onclick="imgView2()" src="<spring:url value='/image/${dto.image2}'/>">
					</c:when>
					<c:when test="${dto.coment2!=null }">
						<img class="img" id="preView2" onclick="imgView2()" src="${contextPath }/resources/diaryimg/diary_plus.png">
					</c:when>
					<c:otherwise>
						
					</c:otherwise>
				</c:choose>
				</td>
			</tr>
				
			<tr>
				<td class="b">Who</td> <td>
				<c:if test="${dto.person == 1 }">
					<input type="text" value="혼자" class="te3" readonly>
				</c:if>
				<c:if test="${dto.person == 2 }">
					<input type="text" value="가족" class="te3" readonly>
				</c:if>
				<c:if test="${dto.person == 3 }">
					<input type="text" value="친구" class="te3" readonly>
				</c:if>
				<c:if test="${dto.person == 4 }">
					<input type="text" value="연인" class="te3" readonly>
				</c:if>
				</td>
				<td class="td"></td>
				<td class="td"></td>
				<td class="td1">
				<c:choose>
					<c:when test="${dto.image3!=null }">
						<img class="img" id="preView3" onclick="imgView3()" src="<spring:url value='/image/${dto.image3}'/>">
					</c:when>
					<c:when test="${dto.coment3!=null }">
						<img class="img" id="preView3" onclick="imgView3()" src="${contextPath }/resources/diaryimg/diary_plus.png">
					</c:when>
					<c:otherwise>
						
					</c:otherwise>
				</c:choose>
				</td>
			</tr>
			
			<tr>
				<td class="b">Date</td> <td><input type="text" value="${dto.indatestr} ~ ${dto.outdatestr}" class="te4" readonly></td>
				<td class="td"></td>
				<td class="td"></td>
				<td class="td1">
				<c:choose>
					<c:when test="${dto.image4!=null }">
						<img class="img" id="preView4" onclick="imgView4()" src="<spring:url value='/image/${dto.image4}'/>">
					</c:when>
					<c:when test="${dto.coment4!=null }">
						<img class="img" id="preView4" onclick="imgView4()" src="${contextPath }/resources/diaryimg/diary_plus.png">
					</c:when>
					<c:otherwise>
						
					</c:otherwise>
				</c:choose>
				</td>
			</tr>
			
			<tr>
				<td class="b">Writing time</td> <td><input type="text" value="${dto.time}" class="te2" readonly></td>
				<td class="td"></td>
				<td class="td"></td>
				<td class="td1">
				<c:choose>
					<c:when test="${dto.image5!=null }">
						<img class="img" id="preView5" onclick="imgView5()" src="<spring:url value='/image/${dto.image5}'/>">
					</c:when>
					<c:when test="${dto.coment5!=null }">
						<img class="img" id="preView5" onclick="imgView5()" src="${contextPath }/resources/diaryimg/diary_plus.png">
					</c:when>
					<c:otherwise>
						
					</c:otherwise>
				</c:choose>
				</td>
			</tr>
			
			<tr>
				<td></td>
				<td></td>
				<td class="td"></td>
				<td class="td"></td>
				<td></td>
				<td></td>
				<td></td>
			<form action="diaryDelete" method="post" id="form">	
				<td class="submit"><input type="button" value="Modify" onclick="location.href='diaryModify?num=${dto.num}'" class="sub">
	    		<input type="button" value="Delete" onclick="allDel()" class="sub">
	    		<input type="hidden" name="deleteCheck" id="deleteCheck" value="" class="sub">
	    		<input type="hidden" name="deleteNum"  value="${dto.num}" class="sub">	    	
				<input type="button" value="Cancel" onclick="history.back()" class="sub"></td>
				</form>
			</tr>		
		</table>
	
	</div>
	
	<!-- 상호 : (주)에이네시아 본사주소 : 전라북도 전주혁신도시 덕진구 중동로 104-10 5층 501호,502호 서울사무소 주소 : 서울특별시 종로구 사직로8길 24 경희궁의아침 2단지 1121호 TEL : 063-212-9076(대표번호) 063-212-9077(고객센터) 사업자 등록번호 : 528-88-01145 -->
	</div>
	
	<jsp:include page="../default/footer.jsp"/>
	<script type="text/javascript">
	function imgView1(){
		if($("#preView1").attr('src') == "${contextPath }/resources/diaryimg/diary_plus.png"){
			document.getElementById("imgtext").style.display="none"
			document.getElementById("textarea").style.display="flex"
			document.getElementById("textView1").value="${dto.coment1}"
		}else{
			document.getElementById("imgtext").style.display="flex"
			document.getElementById("textarea").style.display="none"
				
			$('#view1').attr('src', "<spring:url value='/image/${dto.image1}'/>")
			document.getElementById("txtview1").value="${dto.coment1}"
		}
	}
	
	function imgView2(){
		if($("#preView2").attr('src') == "${contextPath }/resources/diaryimg/diary_plus.png"){
			document.getElementById("imgtext").style.display="none"
			document.getElementById("textarea").style.display="flex"
			document.getElementById("textView1").value="${dto.coment2}"
			
		}else{
			document.getElementById("imgtext").style.display="flex"
			document.getElementById("textarea").style.display="none"
				
			$('#view1').attr('src', "<spring:url value='/image/${dto.image2}'/>")
			document.getElementById("txtview1").value="${dto.coment2}"

		}
	}
	
	function imgView3(){
		if($("#preView3").attr('src') == "${contextPath }/resources/diaryimg/diary_plus.png"){
			document.getElementById("imgtext").style.display="none"
			document.getElementById("textarea").style.display="flex"
			document.getElementById("textView1").value="${dto.coment3}"
			
		}else{
			document.getElementById("imgtext").style.display="flex"
			document.getElementById("textarea").style.display="none"
				
			$('#view1').attr('src', "<spring:url value='/image/${dto.image3}'/>")
			document.getElementById("txtview1").value="${dto.coment3}"

		}
	}
	
	function imgView4(){
		if($("#preView4").attr('src') == "${contextPath }/resources/diaryimg/diary_plus.png"){
			document.getElementById("imgtext").style.display="none"
			document.getElementById("textarea").style.display="flex"
			document.getElementById("textView1").value="${dto.coment4}"
			
		}else{
			document.getElementById("imgtext").style.display="flex"
			document.getElementById("textarea").style.display="none"
				
			$('#view1').attr('src', "<spring:url value='/image/${dto.image4}'/>")
			document.getElementById("txtview1").value="${dto.coment4}"

		}
	}
	
	function imgView5(){
		if($("#preView5").attr('src') == "${contextPath }/resources/diaryimg/diary_plus.png"){
			document.getElementById("imgtext").style.display="none"
			document.getElementById("textarea").style.display="flex"
			document.getElementById("textView1").value="${dto.coment5}"
			
		}else{
			document.getElementById("imgtext").style.display="flex"
			document.getElementById("textarea").style.display="none"
				
			$('#view1').attr('src', "<spring:url value='/image/${dto.image5}'/>")
			document.getElementById("txtview1").value="${dto.coment5}"

		}
	}
	
	function allDel(){
		if(confirm('게시글을 삭제하시겠습니까?')){
			document.getElementById("deleteCheck").value = "1"
			document.getElementById("form").submit()
		}
		
		
	}
	
</script>
</body>

</html>