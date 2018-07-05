$(function(){
	
	$('.ip_b_con_item li,.pro_index_list li').mouseover(function(){
		$(this).addClass("hover");
		});
	$('.ip_b_con_item li,.pro_index_list li').mouseleave(function(){
		$(this).removeClass("hover");
		}); 
	
	$("#ip_b_title a").each(function(i){
			$(this).click(function(){
				$(this).addClass("hover").siblings("a").removeClass("hover");		
				$("#pro_scroll_con .scrollCon").eq(i).show(0).siblings(".scrollCon").hide(0);
				if(i==2){
					$(".scrollConwrap").eq(i).css("height","355px");
					$(".n_index_block_4").css("height","493px");
				}else{
					$(".n_index_block_4").css("height","409px");
					}
			})
			
	})
	
	$(".hshare a.icon_weixin").mouseover(function(){
		$(this).find("img").fadeIn(500);
	}).mouseleave(function(){
		$(this).find("img").stop(true,false).fadeOut(500);
	})
	
	var wtimer = null;
	var windows = $(window);
	var nav = $('#nav');
	var goTopDiv = $("#goTopDiv");
	var logoImg =$(".logo");
	$(window).scroll(function(){
		if(wtimer){
		clearTimeout(wtimer);	
		}
		wtimer = setTimeout(scrollbody,30);
	});
	
	function scrollbody(){
		var top = windows.scrollTop();
		if(top>95){
			nav.addClass("fixednav");
			logoImg.addClass("fixedlogo");
			goTopDiv.find("a").show(100);
		}else{
			nav.removeClass("fixednav");
			logoImg.removeClass("fixedlogo");
			goTopDiv.find("a").hide(100);
		}
		if(top>100){
			$("a.top").show(100);	
		}else{
			$("a.top").hide(100);
		}
	}
	
	
	
	
	
	
	$(document).ready(function(){
	 scrollbody();
	$(".m_banner").addClass("m_banner_hover");
	/*微锟斤拷
	var timesa = null;
	$(".nav a.a3").mouseover(function(){
		$(this).find("img").fadeIn(500);
		clearTimeout(timesa);
		}).mouseleave(function(){
			var _t = $(this);
		timesa = setTimeout(function(){
				   _t.find("img").fadeOut(500);},300)
	});*/
	
	
	if(typeof pageid != "undefined"){
		if(pageid == 3)
		{
			//getpplnImg();
			//getpplnImg2();
			//initPic();
		}
	}
	
	});
	
	
	$("a.top").click(function(){
		$("html,body").animate({scrollTop:0},500,"easeInOutExpo");					  
	});
	$("#rm_list .more_a").click(function(){
		$("#sqzw_tips").show(500);			
		$("#sqzw_tips .colse").unbind("click").bind("click",function(){
			$("#sqzw_tips").hide(500);															 
		})
	});
	
	
	window.scrollFnc = function(obj,objChild,btnobj,btnobjChild,callback){
		this.list = $(obj).find(objChild);
		this.stimers = null;
		this.callback =null;
		this.index = 0;
		this.btn = $(btnobj).find(btnobjChild);
		this.list.fadeOut(0).eq(0).fadeIn(500);
		this.objChild = objChild;
		this.btnobjChild = btnobjChild;
		var self = this;
		this.btn .each(function(i){
			$(this).mouseover(function(){
			     self.show(i);
				
			});
			
		});
		return this;
	}
	
	scrollFnc.prototype.play = function(){
		var now = this.list.eq(this.index);
	}
	scrollFnc.prototype.show = function(i){
		 this.list.eq(i).stop(true,true).fadeIn(500).siblings(this.objChild).stop(true,true).fadeOut(500);
		 this.btn.eq(i).addClass("hover").siblings(this.btnobjChild).removeClass("hover");
		  this.index  = i;
		  typeof this.callback =="function" &&this.callback();
	}
	scrollFnc.prototype.next =function(){
		var now = this.index;

		if(now==this.list.length-1){
			now = 0;
		}else{
			now++;	
		}
		this.show(now);
		
	}
	scrollFnc.prototype.prev =function(){
		var now = this.index;
		console.log(now)
		if(now==0){
			now = this.list.length-1;
		}else{
			now--;	
		}
		this.show(now);
	}
	
});





