/* 유효성 검사 통과유무 변수 */
 let idCheck = false;            // 아이디
 let idckCheck = false;            // 아이디 중복 검사
 let pwCheck = false;            // 비번
 let pwckCheck = false;            // 비번 확인
 let pwckcorCheck = false;        // 비번 확인 일치 확인
 let nameCheck = false;            // 이름
 let mailCheck = false;            // 이메일
 let mailnumCheck = false;        // 이메일 인증번호 확인
 let addressCheck = false         // 주소

var index = {
		init: function(){
			$("#btn-save").on("click", ()=>{ // this를 바인딩하기위해 화살표함수 사용
				this.save();
			});
			$("#btn-update").on("click", ()=>{ // this를 바인딩하기위해 화살표함수 사용
				this.update();
			});
			$("#btn-fwupdate").on("click", ()=>{ // this를 바인딩하기위해 화살표함수 사용
				this.fwupdate();
			});
			
		},
	
	
	 save: function(){
		
		/* 입력값 변수 */
        var userid = $('#username').val();                 // id 입력란
        var pw = $('#password').val();                // 비밀번호 입력란
        var name = $('#usernickname').val();            // 이름 입력란
        var mail = $('#email').val();            // 이메일 입력란
        var addr = $('#useradd3').val();        // 주소 입력란
        
       
        /* 아이디 유효성검사 */
        if(userid == ""){
            $('.final_id_ck').css('display','block');
            idCheck = false;
        }else{
            $('.final_id_ck').css('display', 'none');
            idCheck = true;
        }
 		
        /* 비밀번호 유효성 검사 */
        if(pw == ""){
            $('.final_pw_ck').css('display','block');
            pwCheck = false;
        }else{
            $('.final_pw_ck').css('display', 'none');
            pwCheck = true;
        }
 		

        /* 이름 유효성 검사 */
        if(name == ""){
            $('.final_name_ck').css('display','block');
            nameCheck = false;
        }else{
            $('.final_name_ck').css('display', 'none');
            nameCheck = true;
        }
        
        /* 이메일 유효성 검사 */
        if(mail == ""){
            $('.final_mail_ck').css('display','block');
            mailCheck = false;
        }else{
            $('.final_mail_ck').css('display', 'none');
            mailCheck = true;
        }
        
        /* 주소 유효성 검사 */
        if(addr == ""){
            $('.final_addr_ck').css('display','block');
            addressCheck = false;
        }else{
            $('.final_addr_ck').css('display', 'none');
            addressCheck = true;
        }
		
		console.log(idCheck);	
		console.log(pwCheck);	
		console.log(nameCheck);	
		console.log(mailCheck);	
		console.log(addressCheck);	
		
		let data ={	
			username: $("#username").val(),
			password: $("#password").val(),
			usernickname: $("#usernickname").val(),
			email: $("#email").val(),
			address: $("#useradd1").val()+$("#useradd2").val()+$("#useradd3").val()			
		}
		
		if(idCheck&&pwCheck&&nameCheck&&mailCheck&&mailnumCheck&&addressCheck ){
 
        
		$.ajax({
			type:"POST",
			url:"/auth/joinProc",
			data: JSON.stringify(data),// 위의 let data는 자바스크립트이므로 자바가 인식가능하게 바꿔주는것
									  // http body 데이터로 넘어온다.
			contentType:"application/json;charset=utf-8", //body데이터가 어떤 타입인지(MIME)
			dataType:"json" //응답받은 json이 문자열이고 제이슨타입이라면, 자바스크립트오브젝트로 변경해줘라. 		
		
		}).done(function(resp){
			
			if(resp.status ===500){
				alert("회원가입에 실패하였습니다.")
				}else{
				alert("회원가입이 완료되었습니다."); 
				console.log(resp);
				location.href="/";
				}
				
			}).fail(function(error){
				alert(JSON.stringify(error));
			});
		  }else{
			alert("빈 항목이 존재합니다.");
			console.log("덜 입력함");
		  }		
		},
	
	update: function(){
		
		let data ={	
			id: $("#id").val(),
			username: $("#username").val(),
			password: $("#password").val(),
			email: $("#email").val()	
		}
		$.ajax({
			type:"PUT",
			url:"/user/update",
			data: JSON.stringify(data),// 위의 let data는 자바스크립트이므로 자바가 인식가능하게 바꿔주는것
									  // http body 데이터로 넘어온다.
			contentType:"application/json;charset=utf-8", //body데이터가 어떤 타입인지(MIME)
			dataType:"json" //응답받은 json이 문자열이고 제이슨타입이라면, 자바스크립트오브젝트로 변경해줘라. 		
		
		}).done(function(resp){
			alert("회원수정 완료되었습니다."); 
			console.log(resp);
			location.href="/";
			
		}).fail(function(error){
			alert(JSON.stringify(error));
		});
	},		
}

