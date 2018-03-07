<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ include file="runParams.html"%>
<form class="navbar-form navbar-right" role="add">
	<div class="btn-group">
		<button type="button" class="btn btn-primary" data-toggle="modal"
			data-target="#docModal">新增医生</button>
		<button type="button" class="btn btn-primary" data-toggle="modal"
			data-target="#patModal">新增患者</button>
	</div>
</form>
<!-- 医生的模态框 -->
<div class="modal fade" id="docModal" data-backdrop="false"
	tabindex="-1" role="dialog" aria-labelledby="docModalLabel"
	aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="docModalLabel">新增一个医生账户</h4>
			</div>
			<div class="modal-body">
				<div class="form-group">
					<label for="doctorId">账户ID</label> <input type="text"
						class="form-control" name="doctorId" placeholder="请输入手机号码">
				</div>
				<div class="form-group">
					<label for="doctorName">医生姓名</label> <input type="text"
						class="form-control" name="doctorName" placeholder="请输入医生姓名">
				</div>
				<div class="form-group">
					<label for="type">分组</label> <select class="form-control"
						name="type">
						<option value="医生" selected>医生</option>
						<option value="护士">护士</option>
					</select>   
				</div> 
				<div class="form-group dropdown selectSimulate selectSimulate2">
					<label for="doctorSex">医生性别</label> <input type="hidden"
						name="doctorSex" value="男" class="selectData">
					<button type="button" class="btn dropdown-toggle"
						data-toggle="dropdown" onFocus="this.blur()">
						男<span class="caret"></span>
					</button>
					<ul class="dropdown-menu">
						<li><a tabindex="-1" href="#" onFocus="this.blur()"
							data-val="男">男</a></li>
						<li class="divider"></li>
						<li><a tabindex="-1" href="#" onFocus="this.blur()"
							data-val="女">女</a></li>
					</ul>
				</div>
				<div class="form-group smartSearch">
					<label for="referHospital">所属医院（如有多个请用“，”隔开）</label> <input
						type="text" class="form-control" name="referHospital"
						placeholder="请输入所属医院">
						<ul  class="searchResultForHospital"></ul>
				</div>
				<div class="form-group">
					<label for="referDepartments">所属主科室（如有多个请用“，”隔开）</label> <input
						type="text" class="form-control" name="referDepartments"
						placeholder="请输入所属主科室">
				</div>
				<div class="form-group">
					<label for="subreferDepartments">所属二级科室（如有多个请用“，”隔开）</label> <input
						type="text" class="form-control" name="subreferDepartments"
						placeholder="请输入所属二级科室">
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<button type="button" class="btn btn-primary" id="addDoc">确认添加</button>
			</div>
		</div>
	</div>
</div>
<!-- 病人的模态框 -->
<div class="modal fade" id="patModal" data-backdrop="false"
	tabindex="-1" role="dialog" aria-labelledby="patModalLabel"
	aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="patModalLabel">新增一个患者账户</h4>
			</div>
			<div class="modal-body">
				<div class="form-group">
					<label for="patientId">账户ID</label> <input type="text"
						class="form-control" name="patientId" placeholder="请输入手机号码">
				</div>

				<div class="form-group">
					<label for="patientName">姓名</label> <input type="text"
						class="form-control" name="patientName" placeholder="请输入姓名">
				</div>
				<div class="form-group dropdown selectSimulate selectSimulate2">
					<label for="patientSex">性别</label> <input type="hidden"
						name="patientSex" value="男" class="selectData">
					<button type="button" class="btn dropdown-toggle"
						data-toggle="dropdown" onFocus="this.blur()">
						男<span class="caret"></span>
					</button>
					<ul class="dropdown-menu">
						<li><a tabindex="-1" href="#" onFocus="this.blur()"
							data-val="男">男</a></li>
						<li class="divider"></li>
						<li><a tabindex="-1" href="#" onFocus="this.blur()"
							data-val="女">女</a></li>
					</ul>
				</div>
				<div class="form-group smartSearch">
					<label for="filingHospital">建档医院</label> <input type="text"
						class="form-control" name="filingHospital" placeholder="请输入建档医院">
						<ul  class="searchResultForHospital"></ul>
				</div>
				<div class="form-group smartSearch">
					<label for="currentHospital">当前医院</label> <input type="text"
						class="form-control" name="currentHospital" placeholder="请输入当前医院">
						<ul  class="searchResultForHospital"></ul>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<button type="button" class="btn btn-primary" id="addPat">确认添加</button>
			</div>
		</div>
	</div>
</div>