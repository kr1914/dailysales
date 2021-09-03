/* jBox */
$(function () {



  /* 시작시 우측 하단에 안내메세지 팝업*/
  new jBox('Notice', {
	  content: '환영합니다!',
	  color: 'green', 
	  attributes: {
		  y: 'bottom'
			  }
  })
  
  var navBtnBox;

  var navBtnBox = new jBox("Tooltip",{
    //attach:".nav_btn",
    theme:"TooltipBorderThick",
    width:200,
    position:{x:"right",y:"center"},
    outside:"x",
    pointer:"top:15",
    //content:"You have many options to position and animate your jBoxes",
    animation:"move",
    adjustDistance:{top:55,right:5,bottom:5,left:5},
    zIndex:4e3
  });
  
  $('.slipInsert').hover(function() {
	navBtnBox.attach('.slipInsert');
	navBtnBox.setContent("하루의 매출을 정리해 보세요.");
}, function() {
	navBtnBox.detach();
});

  var cMgt = new jbox("Tooltip",navBtnJboxOption);
  cMgt.attach(".cMgt");
  cMgt.setContent("거래처정보를 관리하고, 거래처별 매출현황을 파악할 수 있습니다.");
  

//도움말 보기, 안보기 체크
  $('#tuEx').click(function () {
    if($('#tuEx').is(':checked')==true){
      navBtnBox.detach();
    }else navBtnBox.attach('.nav_btn');
  })
  
  
  /*
  function jBoxConfirmWrapper(jBox,jQuery){
	  new jBox.plugin("Confirm",{
		  confirmButton:"Submit",
		  cancelButton:"Cancel",
		  confirm:null,
		  cancel:null,
		  closeOnConfirm:!0,
		  target:window,
		  fixed:!0,
		  attach:"[data-confirm]",
		  getContent:"data-confirm",
		  content:"Do you really want to do this?",
		  minWidth:360,
		  maxWidth:500,
		  blockScroll:!0,
		  closeOnEsc:!0,
		  closeOnClick:!1,
		  closeButton:!1,
		  overlay:!0,
		  animation:"zoomIn",
		  preventDefault:!0,
		  _onAttach:function(t){
			  var i;
			  this.options.confirm||(i=t.attr("onclick")?t.attr("onclick"):t.attr("href")?t.attr("target")?'window.open("'+t.attr("href")+'", "'+t.attr("target")+'");':'window.location.href = "'+t.attr("href")+'";':"",t.prop("onclick",null).data("jBox-Confirm-submit",i))
		  },
		  _onCreated:function(){
			  this.wrapper.addClass("jBox-Modal"),
			  this.footer=jQuery('<div class="jBox-Confirm-footer"/>'),
			  jQuery('<div class="jBox-Confirm-button jBox-Confirm-button-cancel"/>').html(this.options.cancelButton).on("click tap",function(){
				  this.options.cancel&&this.options.cancel(this.source),
				  this.close()
			  }.bind(this)).appendTo(this.footer),
			  this.submitButton=jQuery('<div class="jBox-Confirm-button jBox-Confirm-button-submit"/>').html(this.options.confirmButton).appendTo(this.footer),
			  this.footer.appendTo(this.container)
		  },
		  _onOpen:function(){
			  this.submitButton.off("click.jBox-Confirm"+this.id+" tap.jBox-Confirm"+this.id).on("click.jBox-Confirm"+this.id+" tap.jBox-Confirm"+this.id,function(){
				  this.options.confirm?this.options.confirm(this.source):eval(this.source.data("jBox-Confirm-submit")),
						  this.options.closeOnConfirm&&this.close()
						  }.bind(this))
						  }
		  })
	  }
  */
})