window.scrollFnc = function(obj,objChild,btnobj,btnobjChild,callback){
		this.list = $(obj).find(objChild);
		this.stimers = null;
		this.callback =null;
		this.index = 0;
		this.btn = $(btnobj).find(btnobjChild);
		this.list.fadeOut(0).eq(0).fadeIn(500);
		this.objChild = objChild;
		this.btnobjChild = btnobjChild;
		var self = this;
		this.btn .each(function(i){
			$(this).mouseover(function(){
			     self.show(i);
				
			});
			
		});
		return this;
	}
	
	scrollFnc.prototype.play = function(){
		var now = this.list.eq(this.index);
	}
	scrollFnc.prototype.show = function(i){
		 this.list.eq(i).stop(true,true).fadeIn(500).siblings(this.objChild).stop(true,true).fadeOut(500);
		 this.btn.eq(i).addClass("hover").siblings(this.btnobjChild).removeClass("hover");
		  this.index  = i;
		  typeof this.callback =="function" &&this.callback();
	}
	scrollFnc.prototype.next =function(){
		var now = this.index;

		if(now==this.list.length-1){
			now = 0;
		}else{
			now++;	
		}
		this.show(now);
		
	}
	scrollFnc.prototype.prev =function(){
		var now = this.index;
		console.log(now)
		if(now==0){
			now = this.list.length-1;
		}else{
			now--;	
		}
		this.show(now);
	}

var loadflag = true;
function showProImg(id,classid){
	var imgid = id;
	var classid = classid;
	if(!loadflag){
		return;
	}
	if(!$("#load")[0]){
		$("body").append("<div id='load' class='load'></div>");	
	}
	$("#load").fadeIn(300);
	
	loadflag = false;
	$.get("/ajax/getproimg.php?d="+new Date(),{id:imgid,classid:classid},function(data){
			loadflag = true;
			$("#load").fadeOut(300);
			var jdata = eval("["+data+"]")[0];
			if(typeof window.proImg != "object"){
			 window.proImg = new InitProImg();
			}
			
			 window.proImg.setData(jdata)
			/*
		var jdata = eval("["+data+"]")[0];
		$('#ptitle').html(jdata.title);
		$('#ptitle2').html(jdata.title);
		$('#ptitle3').html(jdata.ftitle);
		$('#ptitle4').html(jdata.xmgh);
		$('#newsContent').html(jdata.xmsm);
		$('#pbanner').html(jdata.img);
		ref.refresh();
		window.caseid = jdata.id;
		$('.poject_detail_box_wrap,.poject_detail_box_wrap_bg').show();	
		$('.p_left,.p_right').stop(false,true).fadeIn(500);
		
		*/
	});	
	
}
function InitProImg(data){
	
	
	this.time = null;
	this.proImg = null;
	this.title = null;
	this.proIndex = 0;
	var imgtext =$("#imgtext");
	$("#profixed_box .img").mouseover(function(){
		var h =imgtext.height()+48;
		$(this).find("#imgtext").animate({top:(590-h)+'px'},500);
	}).mouseleave(function(){
		var h =imgtext.height()+48;
		$(this).find("#imgtext").animate({top:590+"px"},500);
	}).click(function(){
	return false;	
	});
	
	
	this.setData  = function(data){
		this.data = data;
		this.proImg = 	data.img;
		this.proText = data.text;
		this.classid = data.classid;
		this.nextIndex = data["next"]||null;
		this.prevIndex = data["prev"]||null;
		
		this.title = data.title;
		$("#title").html(this.title);
		$("#profixed_box,#profixed_bg").fadeIn(500);
		this.lengths =  this.data['all'];
		this.showData(0);
	}
	
	
	this.showData = function(i){
		$("#profixed_box #img").fadeOut(200).fadeIn(200).attr("src",this.proImg);
		
		$("#imgtext").text(this.proText);
		$("#icon_text").html(this.data["now"]+"/"+this.lengths);
		this.proIndex = i;
		
	}
	
	this.next = function(e){
		var e = e||window.event;
		e.stopPropagation();
		
		this.hideTips();
		if(this.nextIndex==null){
			/*
			$("#tipsImg").html("锟窖撅拷锟斤拷锟斤拷锟揭伙拷锟斤拷锟�").fadeIn(500);
			this.time = setTimeout(this.hideTips,1500);
			return;*/
			this.nextIndex = this.data["fristid"];
		}
		
		showProImg(this.nextIndex,this.classid)
			
	}
	this.prev = function(e){
		var e = e||window.event;
		e.stopPropagation();
		this.hideTips();
		if(this.prevIndex ==null){
			/*
			$("#tipsImg").html("锟斤拷前为锟斤拷一锟斤拷").fadeIn(500);
			this.time = setTimeout(this.hideTips,1000);
			return;*/
			this.prevIndex = this.data["lastid"];
		}
		
		showProImg(this.prevIndex,this.classid)
	}
	
	this.hideTips = function(){
		clearTimeout(this.time);
		console.log(this.time)
		if(!$("#tipsImg")[0]){
			$("body").append("<div id='tipsImg'></div>");
			}
		$("#tipsImg").stop(true,true).fadeOut(300);
	}
	
	this.close = function(){
		$("#profixed_box,#profixed_bg").fadeOut(500);
	}
	
}



