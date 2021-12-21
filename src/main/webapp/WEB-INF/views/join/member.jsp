<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/bootstrap.css">
<script src="<%=request.getContextPath()%>/resources/bootstrap.js"></script>
<script
	src="<%=request.getContextPath()%>/resources/jquery-3.6.0.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/MailNumber.js"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script type="text/javascript" src="script.js"></script>
<script type="text/javascript">

//모든 공백 체크 정규식 
var empJ = /\s/g; 
//아이디 정규식 
var idJ = /^[a-z0-9][a-z0-9_\-]{4,19}$/; 
// 비밀번호 정규식 
var pwJ = /^[A-Za-z0-9]{4,12}$/; 
// 이름 정규식 
var nameJ = /^[가-힣]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/; 
// 이메일 검사 정규식 
var mailJ = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i; 

var birthJ = false;
var address = $('#mem_detailaddress'); 
$(document).ready(function() { 
	var address = $('#mem_detailaddress'); 
	
	//아이디 중복확인 	
	$("#mem_id").blur(function() { 
		if($('#mem_id').val()==''){ 
			$('#id_check').text('아이디를 입력하세요.'); 
			$('#id_check').css('color', 'red'); 
			
		} else if(idJ.test($('#mem_id').val())!=true){ 
			$('#id_check').text('4~12자의 영문, 숫자만 사용 가능합니다.'); 
			$('#id_check').css('color', 'red'); 			
		} else if($('#mem_id').val()!=''){ 
			
			var mem_id=$('#mem_id').val(); 
			$.ajax({ 
				async : true, 
						type : 'POST', 
					data : mem_id,//mem_id라는 이름으로 mem_id라는 데이터를 @WebServlet("/idsearch.do")에 보내겠다 
					url : 'idcheck.do', 
					dateType: 'json', 
					contentType: "application/json; charset=UTF-8", 
					success : function(data) { 
						
				if(data.cnt > 0){ 
					$('#id_check').text('중복된 아이디 입니다.'); 
					$('#id_check').css('color', 'red'); 
					$("#usercheck").attr("disabled", true); 
					}else{ 
						if(idJ.test(mem_id)){ 
							$('#id_check').text('사용가능한 아이디 입니다.'); 
							$('#id_check').css('color', 'blue'); 
							$("#usercheck").attr("disabled", false); 
						} 
						else if(mem_id==''){ 
						$('#id_check').text('아이디를 입력해주세요.'); 
							$('#id_check').css('color', 'red'); 
							$("#usercheck").attr("disabled", true); 
						} 
						else{ 
							$('#id_check').text("아이디는 소문자와 숫자 4~12자리만 가능합니다."); 
							$('#id_check').css('color', 'red'); 
							$("#usercheck").attr("disabled", true); 
						} 
					} 
				} 
			});//ajax/// 
			}//else if 
			
	});//blur 
	$('form').on('submit',function(){ 
		var inval_Arr = new Array(8).fill(false); 
		if (idJ.test($('#mem_id').val())) { 
				inval_Arr[0] = true; 
				} else { 
					inval_Arr[0] = false; 
					alert('아이디를 확인하세요.'); 
					return false; 
				} 
		// 비밀번호가 같은 경우 && 비밀번호 정규식 
		if (($('#mem_pw').val() == ($('#mem_pw2').val())) 
				&& pwJ.test($('#mem_pw').val())) { 
				inval_Arr[1] = true; 
				} else { 
					inval_Arr[1] = false; 
					alert('비밀번호를 확인하세요.'); 
					return false; 
				}
		// 이메일 정규식 
		if (mailJ.test($('#mem_email').val())){ 
			console.log(phoneJ.test($('#mem_email').val())); 
			inval_Arr[4] = true; 
			} else { 
				inval_Arr[4] = false; alert('이메일을 확인하세요.'); 
				return false; 
			}
		//주소확인 
		if(address.val() == ''){ 
			inval_Arr[7] = false; 
			alert('주소를 확인하세요.'); 
			return false; 
			}else 
				inval_Arr[7] = true;

		$('#mem_id').blur(function() { 
			if (idJ.test($('#mem_id').val())) { 
				console.log('true'); 
				$('#id_check').text(''); } else { 
					console.log('false'); 
					$('#id_check').text('5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.'); 
					$('#id_check').css('color', 'red'); 
					} 
			}); 
		 	$('#mem_pw').blur(function() { 
		 		if (pwJ.test($('#mem_pw').val())) { 
		 			console.log('true'); 
		 			$('#pw_check').text(''); 
		 			} else { 
		 				console.log('false'); 
		 				$('#pw_check').text('4~12자의 숫자 , 문자로만 사용 가능합니다.'); 
		 				$('#pw_check').css('color', 'red'); 
		 				} 
		 		}); 
		 	
		 	//1~2 패스워드 일치 확인
		 	$('#mem_pw2').blur(function() { 
		 		if ($('#mem_pw').val() != $(this).val()) { 
		 			$('#pw2_check').text('비밀번호가 일치하지 않습니다.'); 
		 			$('#pw2_check').css('color', 'red'); 
		 			} else { 
		 				$('#pw2_check').text(''); 
		 				} 
		 		}); 
		 	//이름에 특수문자 들어가지 않도록 설정 
		 	$("#mem_name").blur(function() { 
		 		if (nameJ.test($(this).val())) { 
		 			console.log(nameJ.test($(this).val())); 
		 			$("#name_check").text(''); 
		 		} else { 
		 			$('#name_check').text('한글 2~4자 이내로 입력하세요. (특수기호, 공백 사용 불가)'); 
		 			$('#name_check').css('color', 'red'); 
		 			} 
		 		}); 
		 	$("#mem_email").blur(function() { 
		 		if (mailJ.test($(this).val())) { 
		 			$("#email_check").text(''); 
		 			} else { 
		 				$('#email_check').text('이메일 양식을 확인해주세요.'); 
		 				$('#email_check').css('color', 'red'); 
		 				} 
		 		});


		
	}
}







</script>

<link href="<c:url value="/resources/membership/member.css" />"
    rel="stylesheet">


</head>
<body onLoad="reFrm.id.focus()">
	<div class="container membership-form">
		<div>
			<img src="<%=request.getContextPath()%>/resources/화살표.png" style="width: 60px; margin-top: 295px;">
		</div>
		<br />
		<br />
		<div class="membership-box">
			<form name="reFrm" method="post" action="memberProc.jsp" id="form">
				<table align="center" border="0" cellspacing="0" cellpadding="5"
					class="membership-table">
					<tr>
						<td align="center" valign="middle">
							<table cellspacing="0" cellpadding="2" align="center" width="600">

								<tr>
									<td width="20%">ID</td>
									<td width="50%"><input name="id" size="20">
										<button type="button" onClick="idCheck(this.form.id.value)"
											class="but">ID 중복확인</button></td>

								</tr>
								<tr>
									<td>Password</td>
									<td><input type="password" name="repwd" size="20"></td>
								</tr>
								<tr>
									<td>Password 확인</td>
									<td><input type="password" name="repwd" size="20"></td>

								</tr>
								<tr>
									<td>Nickname</td>
									<td><input name="name" size="15"></td>

								</tr>
								<tr>
									<td>Mail number</td>
									<td><input name="zipcode" id="zipcode" size="5" readonly>
										<button type="button" onClick="mailnum()" class="but">우편번호
											찾기</button></td>

								</tr>
								<tr>
									<td>Address</td>
									<td><input name="address" size="30" id="address"></td>									
								</tr>
								
								<tr>
									<td>Detailed Address</td>
									<td><input name="address" size="20" id="detail address"></td>	
								</tr>
								<tr>
									<td>Email</td>
									<td><input name="email" size="30"></td>

								</tr>
								<tr>
									<td colspan="3" align="center"><button type="button"
											onclick="idCheck()"
											style="margin-right: 185px; width: 100px; height: 30px;"
											class="but">회원가입</button></td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
			</form>
		</div>

	</div>
</body>
</html>