<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>员工列表</title>
<link
	href="${APP_PATH }/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script src="${APP_PATH }/static/js/jquery-1.12.4.min.js"></script>
<!--  加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script
	src="${APP_PATH }/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>
	<!-- 添加模态框 -->
	<div class="modal fade" id="addModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">添加员工信息</h4>
				</div>

				<div class="modal-body">
					<form class="form-horizontal">
						<div class="form-group">
							<label class="col-sm-2 control-label">empName</label>
							<div class="col-sm-10">
								<input name="empName" type="text" class="form-control"
									id="inputempName" placeholder="empName"  autocomplete="off">
									<span  class="help-block"></span>
							</div>
						</div>


						<div class="form-group">
							<label class="col-sm-2 control-label">gender</label>
							<div class="col-sm-10">
								<label class="radio-inline"> <input type="radio"
									name="gender" checked="checked" value="男"> 男
								</label> <label class="radio-inline"> <input type="radio"
									name="gender" value="女"> 女
								</label>
							</div>
						</div>


						<div class="form-group">
							<label class="col-sm-2 control-label">Email</label>
							<div class="col-sm-10">
								<input name="email" type="email" class="form-control"
									id="inputempEmail" placeholder="email" >
									<span  class="help-block"></span>
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-2 control-label">deptName</label>
							<div class="col-sm-5">
								<select class="form-control" name="dId" id="select_depts">
									<%-- <c:forEach items="${deptList}" var="dept">
										<option value="${dept.deptId }">${dept.deptName }</option>
									</c:forEach> --%>
								</select>
							</div>
						</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
								<button type="button" class="btn btn-primary" id="save_emp_btn">保存</button>
							</div>
					</form>
				</div>
				
			</div>
		</div>
	</div>


<!-- 修改模态框 -->
	<div class="modal fade" id="editModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">添加员工信息</h4>
				</div>

				<div class="modal-body">
					<form class="form-horizontal">
						<div class="form-group">
							<label class="col-sm-2 control-label">empName</label>
							<div class="col-sm-10">
								<!-- <input name="empName" type="text" class="form-control"
									id="inputEditempName" placeholder="empName"  autocomplete="off"> -->
									<p class="form-control-static" id="inputEditempName"></p>
									<span  class="help-block"></span>
							</div>
						</div>


						<div class="form-group">
							<label class="col-sm-2 control-label">gender</label>
							<div class="col-sm-10">
								<label class="radio-inline"> <input type="radio"
									name="gender" checked="checked" value="男"> 男
								</label> <label class="radio-inline"> <input type="radio"
									name="gender" value="女"> 女
								</label>
							</div>
						</div>


						<div class="form-group">
							<label class="col-sm-2 control-label">Email</label>
							<div class="col-sm-10">
								<input name="email" type="email" class="form-control"
									id="inputEditempEmail" placeholder="email" >
									<span  class="help-block"></span>
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-2 control-label">deptName</label>
							<div class="col-sm-5">
								<select class="form-control" name="dId" id="edit_select_depts">
									<%-- <c:forEach items="${deptList}" var="dept">
										<option value="${dept.deptId }">${dept.deptName }</option>
									</c:forEach> --%>
								</select>
							</div>
						</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
								<button type="button" class="btn btn-primary" id="edit_emp_btn">更新</button>
							</div>
					</form>
				</div>
				
			</div>
		</div>
	</div>
	<%-- 当前页数：${pageInfo.pageNum}
<br>
总页数：${pageInfo.pages }
<br>
<c:forEach items="${pageInfo.navigatepageNums }" var="nums">
	${nums }
</c:forEach>

数据：
<c:forEach items="${pageInfo.list}" begin="0" var="emp">
	${emp.empId }
======
	${emp.empName }
