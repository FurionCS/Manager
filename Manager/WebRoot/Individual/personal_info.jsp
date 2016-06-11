<%@ taglib uri="Mytag" prefix="Layout"%>
<Layout:overwrite name="title">
个人信息管理
</Layout:overwrite>
<Layout:overwrite name="Mycss">
<link href="Content/bootstrap/bootstrap-fileupload.css" rel="stylesheet" type="text/css" />
<link href="Content/bootstrap/chosen.css" rel="stylesheet" type="text/css" />
<link href="Content/bootstrap/profile.css" rel="stylesheet" type="text/css" />
<style>
	.red{color:red}
	#spanAboutMe{
		position:relative;
		top:78px;
	}
  </style>
</Layout:overwrite>

<Layout:overwrite name="MyContent">
			<!-- END SAMPLE PORTLET CONFIGURATION MODAL FORM-->

			<!-- BEGIN PAGE CONTAINER-->

			<div class="container-fluid">

				<!-- BEGIN PAGE HEADER-->

				<div class="row-fluid">
					<div class="span12">			
						<ul class="breadcrumb">
							<li>
								<i class="icon-home"></i>
								<a href="index.html">Home</a> 
								<i class="icon-angle-right"></i>
							</li>
							<li>
								<a href="#">Extra</a>
								<i class="icon-angle-right"></i>
							</li>
							<li><a href="#">User Profile</a></li>
						</ul>
						<!-- END PAGE TITLE & BREADCRUMB-->
					</div>
				</div>
				<!-- END PAGE HEADER-->
				<!-- BEGIN PAGE CONTENT-->
				<div class="row-fluid profile">
					<div class="span12">
						<!--BEGIN TABS-->
						<div class="tabbable tabbable-custom tabbable-full-width">
							<ul class="nav nav-tabs">		
								<li class="active"><a href="#tab_1_1" data-toggle="tab">个人信息</a></li>
								<li><a href="#tab_1_3" data-toggle="tab">信息设置</a></li>
								<li><a href="#tab_1_6" data-toggle="tab">帮助</a></li>
							</ul>
							<div class="tab-content">
								<div class="tab-pane profile-classic row-fluid active" id="tab_1_1">
									<div class="span2"><img src="${login.get(0).getHeadUrl() }" alt="" /> </div>
									<ul class="unstyled span10">
										<li><span>姓名</span> ${login.get(0).getUserName() }</li>
										<li><span>邮件</span> ${login.get(0).getEmail() }</li>
										<li><span>电话</span> ${login.get(0).getPhone() }</li>
										<li><span>部门</span>  ${login.get(0).getDept() }</li>
										<li><span>工作</span>  ${login.get(0).getJob() }</li>
										<li><span>注册时间</span>  ${login.get(0).getStartTime() }</li>
										<li><span>最近登入时间</span> ${login.get(0).getLastTime() }</li>
										<li><span>介绍</span> ${login.get(0).getAboutMe() }</li>
									</ul>
								</div>
								<!--tab_1_2-->
								<div class="tab-pane row-fluid profile-account" id="tab_1_3">
									<div class="row-fluid">
										<div class="span12">
										<div class="span3">
												<ul class="ver-inline-menu tabbable margin-bottom-10">
													<li class="active">
														<a data-toggle="tab" href="#tab_1-1">
														<i class="icon-cog"></i> 
														基本信息设置
														</a> 
														<span class="after"></span>                                    
													</li>
													<li class=""><a data-toggle="tab" href="#tab_2-2"><i class="icon-picture"></i>修改头像</a></li>
													<li class=""><a data-toggle="tab" href="#tab_3-3"><i class="icon-lock"></i>修改密码</a></li>
												</ul>
											</div>
											<div class="span9">
												<div class="tab-content">
													<div id="tab_1-1" class="tab-pane active">
														<div style="height: auto;" id="accordion1-1" class="accordion collapse">
															<form action="#">
																<input type="text" id="IDinfo" value="${login.get(0).getID()}" style="display:none"/>
																<label class="control-label">姓名</label>
																<input type="text" id="Nameinfo"placeholder="请填入姓名"value="${login.get(0).getUserName()}" class="m-wrap span8" /><span id="spanName" class="red"></span>
																<label class="control-label">邮件</label>
																<input type="text" id="Emailinfo"placeholder="请填入联系邮件" value="${login.get(0).getEmail()}"class="m-wrap span8" /><span id="spanEmail" class="red"></span>
																<label class="control-label">电话</label>
																<input type="text" id="Phoneinfo"placeholder="请填入联系电话"value="${login.get(0).getPhone()}" class="m-wrap span8" /><span id="spanPhone" class="red"></span>
																<label class="control-label">部门</label>
																<input type="text" id="Deptinfo"placeholder="请填入部门" value="${login.get(0).getDept()}"class="m-wrap span8" /><span id="spanDept" class="red"></span>
																<label class="control-label">工作</label>
																<input type="text" id="Jobinfo"placeholder="请填入工作" value="${login.get(0).getJob()}" class="m-wrap span8" /><span id="spanJob" class="red"></span>
																<label class="control-label">介绍</label>
																<textarea class="span8 m-wrap" id="AboutMeinfo"rows="4">${login.get(0).getAboutMe()}</textarea><span id="spanAboutMe" ><b id="num"></b></span>
																<div class="submit-btn">
																	<a href="javascript:void(0)" id="saveChangeInfo" class="btn green">保存修改</a>
																	<a href="javascript:void(0)" class="btn">取消</a>
																</div>
															</form>
														</div>
													</div>
													<div id="tab_2-2" class="tab-pane">
														<div style="height: auto;" id="accordion2-2" class="accordion collapse">
															<form action="com.Manager.Util/SmartUploadServlet" method="post" enctype="multipart/form-data">
																<p>Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod.</p>
																<br />
																<div class="controls">
																	<div class="thumbnail" style="width: 291px; height: 220px;">
																		<img src="${login.get(0).getHeadUrl() }" alt="旧头像" Style="width:220px"/>
																	</div>
																</div>
																<div class="space10"></div>
																<div class="fileupload fileupload-new" data-provides="fileupload">
																	<div class="input-append">
																		<div class="uneditable-input">
																			<i class="icon-file fileupload-exists"></i> 
																			<span class="fileupload-preview"></span>
																		</div>
																		<span class="btn btn-file">
																		<span class="fileupload-new">Select file</span>
																		<span class="fileupload-exists">Change</span>
																		<input type="file" class="default" name="myHead"/>
																		</span>
																		<a href="#" class="btn fileupload-exists" data-dismiss="fileupload">Remove</a>
																	</div>
																</div>
																<div class="clearfix"></div>													
																
																<div class="submit-btn">
																	<input type="submit" class="btn green" value="Submit"/>
																	
																	<a href="#" class="btn">Cancel</a>
																</div>
															</form>
														</div>
													</div>
													<div id="tab_3-3" class="tab-pane">
														<div style="height: auto;" id="accordion3-3" class="accordion collapse">
															<form action="#">
																<label class="control-label" >旧密码</label>
																<input type="password" class="m-wrap span8" id="txtOldPassword"/>
																<label class="control-label" >新密码</label>
																<input type="password" class="m-wrap span8" id="txtNewPassword"/>
																<label class="control-label">重复新密码</label>
																<input type="password" class="m-wrap span8" id="txtReNewPassword" />
																<div class="submit-btn">
																	 <a class="btn green" onclick="passwordSave()">修改密码</a>
																	<a href="#" class="btn">取消</a>
																	<span id="passwordMessage"></span>
																</div>
															</form>
														</div>
													</div>
												</div>
											</div>
											<!--end span9-->                                   
									</div>
									</div>
								</div>
								<!--end tab-pane-->							
								<div class="tab-pane row-fluid" id="tab_1_6">

									<div class="row-fluid">

										<div class="span12">

											<div class="span3">

												<ul class="ver-inline-menu tabbable margin-bottom-10">

													<li class="active">

														<a data-toggle="tab" href="#tab_1">

														<i class="icon-briefcase"></i> 
													系统简介
														</a> 
														<span class="after"></span>                                    
													</li>
													<li><a data-toggle="tab" href="#tab_2"><i class="icon-group"></i>安排介绍</a></li>
													<li><a data-toggle="tab" href="#tab_3"><i class="icon-leaf"></i>功能介绍</a></li>
													<!--<li><a data-toggle="tab" href="#tab_4"><i class="icon-info-sign"></i>操作简介</a></li>
													 <li><a data-toggle="tab" href="#tab_5"><i class="icon-tint"></i>关于我们</a></li> -->
												</ul>

											</div>

											<div class="span9">

												<div class="tab-content">

													<div id="tab_1" class="tab-pane active">

														<div style="height: auto;" id="accordion1" class="accordion collapse">
					
															<div class="accordion-group">

																<div class="accordion-heading">

																	<a href="#collapse_2" data-parent="#accordion1" data-toggle="collapse" class="accordion-toggle collapsed">

																	系统全称？
																	

																	</a>

																</div>

																<div class="accordion-body collapse" id="collapse_2">

																	<div class="accordion-inner">

																		起点企业后台管理系统

																	</div>

																</div>

															</div>

															<div class="accordion-group">

																<div class="accordion-heading">

																	<a href="#collapse_3" data-parent="#accordion1" data-toggle="collapse" class="accordion-toggle collapsed">

																	开发人员？

																	</a>

																</div>

																<div class="accordion-body collapse" id="collapse_3">

																	<div class="accordion-inner">

																	13信管程胜

																	</div>

																</div>

															</div>

															<div class="accordion-group">

																<div class="accordion-heading">

																	<a href="#collapse_4" data-parent="#accordion1" data-toggle="collapse" class="accordion-toggle collapsed">

																	开发语言？

																	</a>

																</div>

																<div class="accordion-body collapse" id="collapse_4">

																	<div class="accordion-inner">

																		jsp+html+css+js+java

																	</div>

																</div>

															</div>

															<div class="accordion-group">

																<div class="accordion-heading">

																	<a href="#collapse_5" data-parent="#accordion1" data-toggle="collapse" class="accordion-toggle collapsed">

																	开发时间？

																	</a>

																</div>

																<div class="accordion-body collapse" id="collapse_5">

																	<div class="accordion-inner">

																	15-16第一学年
																	</div>

																</div>

															</div>

															<div class="accordion-group">

																<div class="accordion-heading">

																	<a href="#collapse_6" data-parent="#accordion1" data-toggle="collapse" class="accordion-toggle collapsed">

																	上线时间？

																	</a>

																</div>

																<div class="accordion-body collapse" id="collapse_6">

																	<div class="accordion-inner">

																		待定

																	</div>

																</div>

															</div>

														</div>

													</div>

													<div id="tab_2" class="tab-pane">

														<div style="height: auto;" id="accordion2" class="accordion collapse">

															<div class="accordion-group">

																<div class="accordion-heading">

																	<a href="#collapse_2_1" data-parent="#accordion2" data-toggle="collapse" class="accordion-toggle collapsed">

																	需求分析

																	</a>

																</div>

																<div class="accordion-body collapse in" id="collapse_2_1">

																	<div class="accordion-inner">

																		Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod.

																	</div>

																</div>

															</div>

															<div class="accordion-group">

																<div class="accordion-heading">

																	<a href="#collapse_2_2" data-parent="#accordion2" data-toggle="collapse" class="accordion-toggle collapsed">

																	数据库设计

																	</a>

																</div>

																<div class="accordion-body collapse" id="collapse_2_2">

																	<div class="accordion-inner">

																		Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor.

																	</div>

																</div>

															</div>

															<div class="accordion-group">

																<div class="accordion-heading">

																	<a href="#collapse_2_3" data-parent="#accordion2" data-toggle="collapse" class="accordion-toggle collapsed">

																	静态页面设计

																	</a>

																</div>

																<div class="accordion-body collapse" id="collapse_2_3">

																	<div class="accordion-inner">

																		Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor.

																	</div>

																</div>

															</div>

															<div class="accordion-group">

																<div class="accordion-heading">

																	<a href="#collapse_2_4" data-parent="#accordion2" data-toggle="collapse" class="accordion-toggle collapsed">

																后台业务逻辑编写

																	</a>

																</div>

																<div class="accordion-body collapse" id="collapse_2_4">

																	<div class="accordion-inner">

																		Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor.

																	</div>

																</div>

															</div>

															<div class="accordion-group">

																<div class="accordion-heading">

																	<a href="#collapse_2_5" data-parent="#accordion2" data-toggle="collapse" class="accordion-toggle collapsed">

																	打通前后台

																	</a>

																</div>

																<div class="accordion-body collapse" id="collapse_2_5">

																	<div class="accordion-inner">

																		<p>

																			Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor.

																		</p>

																		<p> 

																			moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmodBrunch 3 wolf moon tempor

																		</p>

																	</div>

																</div>

															</div>

															<div class="accordion-group">

																<div class="accordion-heading">

																	<a href="#collapse_2_6" data-parent="#accordion2" data-toggle="collapse" class="accordion-toggle collapsed">

																	黑白测试

																	</a>

																</div>

																<div class="accordion-body collapse" id="collapse_2_6">

																	<div class="accordion-inner">

																		Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor.

																	</div>

																</div>

															</div>

															<div class="accordion-group">

																<div class="accordion-heading">

																	<a href="#collapse_2_7" data-parent="#accordion2" data-toggle="collapse" class="accordion-toggle collapsed">

																	上线

																	</a>

																</div>

																<div class="accordion-body collapse" id="collapse_2_7">

																	<div class="accordion-inner">

																		<p>

																			Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor.

																		</p>

																		<p> 

																			moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmodBrunch 3 wolf moon tempor

																		</p>

																	</div>

																</div>

															</div>

														</div>

													</div>
												
													<div id="tab_3" class="tab-pane">

														<div style="height: auto;" id="accordion2" class="accordion collapse">

															<div class="accordion-group">

																<div class="accordion-heading">

																	<a href="#collapse_3_1" data-parent="#accordion2" data-toggle="collapse" class="accordion-toggle collapsed">

																	基本功能说明

																	</a>

																</div>

																<div class="accordion-body collapse in" id="collapse_3_1">

																	<div class="accordion-inner">

																	实现了通讯录管理的基本增删改查，实现短消息管理的发布，接受，一键已读等功能，实现了个人管理模块的基本信息查看和修改，实现公司公告展示模块等等

																	</div>

																</div>

															</div>

															<div class="accordion-group">

																<div class="accordion-heading">

																	<a href="#collapse_3_2" data-parent="#accordion2" data-toggle="collapse" class="accordion-toggle collapsed">

																	增强模块

																	</a>

																</div>

																<div class="accordion-body collapse" id="collapse_3_2">

																	<div class="accordion-inner">

																		实现了邮件发送功能，实现了个人日历模块，实现了首页的趋势图模块等等

																	</div>

																</div>

															</div>

															<div class="accordion-group">

																<div class="accordion-heading">

																	<a href="#collapse_3_3" data-parent="#accordion2" data-toggle="collapse" class="accordion-toggle collapsed">

																	未来功能

																	</a>

																</div>

																<div class="accordion-body collapse" id="collapse_3_3">

																	<div class="accordion-inner">

																		实现智能机器人的接入，实现从其他网站获取信息的功能等等

																	</div>

																</div>

															</div>

															
															</div>

														</div>
						
													</div>
													</div>
												
												
										
												</div>
											</div>
											<!--end span9-->                                   
										</div>
									</div>
								</div>
							<!--end tab-pane-->
						</div>
						</div>
						<!--END TABS-->
					</div>
				</div>
				<!-- END PAGE CONTENT-->
			</div>
			<!-- END PAGE CONTAINER-->   