submit_from1_flag = true;
function submit_ljbm(){
	
	if(!submit_from1_flag){
		return ;
	}
		
		
		
		if($.trim($('input[name=title]').val())=='')
		{
			alert('璇峰～鍐欏鍚�');
			return false;
		}
		
		
		if(!checkMobile('input[name=call]')){
			return;
		}
		if($.trim($('input[name=company]').val())=='')
		{
			alert('璇峰～鍐欐墍鍦ㄥ湴鍖�');
			return false;
		}
	if($.trim($('input[name=saytext]').val())=='')
		{
			alert('璇峰～鍐欏唴瀹�');
			return false;
		}
		
		  $.ajax({
        type:'POST',
        url:'/e/enews/index.php',
        // post payload:
        dataType:'json',
        data:$('#form1').serialize(),
        success: function(data){
        	if(data.status==0){
				alert("鎻愪氦澶辫触,鍘熷洜:"+data.msg);
				submit_from1_flag = true;
				}else if(data.status==1){
				alert(data.msg);	
				submit_from1_flag = false;
				document.getElementById('form1').reset();
			}
        },
        error:function(xhr, type){
        	
        }
		}
		)
	
}


//姝ｅ搧鏌ヨ
function submit_zpcx(){
	
	if(!submit_from1_flag){
		return ;
	}
		
		
		
		if($.trim($('input[name=dingdan]').val())=='')
		{
			alert('璇峰～鍐欒鍗曞彿');
			return false;
		}
			if($.trim($('input[name=name]').val())=='')
		{
			alert('璇峰～鍐欏鍚�');
			return false;
		}
		
		
		if(!checkMobile('input[name=call]')){
			return;
		}
		if($.trim($('input[name=address]').val())=='')
		{
			alert('璇峰～鍐欒仈绯诲湴鍧€');
			return false;
		}
		
		if($.trim($('input[name=key]').val())=='')
		{
			alert('璇峰～鍐欓獙璇佺爜');
			return false;
		}
		
		$("input[name=title]").val("姝ｅ搧鏌ヨ鍗曞彿:"+$('input[name=dingdan]').val());
		  $.ajax({
        type:'POST',
        url:'/e/enews/index.php',
        // post payload:
        dataType:'json',
        data:$('#form1').serialize(),
        success: function(data){
        	if(data.status==0){
				alert("鎻愪氦澶辫触,鍘熷洜:"+data.msg);
				submit_from1_flag = true;
				}else if(data.status==1){
				alert(data.msg);	
				submit_from1_flag = false;
				document.getElementById('form1').reset();
			}
        },
        error:function(xhr, type){
        	
        }
		}
		)
	
}

function checkMobile(smobj){ 
    var sMobile =$(smobj).val(); 
    if(!(/^1[3|4|5|8][0-9]\d{4,8}$/.test(sMobile))){ 
        alert("涓嶆槸瀹屾暣鐨�11浣嶆墜鏈哄彿鎴栬€呮纭殑鎵嬫満鍙峰墠涓冧綅"); 
        $(smobj).focus(); 
        return false; 
    }
	
	return true;
} 


