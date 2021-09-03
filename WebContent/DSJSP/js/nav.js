$(document).ready(function () {
	
	//회사 선택
	$('.myCo').change(function() {
		var coIndex = $(this).val();
		$.ajax({
			url:"MyCoChange.do",
			type:"post",
			data: {select:coIndex},
			error: function() {
			alert("에러");
			},
			success: function(d) {
				document.location.href="nav.jsp?select="+coIndex;
			}
		})
	});



  //상세메뉴 숨기기
  var nav_m = $('.nav_btn_slide');
  $(nav_m).hide();
  $(nav_m).animate({top:'-=18px'},0,'linear');


  $('.nav_btn').click(function () {
    $(this).next('div').slideToggle(100);
  })
  // 메뉴버튼 효과
  $('.nav_btn').mouseenter(function () {
    var img = $(this).children('img');
    var imgSrc = $(img).attr('src');
    var imgChg = imgSrc.split('.p');
    $(img).attr('src',imgChg[0]+'_on.png');
    $(this).children('span').css('color','white');
  })
  $('.nav_btn').mouseleave(function () {
    var img = $(this).children('img');
    var imgSrc = $(img).attr('src');
    var imgChg = imgSrc.split('_o');
    $(img).attr('src',imgChg[0]+'.png');
    $(this).children('span').css('color','#211d1d');
  })
  
  //헤더 네비 아이콘 효과
  $('.header_nav_icon').hover(function () {
	$(this).css({
		'background-color':'#f1f1f2',
		'color':'#da2929',
	});
}, function() {
	$(this).css({
		'background-color':'#6f6ddf',
		'color':'white',
	});
})


  //좌측메뉴 슬라이드 효과
  $('#nav_slider').click(function () {
    if($('nav').offset().left===-200){
      $('nav').animate({left:'+=200px'},100,'linear');
      $('.wrap').css({'padding-left':'200px','transition':'0.2s'});
    }else {$('nav').animate({left:'-=200px'},200,'linear');
    $('.wrap').css({'padding-left':'0px','transition':'0.2s'});
    }
  });
  
  //상세메뉴 효과
  var menu = $('.nav_btn_slide').find('li');
  $(menu).hover(function () {
    $(this).css({'font-weight':'bold'})
    $(this).css({'color':'#a4b475'});
  }, function () {
    $(this).css({'font-weight':'normal'})
    $(this).css({'color':'black'});
  });
  

  
  //아이디 표시부분 시간
  setInterval(function () {
    var Now = new Date();
    var day = Now.getHours();
    var minutes = Now.getMinutes();
    var meridiem;
    if(day>12){
      day-12;
      meridiem = "PM";
    }else meridiem ="AM";
    if(minutes<10){
      minutes = "0"+minutes;
    }
    var time = day +':'+minutes;
    document.querySelector('#timer').innerHTML = time+"<span id='meridiem'></span>";
    document.querySelector('#meridiem').innerText = meridiem;
  },1000);
  
 

  
  
  //로그인 팝업 조작
  $('.popupOverlay').fadeOut(0);
  $('.popupLogin').fadeOut(0);
  var loginPage;
  $('#nav_login').click(function() {
	  $.ajax({
		  url:"loginJbox.jsp",
		  dataType: "html",
		  error: function() {
			alert("에러");
		},
		  success : function(data) {
			  loginPage = data;
			$('body').append(loginPage);
		}
	  })
	  $('.popupOverlay').fadeIn(350);
      $('.popupLogin').fadeIn(350);
  })
  
  	$(document).on('click','.popupOverlay, #loginCloseBtn, #createAccount', function() {
  		$('.popupOverlay').fadeOut(300);
    	$('.popupLogin').fadeOut(300);
    	
    	$('.popupOverlay').delay(300).remove();
    	$('.popupLogin').delay(300).remove();
	})
})




//로그인 처리
	$(document).on('click','.loginBtn', function() {
		var getId = $("input[name='loginId']").val();
		var getPwd = $("input[name='loginPwd']").val();
		$.ajax({
			url:"logintest.jsp",
			type:'post',
			data:{id:getId,pwd:getPwd},
			error: function() {
				alert("연결에 실패했습니다.");
			},
			success: function(a) {
				if(a.indexOf("fail") != -1){
					$('.input').css({
						"border":" solid 2px #ff6a6a",
					});
					$('#wrongMassage').css('display','inline-block');
					//로그인 페이지에  실패 메세지 등록
				}else {
			  		$('.popupOverlay').fadeOut(300);
			    	$('.popupLogin').fadeOut(300);
			    	
			    	$('.popupOverlay').delay(300).remove();
			    	$('.popupLogin').delay(300).remove();
			    	location.reload();
					//로그인 창을 닫고 메인페이지 화면 전환
				}
				
			}

		});
		
		

		
		
	})




//네이 높이 맞추기 효과






//화면 넓이에 따른 네비 보이는 유무
function detectMediaSize() { 
    if ( window.matchMedia('(min-width: 0px) and (max-width: 800px) and (max-height:1000px)').matches ) {
    	$('nav').css('left','-200px');
    	$('.wrap').css('padding-left','0px');
    	$('nav').css('height','1000px');
    } else {
    	$('nav').css('left','0px');
    	$('.wrap').css('padding-left','200px');
    	$('html').css('height','100%');
    	$('body').css('height','100%');
    	$('nav').css('height','100%');
    	$('.wrap').css('height','95%');
    	$('iframe').css('height','100%');
    }
};

// Register
window.addEventListener('resize', detectMediaSize, false);

// Initialization
detectMediaSize(); 