index.init();



//아이디 중복검사
$('#username').on("propertychange change keyup paste input", function(){
		
		var username = $('#username').val();			// .id_input에 입력되는 값
		var data = {username : username}
		
		$.ajax({
		type : "post",
		url : "/dummy/member/memberIdChk",
		data : data,
		success : function(result){
			 //console.log("성공 여부" + result);
			 if(result == 'success'){
				$('.id_input_re_1').css("display","inline-block");
				$('.id_input_re_2').css("display", "none");	
				idckCheck = true;			
			} else if(result == 'fail') {
				$('.id_input_re_2').css("display","inline-block");
				$('.id_input_re_1').css("display", "none");		
				idckCheck = false;		
			} else{
				$('.id_input_re_1').css("display","none");
				$('.id_input_re_2').css("display", "none");
			}
		}// success 종료
	});

});// function 종료

//유저닉네임 중복검사
$('#usernickname').on("propertychange change keyup paste input", function(){
		
		var usernickname = $('#usernickname').val();			// .id_input에 입력되는 값
		var data = {usernickname : usernickname}
		
		$.ajax({
		type : "post",
		url : "/dummy/user/usernicknameChk",
		data : data,
		success : function(result){
			 //console.log("성공 여부" + result);
			 if(result == 'success'){
				$('.nick_input_re_1').css("display","inline-block");
				$('.nick_input_re_2').css("display", "none");	
				idckCheck = true;			
			} else if(result == 'fail') {
				$('.nick_input_re_2').css("display","inline-block");
				$('.nick_input_re_1').css("display", "none");		
				idckCheck = false;		
			} else{
				$('.nick_input_re_1').css("display","none");
				$('.nick_input_re_2').css("display", "none");
			}
		}// success 종료
	});

});// function 종료

//이메일전송 인증번호 저장위한 코드
var code = ""; 

/* 인증번호 이메일 전송 */
$(".mail_check_button").click(function() {// 메일 입력 유효성 검사
		var email = $(".email-control").val(); //사용자의 이메일 입력값. 
		var cehckBox = $(".mail_check_input");        // 인증번호 입력란
   	    var boxWrap = $(".mail_check_input_box");    // 인증번호 입력란 박스
   	    var warnMsg = $(".mail_input_box_warn");    // 이메일 입력 경고글
		
		/* 이메일 형식 유효성 검사 */
	    if(mailFormCheck(email)){
	        warnMsg.html("이메일이 전송 되었습니다. 이메일을 확인해주세요.");
	        warnMsg.css("display", "inline-block");
	    } else {
	        warnMsg.html("올바르지 못한 이메일 형식입니다.");
	        warnMsg.css("display", "inline-block");
	        return false;
	    }
		
			$.ajax({
				type:"GET",
       		    url:"/dummy/mailCheck?email=" + email,
				success:function(data){
					alert("인증번호가 발송되었습니다.");
            		console.log("data : " + data);
            		cehckBox.attr("disabled",false);
            		boxWrap.attr("id", "mail_check_input_box_true");
            		code = data;
       			}
		});		
});

