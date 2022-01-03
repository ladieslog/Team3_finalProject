function addrSearch() {
		new daum.Postcode({
	        oncomplete: function(data) {
	        	// R : 도로명, J : 지번
	          	console.log("data.userSelectedType : " + data.userSelectedType);
	          	console.log("data.roadAddress : " + data.roadAddress);
	          	console.log("data.jibunAddress : " + data.jibunAddress);
	          	console.log("data.zonecode : " + data.zonecode);
	          	var addr = data.roadAddress;
	          	
	          	$("#zipcode").val(data.zonecode);
	          	$("#address").val(addr);
	        }
	    }).open();
	}
	
	var blank_pattern1 = /^\s+|\s+$/g; // 공백만 있을 경우
	var regType1 = /^[A-Za-z0-9+]*$/;
	var reg_email = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/; // 이메일 체크

	function modify(){
		if(document.getElementById("pwd").value == "" || document.getElementById("pwd").value.replace(blank_pattern1, '') == "") {
			alert("패스워드를 입력해 주세요.");
			document.getElementById("pwd").focus();
			return;
		}
		if(document.getElementById("pwd").value.length > 16 || 8 > document.getElementById("pwd").value.length) {
			alert("패스워드는 8~16자 사이로 입력해 주세요.");
			document.getElementById("pwd").focus();
			return;
		}
		if(document.getElementById("pwd").value != document.getElementById("repwd").value) {
			document.getElementById("repwd").focus();
			alert("패스워드가 일치하지 않습니다.");
			return;
		}
		
		if(document.getElementById("nickname").value == "" || document.getElementById("nickname").value.replace(blank_pattern1, '') == "") {
			alert("닉네임을 입력해 주세요.");
			document.getElementById("nickname").focus();
			return;
		}
		if(document.getElementById("nickname").value.length > 12 || 2 > document.getElementById("nickname").value.length) {
			alert("닉네임은 2~12자 사이로 입력해 주세요.");
			document.getElementById("nickname").focus();
			return;
		}
		if(document.getElementById("zipcode").value == "" || document.getElementById("zipcode").value.replace(blank_pattern1, '') == "") {
			alert("주소를 입력해 주세요.");
			return;
		}
		
		if(document.getElementById("detailaddress").value == "" || document.getElementById("detailaddress").value.replace(blank_pattern1, '') == "") {
			alert("상세주소를 입력해 주세요.");
			document.getElementById("detailaddress").focus();
			return;
		}
		if(document.getElementById("detailaddress").value.length > 30) {
			alert("상세주소는 30자 이내로 입력해 주세요.");
			document.getElementById("detailaddress").focus();
			return;
		}
		
		if(document.getElementById("email").value == "" || document.getElementById("email").value.replace(blank_pattern1, '') == "") {
			alert("이메일을 입력해 주세요.");
			document.getElementById("email").focus();
			return;
		}
		
		if(!(reg_email.test(document.getElementById("email").value))) {
			alert("이메일 형식에 맞게 입력해 주세요.");
			document.getElementById("email").focus();
			return;
		}
		
		
		if(document.getElementById("email").value.length > 30 || 10 > document.getElementById("email").value.length) {
			alert("이메일은 10~30자 사이로 입력해 주세요.");
			document.getElementById("email").focus();
			return;
		}
		
		document.getElementById("mod").submit()
	}
	
	// 모달창에서 X버튼 클릭시 발생하는 메소드
	function modelExit() {
		$("#email-model").css('display', 'none');
		clearInterval(tid);
		certifiedExit();
		document.getElementById("time").innerHTML = "";
	}

	var SetTime = 180;   
    function msg_time() {   // 1초씩 카운트 
        m = Math.floor(SetTime / 60) + " : " + (SetTime % 60); // 남은 시간 계산         
        document.getElementById("time").innerHTML = m;     // div 영역에 보여줌                  
        SetTime--;                  // 1초씩 감소
        if (SetTime < 0) {          // 시간이 종료 되었으면..        
            clearInterval(tid);     // 타이머 해제

        }       
    }
	function timeChange() {
		SetTime = 180;
	}
	function TimerStart() {
		timeChange();
		tid=setInterval('msg_time()',1000);
	}