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
	.service-box{ cursor:pointer;}
	.service-box:hover{ border:1px solid #999;}
	.form-group{ margin-bottom:10px;}
	.form-group input{ height:35px !important;}
	.modal-contact{ background:#dedede; height:40px; line-height:40px; padding-left:10px; margin-bottom:10px;}
	.phone400{ font-weight:bold; font-size:18px;}
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
									<h2>Our Service</h2>
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
									<p class="visible-med yahei">好乐医为广大的客户提供日程提醒服务，协助医生管理自己的日程，为广大客户与医生之间提供良好沟通的桥梁。</p>
								</div><!-- /banner-content -->
							</div>
						</div>
					</div>
				</div>
			</div>
		</div><!-- /#home -->

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
					    <div class="col-md-2 hidden-sm"></div>
						<div class="col-sm-6 col-md-3">
							<div class="service-box">
								<div class="text">
									<div class="iconic"><img src="resources/images/pat.gif"></div>
									<h4 class="yahei">客户</h4>
								</div>
								<a href="#" class="readmore">预约日程提醒</a>
							</div>
							</div>
							<div class="col-md-2 hidden-sm"></div>
							<div class="col-sm-6 col-md-3">
								<div class="service-box">
									<div class="text">
										<div class="iconic"><img src="resources/images/doc.gif"></div>
										<h4 class="yahei">医生</h4>
									</div>
									<a href="#" class="readmore">协助日程管理</a>
								</div>
							</div>
							<div class="col-md-2 hidden-sm"></div>
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
						<h2 class="yahei">好乐医的服务领域</h2>
						<p>Departments Of Holier</p>
					</header>
				</div>
				<div class="content-section">
					<div class="row">
						<div class="col-xs-12 col-sm-12 col-md-12">
							<!-- dept-box -->
							<div class="dept-box">
								<div class="iconic"> <i class="icon-brain"></i> </div>
								<h6>颅脑疾病</h6>
							</div>
						</div>
					</div>
				</div>
			</div>
		</article>
    </div>
    <div id="App"></div><!--  /#doctors -->

	<footer class="footer" id="about">
		<div class="container">
			<div class="row">
				<div class="col-sm-6 col-md-3">
					<div class="widget widget_text">
						<div class="section_title">
							<h4>关于我们</h4>
						</div>
						<p>好乐医为广大的客户提供日程提醒服务，协助医生管理自己的日程，为广大客户与医生之间提供良好沟通的桥梁。</p>
					</div>
				</div>
				<div class="col-sm-6 col-md-3">
					<div class="widget widget_contact">
						<div class="section_title">
							<h4>联系我们</h4>
						</div>
						<ul>
							<li class="address">杭州市江干区民心路100号万银国际大厦2302</li>
							<li class="phone">+86 571 88832999</li>
							<li class="phone">+86 571 87897099</li>
							<li class="email"><a href="mailto:will.wu@holier.cn">will.wu@holier.cn</a></li>
						</ul>
					</div>
				</div>
				<div class="col-sm-12 col-md-6">
					<div class="widget widget_newsletter">
						
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
				<li><a href="#">首页</a></li>
				<li><a href="#">服务内容</a></li>
				<li><a href="#">服务领域</a></li>
				<li><a href="#">APP</a></li>
				<li><a href="#">关于我们</a></li>
			</ul>
		</div>
	</div>

	</main>
    <div class="modal fade" id="addImageModal" data-backdrop="false" tabindex="-1" role="dialog" aria-labelledby="addImageModalLabel" aria-hidden="true">
           <div class="modal-dialog">
              <div class="modal-content">
                 <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="addImageModalLabel">欢迎您咨询留言</h4>
                 </div>
                 <div class="modal-body">
                    <div class="modal-contact">
                        <span class="glyphicon glyphicon-hand-right"></span>&nbsp;&nbsp;您也可以直接拨打我们的咨询热线：&nbsp;&nbsp;<span class="glyphicon glyphicon-phone-alt phone400"></span>&nbsp;&nbsp;<span class="phone400">400-996-8881</span>
                    </div>
                    <div class="form-group">
                        <label for="check_hospital">您的姓名</label>
                        <input type="text" placeholder="您的姓名" name="name" class="form-control" value="">
                    </div>
                    <div class="form-group">
                        <label for="check_person">您的联系方式</label>
                        <input type="text" placeholder="手机号码或邮箱" name="phone" class="form-control" value="">
                    </div>
                    <div class="form-group">
                        <label for="check_report">您的咨询留言</label>
                        <textarea class="form-control notebook" rows="4" name="content" placeholder="请输入您的咨询留言"></textarea>
                    </div>
                 </div>
                 <div class="modal-footer">
                    <button type="button" class="btn btn-primary btn-block doSubmit">提交咨询</button>
                 </div>
              </div>
           </div>
        </div>
	<!-- JavaScript Files
	================================================== -->
	<script src="resources/js/jquery-1.11.0.min.js"></script>
	<script src="resources/js/bootstrap.min.js"></script>
	<script src="resources/js/jquery.appear.js"></script>
	<script src="resources/js/jquery.magnific-popup.js"></script>
	<script src="resources/js/owl.carousel.min.js"></script>
	<script src="resources/js/bootstrap-datepicker.js"></script>                          
	<script src="resources/js/script.js"></script>
	<script language="javascript">
    $(function(){
		$('.service-box').click(function(){
		    $('#addImageModal').modal();
		});
		$('.doSubmit').click(function(){
			var name = $('input[name="name"]').val();
			var phone = $('input[name="phone"]').val();
			var content = $('textarea[name="content"]').val();
			if(!content){
			    alert('请至少填写您的咨询留言！');
				return false;
			}
			alert('您的咨询留言已经提交，感谢您对好乐医的支持！');
			$('#addImageModal').modal('hide');
			$('input[name="name"]').val('');
			$('input[name="phone"]').val('');
			$('textarea[name="content"]').val('');
			/* var questArr = {
				name:name,
				phone:phone,
				content:content
			};
			var questURL = 'submitAdvice.do';
			$.post(questURL,questArr,function(result){
				if(1==result.status){
					alert('您的咨询留言已经提交，感谢您对好乐医的支持！');
					$('#addImageModal').modal('hide');
				}else{
					alert('提交失败！');
					return false;
				}
			}); */
		});
	});
    </script>
</body>
</html>