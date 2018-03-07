<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=”zh”> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang=”zh”> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9" lang=”zh”> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js" lang=”zh”>
<!--<![endif]-->
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<%@ include file="./commons/runParams.html"%>
<title>OP后台</title>
<meta name="description" content="">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
        <link href="assets/library/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="assets/plugins/nprogress/nprogress.css" rel="stylesheet">
        <link href="assets/library/icons/pictoicons/css/picto-foundry-medical-science.css" rel="stylesheet">
        <link href="assets/library/icons/pictoicons/css/picto-foundry-general.css" rel="stylesheet">
        <link href="assets/library/icons/glyphicons/assets/css/glyphicons_regular.css" rel="stylesheet">
        <link href="assets/css/productAdmin/frame.css" rel="stylesheet">
        <link href="assets/css/productAdmin/beansOperation.css" rel="stylesheet">
        <!--[if lt IE 9]>
            <script src="assets/library/respond/respond.js"></script>
        <![endif]-->
<script src="assets/library/modernizr/modernizr.js"></script>
<style>
.searchBar{ margin-top:0;}
#productStatus{ margin:12px; margin-bottom:0;}
.nav-tabs > li > a{background:#dedede;}
</style>
</head>
<body>
	<!--[if lt IE 7]>
            <p style="margin:0.2em 0;background:#ccc;color:#000;padding:0.2em 0;">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->

	<div class="container-fluid">
		<%@ include file="./commons/leftMenu.jsp"%>
		<div id="content">
			<%@ include file="./commons/topMenu.jsp"%>
                <ol class="breadcrumb webmap">
                  <li><a href="#">Home</a></li>
                  <li class="active">银币添补历史</li>
                </ol>
                <ul id="productStatus" class="nav nav-tabs">
                   <li><a href="JBOperation.html" onfocus="this.blur()">金币添补</a></li>
				   <li class="active"><a href="javascript:void(0)" onfocus="this.blur()">银币添补</a></li>
			    </ul>
                <div class="searchBar row">
                    <div class="smartSearch col-md-4 col-xs-4">
                        <form action="searchDocResult.do" method="post" name="searchDocForm" id="searchDocForm">
                        <div class="input-group">
                           <input type="hidden" name="docId" value="">
                           <input type="text" class="form-control" name="searchDoc" placeholder="搜索医生" autocomplete="off">
                           <input type="hidden" name="token" value="${token}">
                           <span class="input-group-addon"><i class="glyphicon glyphicon-search"></i></span>  
                        </div>
                        <ul class="searchResult"></ul>
                        </form>
                    </div>
                    <div class="addPat col-md-8 col-xs-8">
                        <button type="button" class="btn btn-primary pull-right" onFocus="this.blur()"><span class="glyphicon glyphicon-plus-sign"></span>银币添补</button>
                    </div>
                </div>
                <div class="mainBody">
                  <!--如果找到用户 srart-->
                  <table class="table table-striped table-hover">
                   <thead>
                      <tr>
                         <th>操作号</th>
                         <th>对象医生</th>
                         <th>添补额度</th>
                         <th>添扣</th>
                         <th>操作时间</th>
                         <th>操作者</th>
                         <th>操作</th>
                      </tr>
                   </thead>
                   <tbody>
                      <c:if test="${nohistory == true}">
                      <tr>
                         <td colspan="7">暂无银豆操作历史。</td>
                      </tr>
                      </c:if>
                      <c:forEach items="${yro.historys}" var="yh">
                      <tr>
                         <td>${yh.historyId}</td>
                         <td>${yh.accountName}</td>
                         <td>${yh.amount}</td>
                         <td>${yh.type}</td>
                         <td>${yh.time_str}</td>
                         <td>${yh.writePerson}</td>
                         <td class="td1"><a href="javascript:void(0)" data-id="${yh.historyId}" class="detail"><span class="glyphicon glyphicon-zoom-in"></span>详情</a></td>
                      </tr>
                      </c:forEach>
                   </tbody>
                  </table>
                  <div align="center">
                      <ul class="pagination">
						<li <c:if test="${searchParam.cp == 1}"> class="disabled"</c:if>><a
							href="<c:choose><c:when test="${searchParam.cp == 1}">javascript:void(0)</c:when><c:otherwise>${mainUril}beansOperation.html?cp=${yro.pageView.back}&&ps=${searchParam.ps}</c:otherwise></c:choose>">上一页</a>
						</li>
						<li
							<c:if test="${yro.pageView.last == searchParam.cp}"> class="disabled"</c:if>><a
							href="<c:choose><c:when test="${yro.pageView.last == searchParam.cp}">javascript:void(0)</c:when><c:otherwise>${mainUril}beansOperation.html?cp=${yro.pageView.next}&&ps=${searchParam.ps}</c:otherwise></c:choose>">下一页</a>
						</li>
					</ul>
					<input type="hidden" name="page" value="${searchParam.cp}">
                  </div>
                  <!--如果找到用户 end-->
                </div>
            </div>
        </div>
        <!-- 模态框 -->
        <div class="modal fade" id="adminModal" data-backdrop="false" tabindex="-1" role="dialog" aria-labelledby="adminModalLabel" aria-hidden="true">
           <div class="modal-dialog">
              <div class="modal-content">
                 <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="adminModalLabel">银豆添补</h4>
                 </div>
                 <div class="modal-body">
                    <div class="form-group smartSearch">
                        <div>
                        <label for="doctorId">操作医生对象</label>
                        <input type="hidden" name="doctorId" value="">
                        <input type="text" class="form-control" name="doctorName" placeholder="请输入医生姓名" autocomplete="off">
                        </div>
                        <ul class="searchResultForDoctor">
                            <li><a href="javascript:void(0)"></a></li>
                        </ul>
                    </div>
                    <div class="form-group">
                        <label for="quantity">添补额度（只能填写数字）</label>
                        <input type="text" placeholder="请输入添补额度" name="quantity" class="form-control" value="0" onkeyup="value=value.replace(/[^\d]/g,'')" onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))">
                    </div>               
                    <div class="form-group">
                        <label for="type">添扣类型</label>
                        <div>
                        <label class="radio-inline"><input type="radio" name="type" value="添加" checked>添加</label>
                        <label class="radio-inline"><input type="radio" name="type" value="扣除">扣除</label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="reason">添补理由</label>
                        <textarea class="form-control notebook" rows="4" name="reason" placeholder="请输入添补理由"></textarea>
                    </div>
                 </div>
                 <div class="modal-footer">
                    <input type="hidden" name="token" value="">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" id="doSubmit">确认</button>
                 </div>
              </div>
           </div>
        </div>
         <div class="modal fade" id="detailModal" data-backdrop="false" tabindex="-1" role="dialog" aria-labelledby="detailModalLabel" aria-hidden="true">
           <div class="modal-dialog">
              <div class="modal-content">
                 <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="detailModalLabel">银豆添补详情</h4>
                 </div>
                 <div class="modal-body">
                    <table border="1" cellspacing="0" cellpadding="0" class="infoTable" width="100%">
                    <tr>
                      <td class="td1">操作医生：</td>
                      <td class="td2"><span class="d-doctorName">黄卫华</span></td>
                      <td class="td1">添补额度：</td>
                      <td class="td2"><span class="d-type">+</span><span class="d-quantity">20</span></td>
                      <td class="td1">操作时间：</td>
                      <td class="td2"><span class="d-dateTime">2015-06-20</span></td>
                    </tr>
                    <tr>
                      <td class="td1">操作号：</td>
                      <td class="td2"><span class="d-id">123156223345</span></td>
                      <td class="td1">操作者：</td>
                      <td class="td2"><span class="d-admin">梁海峰</span></td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                    </tr>
                    <tr>
                      <td class="td1">添补理由：</td>
                      <td colspan="5"><span class="d-reason">沙发上的fads发射点发生阿三，地方a，士大夫，爱的色放啊，第三方啊，第三方爱的色放， 阿三地方阿三地方爱的色放爱的色放爱的色放阿三地方爱的色放阿三地方，阿迪斯发的fads发。</span></td>
                    </tr>
                  </table>
                 </div>
                 <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                 </div>
              </div>
           </div>
        </div>
        <script src="assets/library/jquery/jquery.min.js"></script>
        <script src="assets/library/jquery/jquery-migrate.min.js"></script>
        <script src="assets/library/bootstrap/js/bootstrap.min.js"></script>
        <script src="assets/plugins/nicescroll/jquery.nicescroll.min.js"></script>
        <script src="assets/plugins/nprogress/nprogress.js"></script>
        <script src="assets/script/productAdmin/frame.js"></script>
        <script src="assets/script/productAdmin/beansOperation.js"></script>
    </body>
</html>