</Layout:overwrite>
<Layout:overwrite name="MyScript">
	<script>
	document.getElementById("AboutMeinfo").onkeyup=function(){
		if(this.value.length<=250){
			document.getElementById("spanAboutMe").innerHTML="已输入<b id='num'>0</b>个字";
			document.getElementById("num").innerHTML=this.value.length;
			document.getElementById("spanAboutMe").style.color="#999";
		}
		else{
			document.getElementById("spanAboutMe").innerHTML="已经超出字数限制";
			document.getElementById("spanAboutMe").style.color="red";
		}
	};
	function checkEmail(email){
		var check=/^[a-z0-9]+([._\\-]*[a-z0-9])*@([a-z0-9]+[-a-z0-9]*[a-z0-9]+.){1,63}[a-z0-9]+$/;
		return  check.test(email);
	}
	function checkPhone(phone){
		return !!phone.match(/^(0|86|17951)?(13[0-9]|15[012356789]|17[678]|18[0-9]|14[57])[0-9]{8}$/);
	}
		$("#saveChangeInfo").click(function(){		
			var ID=$("#IDinfo").val();	
			var Name=$("#Nameinfo").val();	
			var Email=$("#Emailinfo").val();
			
			if(!checkEmail(Email)){		
				$("#spanEmail").html("邮箱格式有误");
				return false;
			}else{$("#spanEmail").html("");}
			var Phone=$("#Phoneinfo").val();
			if(!checkPhone(Phone)){
				$("#spanPhone").html("电话格式有误");
				return false;
			}else{$("#spanPhone").html();}
			var AboutMe=$("#AboutMeinfo").val();
			 if(AboutMe.length<=250){
				document.getElementById("spanAboutMe").innerHTML="已输入<b id='num'>0</b>个字";
				document.getElementById("num").innerHTML=AboutMe.length;
				document.getElementById("spanAboutMe").style.color="#999";			
			}else{		
				document.getElementById("spanAboutMe").innerHTML="已经超出字数限制";
				document.getElementById("spanAboutMe").style.color="red";
				return false;
			} 
			
			 var Dept=$("#Deptinfo").val();
			 var Job=$("#Jobinfo").val();
			 
			 $.ajax({
			        url: "com.Manager.Individual/UpdateInfo",
			        type: "POST",
			        data: {
			        	ID:ID,Name:Name,Email:Email,Phone:Phone,AboutMe:AboutMe,Dept:Dept,Job:Job
			        },
			        dataType: "json",
			        success: function (result) {
			            if (result.code == 1) {	       			
			                noty({ text: "修改成功！", type: "success", layout: "topCenter", timeout: 3000 }); 		               
			                setTimeout(function () { window.location='Individual/personal_info.jsp?active=menupage5_0' ;}, 1000);
			            }
			            else {
			                noty({ text: "修改失败！"+result.result, type: "warning", layout: "topCenter", timeout: 3000 });
			            }
			        },
			        error: function () {
			            console.log("error");
			        }
			    }); 
		});
		 //密码修改
        function passwordSave() {
            var txtOldPassword = $("#txtOldPassword").val();
            var txtNewPassword = $("#txtNewPassword").val();
            var txtReNewPassword = $("#txtReNewPassword").val();
            //验证处理
            if (txtOldPassword == "") {
                $("#passwordMessage").text("旧密码不能为空!!!");
                return;
            }
            if (txtNewPassword == "") {
                $("#passwordMessage").text("新密码不能为空!!!");
                return;
            }
            if (txtNewPassword != txtReNewPassword) {
                $("#passwordMessage").text("两次密码不一致!!!");
                return;
            }
            if (txtOldPassword == txtReNewPassword) {
                $("#passwordMessage").text("新密码不能和旧密码一样!!!");
                return;
            }
            $.ajax({
                url: "com.Manager.Home/ChangePassword",
                type: "post",
                dataType: "json",
                data: { "OldPassword": txtOldPassword, "NewPassword": txtNewPassword },
                success: function (data) {
                    if (data.code == 1) {
                        $("#passwordMessage").text(data.msg);
                        noty({ text: "修改成功！", type: "success", layout: "topCenter", timeout: 3000 }); 		               
                        window.setTimeout("window.location='com.Manager.Home/LoginOut'", 3000);
                    }
                    else if(data.code==0){
                    	 noty({ text: "修改失败!原因："+data.msg, type: "warning", layout: "topCenter", timeout: 3000 });
                        $("#passwordMessage").text(data.msg);
                    }
                    else{
                    	noty({ text: "修改失败!原因："+data.msg, type: "warning", layout: "topCenter", timeout: 3000 });
                    	$("#passwordMessage").text(data.msg);
                    }
                },
                error: function () {
                    $("#passwordMessage").text("网络数据访问失败");
                }

            });  
        }  
	</script>
</Layout:overwrite>
<%@ include file="/share/_Layout.jsp"%>