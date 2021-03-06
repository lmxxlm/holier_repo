<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
	<meta name="description" content="">
	<meta name="author" content="">
	<title>好乐医</title>
	<link href="resources/images/favicon.ico" type="image/x-icon" rel=icon>
    <link href="resources/images/favicon.ico" type="image/x-icon" rel="shortcut icon">
	<link href="resources/css/font-awesome.css" rel="stylesheet">
	<link href="resources/css/bootstrap.css" rel="stylesheet">
	<link href="resources/css/style.css" rel="stylesheet">
	<link href="resources/css/settings.css" rel="stylesheet">
	<link href="resources/css/magnific-popup.css" rel="stylesheet">
	<link href="resources/css/owl.carousel.css" rel="stylesheet">
	<link href="resources/css/owl.transitions.css" rel="stylesheet">
	<link href="resources/css/animate.css" rel="stylesheet">
	<link href="resources/css/responsive.css" rel="stylesheet">
	<link href="resources/css/color.css" rel="stylesheet">
	<link href="resources/css/datepicker.css" rel="stylesheet">
	
	<!--[if lt IE 9]>
	<script src="http://apps.bdimg.com/libs/html5shiv/3.7/html5shiv.min.js"></script>
	<![endif]-->
    <style>
    .appDownload,.appDownload .left,.appDownload .right{ float:left;}
	.appDownload .btn-primary{ display:block;}
	
	.bgImg{background:url(resources/images/per.png)  no-repeat center relative; display:block;}
	.appointmentLi{padding: 10px 20px;margin: 20px -20px 10px -20px;background-color: #f3f3f3;}
	.appointmentLi p{margin:0;padding:0;}
	
	
	/*响应式样式*/
	@media (min-width:100px) and (max-width:768px){
	.navbar-toggle {
			   float:right;
		    }
	    .modal-dialog {
		   float:right;
	    }
	    .navbar-collapse{
	    
	    text-align:right;
	    float:right;
	    }
	     li{width:100px;}
	     .container > .navbar-header, .container-fluid > .navbar-header, .container > .navbar-collapse, .container-fluid > .navbar-collapse{margin-right:-10px;}
	}
    </style>
</head>

<body class="single-page">

<!--preloader start-->
        <div class="preloading-screen" style=" background:url(resources/images/preloader_img.GIF) #fff no-repeat center fixed;">
            <div class="spinners">
              <div class="bounce1">
                 
              </div>
            </div>
            
        </div>  
<!--preloader end-->
	<!-- page-wraper -->
	<main class="page-wraper">

		<div id="home" class="sticky-menu-trigger">
			<!-- tp-bar -->
			<!-- navbar -->
			<div class="navbar">
                <div class="logo"><a href="index.html"><img src="resources/images/logo.png" alt="health line"></a></div>
				<div class="container">
					<div class="navbar-header">
						<button data-target=".navbar-collapse" data-toggle="collapse" class="navbar-toggle" type="button"> <span class="icon-bar"></span><span class="icon-bar"></span> <span class="icon-bar"></span></button>
					</div>
					<!--nav-collapse -->
					<nav class="collapse navbar-collapse">
						<ul class="nav navbar-nav">
							<li><a href="#home" class="on yahei">首页</a></li>
							<li><a href="#services" class="on yahei">服务内容</a></li>
							<li><a href="#doctors" class="on yahei">服务领域</a></li>
							<li><a href="#App" class="on yahei">APP</a></li>
							<li><a href="#recover" class="on yahei">入驻康复平台</a></li>
							<li><a href="#about" class="on yahei">关于我们</a></li>
						</ul>
					</nav>
				</div>
			</div>
			
			<!-- fullscreen-slider -->
			<div class="fullscreen-slider owl-carousel">
				<div class="item">
					<div class="sliderimg" style="background-image:url(resources/images/1600x840.jpg);"></div>
					<div class="banner-content-outer">
						<div class="banner-content-area">
							<div class="banner-content-inner text-right">
								<div class="banner-content">
									<div class="iconic-large"><img src="resources/images/logo-banner.png" alt="healthline"></div>
									<h2>Our Medical Service</h2>
									<ul class="banner-ico-list">
										<li>
											<div class="iconic color-primary"><i class="fa fa-user-md"></i></div>
										</li>
										<li>
											<div class="iconic color-primary"><!--<i class="fa fa-ambulance"></i>--><img src="resources/images/medex.gif" style="vertical-align:top;"></div>
										</li>
										<li>
											<div class="iconic color-primary"><i class="fa fa-wheelchair"></i></div>
										</li>
										<li>
											<div class="iconic color-primary"><i class="fa fa-medkit"></i></div>
										</li>
									</ul>
									<p class="visible-med yahei">好乐医同时服务医生与患者。通过移动医疗APP“易转诊”为专家提供精准病源，增加患者粘性，优化就诊流程，为多点执业的名医提高效益和效率，为患者提供主任级的名医团队。</p>
								</div><!-- /banner-content -->
							</div>
						</div>
					</div>
				</div>
			</div>
			
		</div><!-- /#home -->
		
		<div id="eg" >
		<!-- Department section -->
		    <article class="section-parallax "  style="padding:0 0 1px 0;">
			
		    </article>
        </div>
		
		
		

	<div id="services">
		<!-- services section -->
		<article class="section">
			<div class="container">
				<!-- upper-section -->
				<div class="upper-section">
					<header class="heading animated out" data-animation="fadeInUp" data-delay="0">
						<h2 class="yahei">好乐医的服务内容</h2>
						<p>Service Of Holier</p>
					</header>
				</div>
				<!-- content-section -->
				<div class="content-section">
					<div class="row">
						<div class="col-sm-6 col-md-3">
							<div class="service-box">
								<div class="text">
									<div class="iconic"><img src="resources/images/pat.gif"></div>
									<h4 class="yahei">患者</h4>
								</div>
								<a href="#" class="readmore">解决重大疾病就医难</a>
							</div>
							</div>
							<div class="col-sm-6 col-md-3">
								<div class="service-box">
									<div class="text">
										<div class="iconic"><img src="resources/images/doc.gif"></div>
										<h4 class="yahei">医生</h4>
									</div>
									<a href="#" class="readmore">实现名医价值</a>
								</div>
							</div>
							<div class="col-sm-6 col-md-3">
								<div class="service-box">
									<div class="text">
										<div class="iconic"><img src="resources/images/hos.gif"></div>
										<h4 class="yahei">医院</h4>
									</div>
									<a href="#" class="readmore">帮助专科发展</a>
								</div>
							</div>
							<div class="col-sm-6 col-md-3">
								<div class="service-box">
									<div class="text">
										<div class="iconic"><img src="resources/images/gov.gif"></div>
										<h4 class="yahei">政府</h4>
									</div>
									<a href="#" class="readmore">多点执业与分级诊疗的政策落实</a>
								</div>
							</div>
					</div>
				</div>
			</div>
		</article>
	</div><!-- /#services -->

	<div id="doctors">
		<!-- Department section -->
		<article class="section-parallax bg-primary" style="background-image:url(resources/images/1600x565.jpg);">
			<div class="container">
				<!-- upper-section -->
				<div class="upper-section">
					<header class="heading animated out" data-animation="fadeInUp" data-delay="0">
						<h2 class="yahei">好乐医的专业服务领域</h2>
						<p>Departments Of Holier</p>
					</header>
				</div>
				<div class="content-section">
					<div class="row">
						<div class="col-xs-6 col-sm-3 col-md-2">
							<!-- dept-box -->
							<div class="dept-box">
								<div class="iconic"> <i class="icon-brain"></i> </div>
								<h6>脑科</h6>
							</div>
						</div>
						<div class="col-xs-6 col-sm-3 col-md-2">
							<!-- dept-box -->
							<div class="dept-box">
								<div class="iconic"> <i class="icon-heart"></i> </div>
								<h6>心内科</h6>
							</div>
						</div>
						<div class="col-xs-6 col-sm-3 col-md-2">
							<!-- dept-box -->
							<div class="dept-box">
								<div class="iconic"> <img src="resources/images/xueguanwaike.gif" style="padding-bottom:25px;"> </div>
								<h6>血管外科</h6>
							</div>
						</div>
						<div class="col-xs-6 col-sm-3 col-md-2">
							<!-- dept-box -->
							<div class="dept-box">
								<div class="iconic"> <i class="icon-lungs"></i> </div>
								<h6>肿瘤</h6>
							</div>
						</div>
						<div class="col-xs-6 col-sm-3 col-md-2">
							<!-- dept-box -->
							<div class="dept-box">
								<div class="iconic"> <img src="resources/images/erke.gif" style="padding-bottom:25px;"> </div>
								<h6>儿童心脏科</h6>
							</div>
						</div>
						<div class="col-xs-6 col-sm-3 col-md-2">
							<!-- dept-box -->
							<div class="dept-box">
								<div class="iconic"> <i class="icon-ribs"></i> </div>
								<h6>骨科</h6>
							</div>
						</div>
					</div>
				</div>
			</div>
		</article>
        </div>
        
        
        <div id="App">
		<!-- Team section -->
		<article class="section">
			<!-- upper-section -->
			<div class="upper-section">
				<div class="container">
					<header class="heading animated out" data-animation="fadeInUp" data-delay="0">
						<h2 class="yahei">“易转诊”移动客户端</h2>
						<p>Mobile Apps Of Holier</p>
					</header>
				</div>
			</div>
			<!-- content-section -->
			<div class="content-section">
				<!-- team-section -->
				<div class="team-section">
					<div class="team-tabs">
						<div class="container">
							<ul class="team-tabs-list">
								<li role="presentation">
									<a href="javascript:void(0)" class="yahei">医生版</a>
								</li>
								<li role="presentation">
									<a href="javascript:void(0)" class="yahei">患者版</a>
								</li>
								<li role="presentation">
									<a href="javascript:void(0)"  class="yahei">专家版</a>
								</li>
							</ul>
                            <div class="content-section">
                              <div class="row">
                                  <div class="col-sm-6">
                                              <!-- activity-box -->
                                  <div class="activity-box media">
                                    <a class="pull-left" href="#">
                                      <img class="media-object" src="resources/images/doc_app.jpg" alt="image">
                                    </a>
                                    <div class="media-body">
                                      <h4 class="media-heading">医生版客户端</h4>
                                      <p>医生最佳的患者双向转诊与患者管理工具！易转诊为医生们提供全新的患者管理体验，帮助医生实现自身的最大价值！</p>
                                      <a href="https://itunes.apple.com/cn/app/yi-zhuan-zhen/id985509756?mt=8" target="_blank" class="btn btn-primary">IOS版下载</a>
                                      <a href="http://android.myapp.com/myapp/detail.htm?apkName=com.danronghz.medex.doctor" target="_blank" class="btn btn-primary">安卓版下载</a>
                                    </div>
                                  </div>          
                                </div>
                                  <div class="col-sm-6">
                                              <!-- activity-box -->
                                  <div class="activity-box media">
                                    <a class="pull-left" href="#">
                                      <img class="media-object" src="resources/images/pat_app.jpg" alt="image">
                                    </a>
                                    <div class="media-body">
                                      <h4 class="media-heading">患者版客户端</h4>
                                      <p>患者最佳的双向转诊与就医日程工具！易转诊为患者提供最好的医患配合工具！</p>
                                      <a href="https://itunes.apple.com/cn/app/yi-zhuan-zhen-huan-zhe-ban/id985510717?mt=8" target="_blank" class="btn btn-primary">IOS版下载</a>
                                      <a href="http://android.myapp.com/myapp/detail.htm?apkName=com.danronghz.medex.patient" target="_blank" class="btn btn-primary">安卓版下载</a>
                                    </div>
                                  </div>          
                                </div>
                                  <div class="col-sm-6">
                                              <!-- activity-box -->
                                  <div class="activity-box media">
                                    <a class="pull-left" href="#">
                                      <img class="media-object" src="resources/images/iPad.jpg" alt="image">
                                    </a>
                                    <div class="media-body">
                                      <h4 class="media-heading">专家客户端</h4>
                                      <p>医生最佳的患者双向转诊与患者管理工具！易转诊为医生们提供全新的患者管理体验，帮助医生实现自身的最大价值！</p>
                                      <a href="javascript:alert('尽请期待！')" class="btn btn-primary">iPad版下载</a>
                                    </div>
                                  </div>          
                                </div>
                                      </div>
                            </div>
						</div>
					</div>
				</div>
			</div>
		</article>
	</div><!--  /#doctors -->
	
	
	
        <div id="recover" >
        <!-- ------------------------ -------->
        <!-- appointment section -->
		<article class="section" style="margin-top:-100px;">
			<div class="section-image" style="background-image:url(resources/images/hosback1.png);">
				<div class="container">
					<!-- appointment-area -->
					<div class="appointment-area">
						<div class="row">
							<div class="col-sm-10 col-md-6">
								<!-- appointment-box -->
								<div class="appointment-box">
									<header>
										<h4>入驻康复平台，加入康复大家庭</h4>
									</header>
									<div class="appointmentLi">
									    <p>完全平台化的管理，帮助医生对患者术后的效果跟踪，提高术后治疗效果。</p>
										<p>增加大型医疗机构病床的周转率，提升大型医院机构的社会效益。</p>
										<p>帮助康复医院提高医疗资源使用效率，优化医疗资源配置。</p>
									</div>
									<div class="text">
										<form class="appointment-form" method="post" action="submit_reg_hospital_info.do">
											<ul class="row">
												<li class="col-sm-12">
													<label>医院名称</label>
													<input type="text" name="name" placeholder="请输入医院名称" class="form-control">
												</li>
												<li class="col-sm-12">
													<label>医院详细地址</label>
													<input type="text" name="addr" placeholder="请输入医院的详细地址" class="form-control">
												</li>
												
												<li class="col-sm-6">
													<label>联系人</label>
													
														<input type="text" name="contact" placeholder="请输入医院联系人" class="form-control" value=""
														 style="background:url(resources/images/per.png) no-repeat right ;
														 background-size:25px;background-position:96%;">
													
												</li>
												<li class="col-sm-6">
													<label>联系号码</label>
													<input type="text" name="phone" placeholder="请输入联系人的联系号码" class="form-control" value=""
														 style="background:url(resources/images/tel.png) no-repeat right ;
														 background-size:25px;background-position:96%;">
													   
												</li>
												
											</ul>
											<div class="appintment-form-btm">
												<input type="button" class="btn btn-primary" value="提交"  style="float:right;">
											</div>
										</form>
									</div>
								</div>
							</div>
							<div class="col-sm-6 appointment-box-snap"> <img src="resources/images/hosback2.png"  alt="image doctor" > </div>
						</div>
					</div>
				</div>
			</div>
		</article>
      <!-- -------------------------------------- -->
        </div>
	

	<footer class="footer" id="about">
		<div class="container">
			<div class="row">
				<div class="col-sm-6 col-md-3">
					<div class="widget widget_text">
						<div class="section_title">
							<h4>关于我们</h4>
						</div>
						<p>好乐医同时服务医生与患者。通过移动医疗APP”易转诊“为专家提供精准病源，增加患者粘性，优化就诊流程，为多点执业的名医提高效益和效率，为患者提供主任级的名医团队。</p>
					</div>
				</div>
				<div class="col-sm-6 col-md-3">
					<div class="widget widget_contact">
						<div class="section_title">
							<h4>联系我们</h4>
						</div>
						<ul>
							<li class="address">杭州市滨江区建业路511号华创大厦6楼</li>
							<li class="phone">+86 571 88832999</li>
							<li class="phone">+86 571 87897099</li>
							<li class="email"><a href="mailto:will.wu@holier.cn">service@holier.cn</a></li>
						</ul>
					</div>
				</div>
				<div class="col-sm-12 col-md-6">
					<div class="widget widget_newsletter">
						<div class="section_title">
							<h4>微信公众号：meilihaoleyi</h4>
						</div>
						<p>
                        <img src="resources/images/WEIXIN.jpg" style="width:150px; margin-left:40px;">
                        </p>
					</div>
				</div>
			</div>
		</div>
		<div id="map-canvas"></div>
	</footer>

	<!-- Section Social -->
	<div class="section-social">
		<span class="social-opener"></span>
	</div>

	<!-- Site Bottom -->
	<div class="site-btm">
		<div class="container">
			<p class="copyright">© Copyright 2015 SHANGHAI ZHELI MEDICAL CONSULTING CO.,LTD&nbsp;&nbsp;&nbsp;&nbsp;沪ICP备15024085号-1</p>
			<ul class="bottom-links">
				<li><a href="http://www.holier.cn/huizhen" target="_blank">好乐医视频慧珍</a></li>
				<li><a href="termOfService" target="_blank">用户服务条款及隐私条款</a></li>
				<li><a href="termOfServiceForDoc" target="_blank">医生版用户协议</a></li>
			</ul>
		</div>
	</div>

	</main>

	<!-- JavaScript Files
	================================================== -->
	<script src="resources/js/jquery-1.11.0.min.js"></script>
	<script src="resources/js/bootstrap.min.js"></script>
	<script src="resources/js/jquery.appear.js"></script>
	<script src="resources/js/jquery.magnific-popup.js"></script>
	<script src="resources/js/owl.carousel.min.js"></script>
	<script src="resources/js/bootstrap-datepicker.js"></script>                          
	<script src="resources/js/script.js"></script>
	<script>
	    $(function(){
	    	init();
	    	function init(){
	    		$('#recover input').val('');
	    		$('#recover input[type="button"]').val("提交");
	    	}
	    	
	    	function test(result,info){
	    		
	    		if(!result){
	    			alert("您当前没有输入"+info);
	    			return false;
	    		} else{
	    			if(info=="联系方式"){
	    				var a =false ; 
	    				!(/^1(3|4|5|7|8)\d{9}$/.test(result)) ?  function(){alert("手机号码有误，请重填"); }() : function(){ a = true}() ;  
	    				return a;
		    		}else{
		    			return true;
		    		};
	    			
	    		}  
	    		
	    	};
	    	$('#recover input[type="button"]').click(function(){
	    		
	    		var name=$('#recover input[name="name"]').val();
	    		var addr=$('#recover input[name="addr"]').val();
	    		var contact=$('#recover input[name="contact"]').val();
	    		var phone=$('#recover input[name="phone"]').val();
	    		
	    		var a=test(name,"医院名称");
	    		var b=test(addr,"详细地址");
	    		var c=test(contact,"联系人");
	    		var d=test(phone,"联系方式");
	    		
	    	    
	    		
	    		
	    		if(a && b && c && d){
	    			$('#recover form').submit();
	    		}
	    		
	    	});
	    	
	    });
	</script>
</body>
</html>