</c:forEach> --%> 
	<h1>SSM-员工管理系统</h1>
	<div class="container-fluid">
		<div class="col-md-4"></div>
		<div class="col-md-4 col-md-offset-4">

			<button class="btn btn-primary" id="add_emp">添加</button>

			<button class="btn btn-danger" id="delete_empAll">删除</button>
		</div>
		<table class="table table-hover">
			<tr>
				<td><input type="checkbox" id="check_all"></td>
				<td>#</td>
				<td>empName</td>
				<td>gender</td>
				<td>email</td>
				<td>deptName</td>
				<td>操作</td>
			</tr>
			<c:forEach items="${pageInfo.list}" var="emp">
				<tr>
					<td><input type="checkbox" class="check_item"></td>
					<td>${emp.empId }</td>
					<td>${emp.empName }</td>
					<td>${emp.gender }</td>
					<td>${emp.email }</td>
					<td>${emp.department.deptName }</td>
					<td><button class="btn btn-primary btn-xs edit_btn"  edit-id="${emp.empId }">
							<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
							编辑
						</button>
						<button class="btn btn-danger btn-xs delete_btn"  delete-id="${emp.empId }">
							<span class="glyphicon glyphicon-trash"  aria-hidden="true"></span>
							删除
						</button></td>
				</tr>
			</c:forEach>
		</table>
		<div class="row">
			<div class="col-md-6">当前第${pageInfo.pageNum }页，一共${pageInfo.pages }页，一共${pageInfo.total }条记录</div>
			<div class="col-md-6">
				<nav aria-label="Page navigation">
					<ul class="pagination">
						<li><a href="${APP_PATH }/emps?pn=1">首页</a></li>
						<c:if test="${pageInfo.hasPreviousPage }">
							<li><a href="${APP_PATH }/emps?pn=${pageInfo.pageNum-1}"
								aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
							</a></li>
						</c:if>
						<c:forEach items="${pageInfo.navigatepageNums }" var="NavPageNum">
							<c:if test="${NavPageNum==pageInfo.pageNum }">
								<li class="active"><a
									href="${APP_PATH }/emps?pn=${NavPageNum}">${NavPageNum }</a></li>
							</c:if>
							<c:if test="${NavPageNum !=pageInfo.pageNum }">
								<li><a href="${APP_PATH }/emps?pn=${NavPageNum}">${NavPageNum }</a></li>
							</c:if>
						</c:forEach>
						<c:if test="${pageInfo.hasNextPage }">
							<li><a href="${APP_PATH }/emps?pn=${pageInfo.pageNum+1}"
								aria-label="Next"> <span aria-hidden="true">&raquo;</span>
							</a></li>
						</c:if>
						<li><a href="${APP_PATH }/emps?pn=${pageInfo.pages}">末页</a></li>
					</ul>
				</nav>
			</div>
		</div>
	</div>