function submit_from1(){
	
	if(!submit_from1_flag){
		return ;
	}
	if($.trim($('#title1').val())==''){
		alert("璇疯緭鍏ュ鍚�");
		return;
	}
	if(!checkMobile('#call1')){
		return;
	}
	if($('#Province').val()=='璇烽€夋嫨'||$('#City').val()=='璇烽€夋嫨'||$('#Area').val()=='璇烽€夋嫨'){
		alert('璇烽€夋嫨鎵€鍦ㄧ殑鍩庡競');
		return false;
		}
	
	$('#address1').val(getAddress('#Province','#City','#Area'));
	
	submit_from1_flag = false;
	   $.ajax({
        type:'POST',
        url:'/e/enews/index.php',
        // post payload:
        dataType:'json',
        data:$('#form1').serialize(),
        success: function(data){
        	if(data.status==0){
				alert("鎻愪氦澶辫触,鍘熷洜:"+data.msg);
				submit_from1_flag = true;
				}else if(data.status==1){
				alert(data.msg);	
				submit_from1_flag = false;
				document.getElementById('form1').reset();
				
			}
        },
        error:function(xhr, type){
        	
        }
		}
		)
}



function submit_tsjy(){
	if(!submit_from1_flag){
		return ;
	}
	
		if($.trim($('input[name=title]').val())=='')
		{
			alert('璇峰～鍐欏鍚�');
			return false;
		}
		
		if(!checkMobile('input[name=call]')){
			alert('璇峰～鍐欑數璇�');
			return;
		}
		
		
		
	if($.trim($('textarea[name=saytext]').val())=='')
		{
			alert('璇峰～鍐欑暀瑷€');
			return false;
		}
		
		
		if($.trim($('input[name=key]').val())=='')
		{
			alert('璇峰～鍐欓獙璇佺爜');
			return false;
		}
		
		
		  $.ajax({
        type:'POST',
        url:'/e/enews/index.php',
        // post payload:
        dataType:'json',
        data:$('#form1').serialize(),
        success: function(data){
        	if(data.status==0){
				alert("鎻愪氦澶辫触,鍘熷洜:"+data.msg);
				submit_from1_flag = true;
				}else if(data.status==1){
				alert(data.msg);	
				submit_from1_flag = false;
				document.getElementById('form1').reset();
			}
        },
        error:function(xhr, type){
        	
        }
		}
		)
}


function getpplnImg(){
	var temp_pic = '';
	var temp_cur = '';
	$(".a_img_list").html("");
	$.get("/ajax/getpic.php?d="+new Date(),{picid:31},function(data){
								var jdata = eval(data);
								for(var i =0;i<jdata.length;i++){
									var temp = '<li><a href="'+jdata[i].titlepic+'" class="hover_img"><img src="'+jdata[i].titlepic+'"><div class="hide">'+jdata[i].pictext+'</div></a></li>';
									if(i<4){
									$(".a_img_list").eq(0).append(temp);	
									}else if(i<8){
										$(".a_img_list").eq(1).append(temp);
									}
						}
							
			endgetpplnImg();
	});
}
function endgetpplnImg(){
	   $('.a_img_list a').magnificPopup({
          type: 'image',
          closeOnContentClick: true,
          closeBtnInside: false,
          fixedContentPos: true,
          mainClass: 'mfp-no-margins mfp-with-zoom', // class to remove default margin from left and right side
		  image: {
            verticalFit: true,
            titleSrc: function(item) {
              return item.el.find("div").html();
            }
		  },
          zoom: {
            enabled: true,
            duration: 300 // don't foget to change the duration also in CSS
          }
        });
}

function getpplnImg2(){
	var temp_pic = '';
	var temp_cur = '';
	var ul = $(".a3_banner_list ul");
	ul.html("");
	$.get("/ajax/getpic.php?d="+new Date(),{picid:32},function(data){
								var jdata = eval(data);
								for(var i =0;i<jdata.length;i++){
									temp_pic += '<li><div class="img"><img src="'+jdata[i].titlepic+'" width="490" height="270"></div><div class="rtext"><div class="t_1">'+jdata[i].title+'</div>'+jdata[i].pictext+'</div><div class="cls"></div></li>';
									if(i==0){
									temp_cur+="<a href='javascript:' class='hover'></a>";
									}else{
									temp_cur+="<a href='javascript:'></a>"
									}
						}
		ul.html(temp_pic);
		$(".banner_list_cur").html(temp_cur);				
							
			initPic()
	});

}
function initPic(){
	
	window.banner1 =  new scrollFnc(".a3_banner_list","li",".banner_list_cur","a");
		$("a.prev").bind("click",function(){
			window.banner1.prev();							
		});
		$("a.next").bind("click",function(){
			window.banner1.next();							
		});
}