/* 인증번호 비교 */
$(".mail_check_input").blur(function(){

	
    var inputCode = $(".mail_check_input").val();        // 입력코드    
    var checkResult = $("#mail_check_input_box_warn");    // 비교 결과     
    
    if(inputCode == code){                            // 일치할 경우
        checkResult.html("인증번호가 일치합니다.");
        checkResult.attr("class", "correct");   
        mailnumCheck = true;     // 일치할 경우
    } else {                                            // 일치하지 않을 경우
        checkResult.html("인증번호를 다시 확인해주세요.");
        checkResult.attr("class", "incorrect");
        mailnumCheck = false;    // 일치하지 않을 경우
    }    
    
});


/* 다음 주소 연동 */
function execution_daum_address(){
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
	                 	// 주소변수 문자열과 참고항목 문자열 합치기
	                    addr += extraAddr;
                
	                } else {//추가 항목 필드에 아무것도 입력되지 않게 하기 위한 코드입니다. 우린 추가항목필드없어서 제거
	                	addr += ' ';
	                }

	             // 추가해야할 코드
	                $(".address_input_1").val(data.zonecode);
	                //$("[name=memberAddr1]").val(data.zonecode);    // 대체가능
	                $(".address_input_2").val(addr);
	                //$("[name=memberAddr2]").val(addr);            // 대체가능
	             	// 상세주소 입력란 disabled 속성 변경 및 커서를 상세주소 필드로 이동한다.
	                $(".address_input_3").attr("readonly",false);
	                $(".address_input_3").focus();
	            
        }
    }).open();   
}

/* 유저 iD찾기 인증번호 이메일 전송 */
$("#btn-id-find").click(function() {// 메일 입력 유효성 검사
		let code = ""; 
		let email = $(".email-control").val(); //사용자의 이메일 입력값. 
   	    let warnMsg = $(".mail_input_box_warn");    // 이메일 입력 경고글
		
		/* 이메일 형식 유효성 검사 */
	    if(mailFormCheck(email)){
	        warnMsg.html("이메일이 전송 되었습니다. 이메일을 확인해주세요.");
	        warnMsg.css("display", "inline-block");
	    } else {
	        warnMsg.html("올바르지 못한 이메일 형식입니다.");
	        warnMsg.css("display", "inline-block");
	        return false;
	    }
		
			$.ajax({
				type:"GET",
       		    url:"/auth/mailCheck?email=" + email,
				success:function(data){
				alert("찾고있어여 ㄱㄷ");
				code=data;
				console.log(data);
				console.log(email);
            	console.log("data : " + data);
				if(data == 'success'){
				alert("회원님의 ID가 입력하신 메일로 전송되었습니다.")		
				} else{
					alert("해당 이메일로 가입한 유저가 존재하지 않습니다.")
				}

       		  }
		});		
});

/* 유저 pw찾기 인증번호 이메일 전송 */
$("#btn-fW-find").click(function() {// 메일 입력 유효성 검사
		let username= $(".username-control").val();
		let email=  $(".email-control").val();
		let cehckBox = $(".FW_mail_check_input");        // 인증번호 입력란
   	    let boxWrap = $(".mail_check_input_box");    // 인증번호 입력란 박스
   	    let warnMsg = $(".mail_input_box_warn");    // 이메일 입력 경고글
		
		/* 이메일 형식 유효성 검사 */
	    if(mailFormCheck(email)){
	        warnMsg.html("이메일이 전송 되었습니다. 이메일을 확인해주세요.");
	        warnMsg.css("display", "inline-block");
	    } else {
	        warnMsg.html("올바르지 못한 이메일 형식입니다.");
	        warnMsg.css("display", "inline-block");
	        return false;
	    }
			$.ajax({
				type:"POST",
       		    url:"/auth/mailCheck/findPw?username="+username+"&email="+email,
				success:function(data){
					code=data;
					console.log(code);
					console.log(data);
					console.log(email);
	            	console.log("data : " + data);
					if(data == 'fail' ){
					    alert("해당 이메일로 가입한 유저가 존재하지 않습니다.")		
					} else{						
						alert("인증번호가 전송 되었습니다. 이메일을 확인해주세요.")	
					}
					cehckBox.attr("disabled",false);
            		boxWrap.attr("id", "mail_check_input_box_true");
            		            		
       		}
		});		
});
