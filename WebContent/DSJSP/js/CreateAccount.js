$(function functionName() {
  $('#input2').hide();
  $('#btnImg').click(function () {
    $('#input2').slideToggle(500);
    $(this).css({
      'transform':'rotate(2turn)',
      'transition':'1s'
    });
  })

  //
  $('#create').hover(function () {
    $('#create').css({
      'background-color':'#b79494',
      'transition':'0.5s'
    });
  }, function () {
    $('#create').css({
      'background-color':'#dacaca',
      'transition':'0.5s'
    });
  })

  //잘못된 데이터 입력시 input css변경
  function wrongInput(inputBar) {
  $(inputBar).css({
		"border-bottom":" solid 4px #ff6a6a",
		"transition": "0.1s",
	});
  };

  var inputBar;
  
  
  
  //이메일 확인
  function validateEmail(sEmail) {
	  var filter=/^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
	  if (filter.test(sEmail)){
		  return false;
	  }else {
		  return true;
	  }
  };
  
  $('input[name="email"]').focusout(function() {
	  var email = $(this).val();
	  inputBar = $(this);
	  var outMassage;
	$.ajax({
		url:"emailDuplicateCheck.jsp",
		type:"post",
		data: {id:email},
		error: function() {
			alert("에러");
		},
		success : function(a) {
			$('#dupl').html(a);
			var result = $('input[name="email_token"]').val();
			if(result=="true"){
				wrongInput(inputBar);
				outMassage = "중복된 이메일입니다."
				$(inputBar).parent().children('div').html(outMassage);
				return;
			}else if(result=="false"){
				if(email==""){
					wrongInput(inputBar);
					outMassage = "이메일을 입력해주세요."
					$(inputBar).parent().children('div').html(outMassage);
					return;
				}else if(validateEmail(email)){
					wrongInput(inputBar);
					outMassage = "이메일 형식을 확인해 주세요."
					$(inputBar).parent().children('div').html(outMassage);
					return;
				}else{
					$(inputBar).css({
						"border":"none",
						"border-bottom":" solid 4px rgb(100 197 165)",
						"transition": "0.1s"
					});
					$(inputBar).parent().children('div').html("");
				}	
			}
			
		}
	})
  });
  
  
  //닉네임 확인
  $('input[name="nickname"]').focusout(function() {
	var nick = $(this).val();
	inputBar = $(this);
	var check = /[0-9]|[a-z]|[A-Z]|[가-힣]/;
	
	if(nick==""){
		wrongInput(inputBar);
		$(inputBar).parent().children('div').html("닉네임은 필수입력사항입니다.");
		return;
	}else if(nick.length<2||nick.length>10){
		wrongInput(inputBar);
		$(inputBar).parent().children('div').html("닉네임은 2자~10자 이내로 가능합니다.");
		return;
	}else if(check.test(nick)){
		$(inputBar).css({
			"border":"none",
			"border-bottom":" solid 4px rgb(100 197 165)",
			"transition": "0.1s"
		});
		$(inputBar).parent().children('div').html("");
		return;
	}else {
		wrongInput(inputBar);
		$(inputBar).parent().children('div').html("한글+영어+숫자로 2자~10자 이내만 가능합니다.");
		return;
	}
});
  
  //비밀번호 확인
  	$('input[name="pwd1"]').focusout(function() {
		var pwd1 = $(this).val();
		inputBar = $(this);
		var check = /^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{8,20}$/;
		
		if(check.test(pwd1)){
			$(inputBar).css({
				"border":"none",
				"border-bottom":" solid 4px rgb(100 197 165)",
				"transition": "0.1s"
			});
			$(inputBar).parent().children('div').html("");
		}else {
			wrongInput(inputBar);
			$(inputBar).parent().children('div').html("8~20자, 영어+숫자 혹은 특수문자");
			return;
		}
	})
	
	$('input[name="pwd2"]').focusout(function() {
		var pwd1 = $('input[name="pwd1"]').val();
		var pwd2 = $(this).val();
		inputBar = $(this);
		
		if(pwd1==pwd2){
			$(inputBar).css({
				"border":"none",
				"border-bottom":" solid 4px rgb(100 197 165)",
				"transition": "0.1s"
			});
			$(inputBar).parent().children('div').html("");
		}else {
			wrongInput(inputBar);
			$(inputBar).parent().children('div').html("비밀번호가 일치하지 않습니다.");
			return;
		}
	});
  	
  	
  	$('input[name="name"]').focusout(function() {
  		
		var name = $(this).val();
		inputBar = $(this);
		var check = /^[가-힣]{2,10}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/;
		
		if(name==""){
			wrongInput(inputBar);
			$(inputBar).parent().children('div').html("이름은 필수입력사항입니다.");
			return;
		}else if(check.test(name)){
			$(inputBar).css({
				"border":"none",
				"border-bottom":" solid 4px rgb(100 197 165)",
				"transition": "0.1s"
			});
			$(inputBar).parent().children('div').html("");
		}else {
			wrongInput(inputBar);
			$(inputBar).parent().children('div').html("이름은 한글2~10자 또는 영어 이름,성 각 10자이내여야합니다.");
			return;
		}
	});
  
  	
  	$('input[name="birth"]').focusout(function() {
		var birth = $(this).val();
		var inputBar = $(this);
		var check = /^(19[0-9][0-9]|20\d{2})-(0[0-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])$/;
		
		
		if(check.test(birth)){
			$(inputBar).css({
				"border":"none",
				"border-bottom":" solid 4px rgb(100 197 165)",
				"transition": "0.1s"
			});
			$(inputBar).parent().children('div').html("");
		}else {
			wrongInput(inputBar);
			$(inputBar).parent().children('div').html("생년월일을 확인해주세요.");
			return;
		}
	});
  	  		
  	//다음 주소 API
	$('#find_add').click(function() {
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
            } else {}

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('postal_code').value = data.zonecode;
            document.getElementById("address_input").value = addr +" "+ extraAddr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("address_input2").focus();
        }
		}).open();
	});

	//주소 검증
	
	
	//연락처 검증
	
	
	//인증 메일 발송 (세션에 값 생성 후 alert에 띄워서 보여주기)
	// #ff6a6a 빨간줄
	$('#verificationBtn').click(function() {
		var inp = $('input');
		for(var i = 0 ; i<12 ; i++){
			var check = $(inp[i]).css('border-bottom');
			if(check.indexOf("rgb(255, 106, 106)")!=-1){
				alert("입력을 확인해 주세요");
				return;
			}
		}
		//ajax로 세션에 값 등록하고 해당 값 입력하게함
		
	});
	
	
	$('#create').click(function() {
		var inp = $('input');
		for(var i = 0 ; i<12 ; i++){
			var check = $(inp[i]).css('border-bottom');
			if(check.indexOf("rgb(255, 106, 106)")!=-1){
				alert("입력을 확인해 주세요");
				return false;
			}
		}
		
		
	});

	function today() {
		return 
	}
})