function getpplcImg(){
	var left = $(".pplc_list_left");
	var right = $(".pplc_list_right");
	left.html("");
	right.html("<div class='h20'></div><div class='h20'></div><div class='h10'></div>");
	
	var temp1 = '';
	var temp2 = ''
	
		$.get("/ajax/getpic.php?d="+new Date(),{picid:33},function(data){
								var jdata = eval(data);
								for(var i =0;i<jdata.length;i++){
									if((i+1)%2==0&&i>0){
										temp1+='<div class="item item2"><div class="con"><div class="t1">'+jdata[i].title+'</div><div class="t2">'+jdata[i].pictext+'</div><div class="img"><img src="'+jdata[i].titlepic+'" alt=""></div></div></div>';
									}else{
									temp2+='<div class="item"><div class="con"><div class="t1">'+jdata[i].title+'</div><div class="t2">'+jdata[i].pictext+'</div><div class="img"><img src="'+jdata[i].titlepic+'" alt=""></div></div></div>';	
									}
									
								
							
						}
						
							left.append(temp2);
									right.append(temp1);
	});
}

function goTop(){
	
$("body,html").animate({scrollTop:0},300);	
}


function getPage(classid){
	
		$.get("/ajax/getpage.php?d="+new Date(),{"classid":classid},function(data){
			var jdata = eval(data);
			CreatPage(jdata[0]["count"]);
	});
	
}

function CreatPage(count){
	var onepage = 12;
	var tcount = Math.ceil(count/onepage);
	var temp = [];
	temp.push("<a href='prev' onclick='showPagePrev()'><</a>");
	for(var i = 1;i<=tcount;i++){
		temp.push("<a href='javascript:' onclick='showPage("+i+")'>"+i+"</a>");
	}
	temp.push("<a href='next' href='javascript:' onclick='showPageNext()'>></a>");
	var tempHtml = temp.join("");
	console.log(tempHtml);
	$(".page").html(tempHtml)
}


function setScroll_flash(scroll_obj,btn_left,btn_right,c_width,c_num,callback){
			if (!$(scroll_obj)[0]) 
			return;
			var _t  = this;
			_t.i = 0;
			var  p = $(scroll_obj).find('ul'), pList = $(scroll_obj).find('li'), len = pList.length;
			_t.timer = null;
			
			function prev(){
			if(_t.i-1<0){
				_t.i = len-1;
			}else{
			_t.i--;
			}
			_t.show();
			}
			function next(){
			if(_t.i+1==len){
				_t.i = 0;	
			}else{
			_t.i++;
			}
			_t.show();
		
			}
			_t.show = function(){
					p.stop(true,false).animate({
					marginLeft:-_t.i * w
					},500);
			if(_t.timer){
				clearTimeout(_t.timer);
				_t.autoplay();
			}
			if(callback){
				callback(_t.i);	
				}
			}
			
			_t.resize = function(){
	
			_t.w = c_width==null?$(scroll_obj).width():c_width, num = c_num;
			p.css('margin-left',-(_t.i*_t.w));
			pList.css('width',_t.w);
			p.css('width',_t.w*len);
			
			};
			$(window).resize(function(){
				_t.resize();
				
			});
			
			
			if(btn_left){
			var elePrev = $(btn_left);
			elePrev.unbind('click').bind('click',prev);
			
			}
			if(btn_right){
			var eleNext = $(btn_right);
			eleNext.unbind('click').bind('click',next);
			
			}
			
			_t.resize();
			var show_falg = true;
			$('.scrollmbanner').mouseover(function(){
				if(show_falg){
				show_falg = false;
				$(this).find('a.scrollbtn_left').stop(false,true).fadeIn(500);
				$(this).find('a.scrollbtn_right').stop(false,true).fadeIn(500);
				}
		}).mouseleave(function(){
			if(!show_falg){
				show_falg = true;
				$(this).find('a.scrollbtn_left').fadeOut(500);
				$(this).find('a.scrollbtn_right').fadeOut(500);
			}
			});
			 _t.nexts = function(){
				 next();
				}
			_t.autoplay = function(){
				
				_t.timer = setTimeout(function(){
											   _t.nexts();
											   
											   $('#banner_cur a').eq(_t.i).addClass('hover').siblings().removeClass('hover');
											   },5000);	
				
				
			}
			
			_t.autoplay();
			return _t;
			
}