</body>
<script type="text/javascript">


	$(function() {
		/* 重置表单 */
		function form_reset(ele) {
			$(ele)[0].reset();
			$(ele).find("*").removeClass("has-success has-error");
			$(ele).find(".help-block").text("");
		}
		/* 模态框显示 */
		$("#add_emp").click(function() {
			form_reset("#addModal form"); 
			//$("#addModal form")[0].reset();
			getDepts("#select_depts"); 
			$("#addModal").modal({
				backdrop : "static"
			});
		});
		/* 模态框部门显示 */
		function getDepts(ele) {
			$(ele).empty();
			$.ajax({
				url:"${APP_PATH }/depts",
				type:"GET",
				success:function(result){
					$.each(result.extend.deptList,function(){
						$("<option></option>").append(this.deptName).attr("value",this.deptId).appendTo(ele);
						/* 
						var optionEle=$("<option></option>").append(this.deptName).attr("value",this.deptId)
						optionEle.appendTo("#select_depts") ;
						*/
					});
				}
			});
		}; 
		/* empName校验 */
		$("#inputempName").change(function (){
			var empName=this.value;
			$.ajax({
				url:"${APP_PATH }/changeUser",
				type:"POST",
				data:"empName="+empName,
				success:function(result){
					if(result.code==100){
						show_style("#inputempName","success",result.extend.va_msg);
						$("#save_emp_btn").attr("ajax-va","success");
					}else{
						show_style("#inputempName","error",result.extend.va_msg);
						$("#save_emp_btn").attr("ajax-va","error");
					}
				}
			})
		});
		/* 邮箱校验 */
		$("#inputempEmail").change(function (){
			var emailName=$("#inputempEmail").val();
			var regEmail=/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/;
				if(!regEmail.test(emailName)){
					show_style("#inputempEmail","error","邮箱格式错误");
					return false;
				}else {
					show_style("#inputempEmail","success","");
				}
				return true;
		});
		/* 前验证 */
		function validata_add_form() {
			var empName=$("#inputempName").val();			
			var regName=/(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})/;		
			if(!regName.test(empName)){				
				show_style("#inputempName","error","请输入2-5位中文或者6-16位英文和数字的组合");
				return false;
			}else{
				show_style("#inputempName","success","");
			}		
			var emailName=$("#inputempEmail").val();
			var regEmail=/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/;
				if(!regEmail.test(emailName)){
					show_style("#inputempEmail","error","邮箱格式错误");
					return false;
				}else {
					show_style("#inputempEmail","success","");
				}
			return true;
		}
		/* 显示校验样式 */
		function show_style(ele,status,msg){
			$(ele).parent().removeClass("has-success has-error");
			$(ele).next("span").text("");
			if("success"==status){
				$(ele).parent().addClass("has-success");
				$(ele).next("span").text(msg);
				}else if("error"==status){
					$(ele).parent().addClass("has-error");
					$(ele).next("span").text(msg);
				}
			
		}
		/* 添加员工信息 */
		$("#save_emp_btn").click(function() {
			/* 校验1 */
			if($(this).attr("ajax-va")=="error"){
				return false;
			}
			/* 校验2 */
			if(!validata_add_form()){
				return false;
			};
			/* 保存请求 */
			$.ajax({
				url:"${APP_PATH }/saveEmp",
				type:"POST",
				data:$("#addModal form").serialize(),
				success:function(result){
					if(result.code==100){
						alert("添加成功");
						$("#addModal").modal('hide');
						window.location.reload();//刷新当前页面
					}else {
						console.log(result);
						if(undefined!=result.extend.errorFieds.email){
							show_style("#inputempEmail","error",result.extend.errorFieds.email);
						}
						if(undefined!=result.extend.errorFieds.empName){
							show_style("#inputempName","error",result.extend.errorFieds.empName);
						}
					}
				}
			}); 
		});
		/* 创建删除模态框 */
		$(".edit_btn").on("click",function() {
			getDepts("#edit_select_depts");
			getemp($(this).attr("edit-id"));
			
			$("#edit_emp_btn").attr("edit-id",$(this).attr("edit-id"));
			$("#editModal").modal({
				backdrop : "static"
			});
		});
		/* 获取单条记录 */
		function getemp(id) {
			$.ajax({
				url:"${APP_PATH}/getemp/"+id,
				type:"GET",
				success:function(result){
					var empData=result.extend.employee;
					$("#inputEditempName").text(empData.empName);
					$("#inputEditempEmail").val(empData.email);
					$("#editModal input[name=gender]").val([empData.gender]);
					$("#editModal select").val([empData.dId]);
					
				}
			})
		}
		
	
		$("#edit_emp_btn").click(function () {
			/* 邮箱校验 */
			var emailName=$("#inputEditempEmail").val();
			var regEmail=/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/;
				if(!regEmail.test(emailName)){
					show_style("#inputEditempEmail","error","邮箱格式错误");
					return false;
				}else {
					show_style("#inputEditempEmail","success","");
				} 

				/* 修改 */
					$.ajax({
						url:"${APP_PATH}/updateEmp/"+$(this).attr("edit-id"),
						type:"POST",
						//data:$("#addModal form").serialize(),
						data:$("#editModal form").serialize()+"&_method=put",
						success:function(result){
							alert(result.msg);
							$("#editModal").modal('hide');
							window.location.reload();//刷新当前页面
						}
					 });
		});
		/* 删除 */
		
		$(".delete_btn").on("click",function() {
			var empNameShow=$(this).parents("tr").find("td:eq(2)").text();
			var deleteId=$(this).attr("delete-id");
			
			if(confirm("确定删除【"+empNameShow+"】吗？")){
				$.ajax({
					url:"${APP_PATH}/deleteEmp/"+deleteId,
					type:"DELETE",					
					success:function(result){
						alert(result.msg);
						$("#editModal").modal('hide');
						window.location.reload();//刷新当前页面
					}
				});
			}
		});
		
		/* 多选删除 */
		$("#check_all").click(function() {
			$(".check_item").prop("checked",$(this).prop("checked"));
		});
		
		$(".check_item").on("click",function(){
			var flag=$(".check_item:checked").length==$(".check_item").length;
			$("#check_all").prop("checked",flag);
		});
		
		
		$("#delete_empAll").click(function() {
			var eleteAllname="";
			var del_idstr="";
			$.each($(".check_item:checked"),function(){
				eleteAllname+=$(this).parents("tr").find("td:eq(2)").text()+",";
				del_idstr+=$(this).parents("tr").find("td:eq(1)").text()+"-";
			});
			eleteAllname=eleteAllname.substring(0,eleteAllname.length-1);
			del_idstr=del_idstr.substring(0,del_idstr.length-1);
			if(confirm("确认删除【"+eleteAllname+"】")){
				$.ajax({
					url:"${APP_PATH}/deleteListEmp/"+del_idstr,
					type:"DELETE",					
					success:function(result){
						alert(result.msg);
						$("#editModal").modal('hide');
						location.reload();
					}
				});
			}
		});
	});
</script>
</html>