function setScroll(scroll_obj,btn_left,btn_right,c_width,c_num,callback){
			if (!$(scroll_obj)[0]) 
			return;
			var _t  = this;
			_t.i = 0;
			_t.hoverIndex = 0;
			var  p = $(scroll_obj).find('ul'), pList = $(scroll_obj).find('li'), len = pList.length;
			var elePrev = $(btn_left), eleNext = $(btn_right);
			//var firstClick = false;
			elePrev.unbind('click');
			eleNext.unbind('click');
			pList.unbind('click');
			p.css('margin-left',0);
			eleNext.removeClass('gray');
			elePrev.addClass('gray')
			var w = c_width, num = c_num;
			p.css('width',w*len);
			if (len <= num) 
			eleNext.addClass('gray');
			function prev(){
			if (elePrev.hasClass('gray')) {
			//alert('宸茬粡鏄涓€寮犱簡');
			return;
			}
			p.animate({
			marginLeft:-(--_t.i) * w
			},500);
			if (_t.i < len - num) {
			eleNext.removeClass('gray');
			}
			if (_t.i == 0) {
			elePrev.addClass('gray');
			}
			if(callback){
			callback(_t.i);	
			}
			}
			function next(){
			if (eleNext.hasClass('gray')) {
			//alert('宸茬粡鏄渶鍚庝竴寮犱簡');
			return;
			}
			//p.css('margin-left',-(++i) * w);
			p.animate({
			marginLeft:-(++_t.i) * w
			},500);
			if (_t.i != 0) {
			elePrev.removeClass('gray');
			}
			if (_t.i == len - num) {
			eleNext.addClass('gray');
			}
			if(callback){
			callback(_t.i);	
			}
			}
			elePrev.bind('click',prev);
			eleNext.bind('click',next);
			pList.each(function(n,v){
			$(this).click(function(){
			if(n-_t.i == num-1){
			next();
			}
			if(n-_t.i == 0){
			prev()
			}
			_t.hoverIndex = n;
			$(this).addClass('hover').siblings().removeClass('hover');
				if($(this).attr('big_pic')!=null){
					$('#big_pic').css('background-image',"url("+$(this).attr('big_pic')+")");
				}
			
			})
			});
			
			return _t;
			
}

function scrollTopBanner(objList,curList,itemHeight,curType,hoverClass,callback){
	
	var sindex = 0;
	var timer = null;
	$(curList).each(function(i){
		$(this).mouseover(function(){
			if(timer) clearTimeout(timer);
			$(this)	.addClass(hoverClass).siblings(curType).removeClass(hoverClass);
			sindex = i;
			$(objList).stop(true,false).animate({"marginTop":-i*itemHeight+"px"},1000,"easeInOutExpo",function(){
				timer = setTimeout(function(){autoPlay(sindex)},4000);
				typeof(callback)=="function" && callback();															
				})
		});
	});
	$(curList).eq(0).mouseover();
	function autoPlay(i){
		var i = i+1;
		if(i+1>$(curList).length) i = 0;
		$(curList).eq(i).mouseover();
	}
	
}


function show_baomin(){
	$('.show_baoming').hide(0);
	$('.zt_baoming_wrap').css({'left':'auto','right':0}).animate({width:'100%'},300,function(){
																						$('.zt_baoming_con').show(0);
																						});
	
}

function hide_baomin(){
	$('.zt_baoming_con').hide(0);
	$('.zt_baoming_wrap').css({'left':'auto','right':0}).animate({width:0},300,function(){
																						$('.show_baoming').show(0);
																						});
	
}// JavaScript Document