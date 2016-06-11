

<%@ taglib uri="Mytag" prefix="Layout"%>
<Layout:overwrite name="import">
<%@page import="com.Manager.Bean.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page import="com.Manager.Communication.*" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
</Layout:overwrite>
<Layout:overwrite name="title">
编辑联系人
</Layout:overwrite>
<%-- <Layout:overwrite name="Mycss"></Layout:overwrite> --%>
<Layout:overwrite name="MyContent">
	<div class="row-fluid">
        <div class="span12">
            <ul class="breadcrumb">
                <li>
                    <i class="icon-home"></i>
                    <a href="Weclome.jsp">首页</a>
                    <i class="icon-angle-right"></i>
                </li>
                <li>
                    <a href="javascript:">通讯录管理</a><i class="icon-angle-right"></i>
                </li>
                <li>
                    <a href="javascript:">编辑联系人</a><i class="icon-angle-right"></i>
                </li>
            </ul>
        </div>
    </div>
    <div class="clearfix"></div>
<div class="row-fluid">
        <div class="span12">
            <div class="portlet box green">
                <div class="portlet-title">
                    <div class="caption">
                        <i class="icon-reorder"></i>
                        <span class="NavTitle">修改联系人信息</span>
                    </div>
                    <div class="tools">
                        <a href="javascript:;" class="collapse"></a>
                    </div>
                </div>
               
                <div class="portlet-body form">
                    <form  method="post"  id="myform" class="form-horizontal" novalidate="novalidate">
                        <input type="text" name="ID" id="ID" value="${Contact.getID()}" style="display:none;"/>
                        <div class="control-group">
                            <label class="control-label">姓名</label>
                            <div class="controls">
                               <input type="text" name="Name" id="Name" class="span6 m-wrap popovers" data-trigger="hover" data-content="请修改名字" data-input="text" data-maxlength="250" value="${Contact.getName()}" required />
                    			
                        
                                <span style="color: red;" id="spanName"></span>
                            </div>
                        </div>
                        
                        <div class="control-group">
                            <label class="control-label">性别&nbsp;</label>
                            <div class="controls" >
                                <input type="radio" name="sex" id="sex1" class="span6 m-wrap popovers"value="男" <c:if test="${Contact.getSex()=='男'}"> checked='checked'</c:if> required /><span style="position:relative;top:4px;">男</span>
                                <input type="radio" name="sex" id="sex2" class="span6 m-wrap popovers"value="女" <c:if test="${Contact.getSex()=='女'}"> checked='checked'</c:if> required /><span  style="position:relative;top:4px;">女</span>
                                <span style="color: red;" id="spanOriginalPrice"></span>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">电话&nbsp;</label>
                            <div class="controls">
                                <input type="text" name="phone" id="phone" class="span6 m-wrap popovers" data-trigger="hover" data-content="" data-input="text" data-maxlength="250" value="${Contact.getPhone() }" required />
                                <span style="color: red;" id="spanphone"></span>
                            </div>
                        </div>
                       
                        <div class="control-group">
                            <label class="control-label">邮箱</label>
                            <div class="controls">
                                <input type="email" name="email" id="email" class="span6 m-wrap popovers" data-trigger="hover" data-content="" data-input="text" data-maxlength="250" value="${Contact.getEmail() }" required />
                                <span style="color: red;" id="spanemail"></span>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">出生年月</label>
                            <div class="controls">
                                <input type="date" name="Birthday" id="Birthday" class="span6 m-wrap popovers" data-trigger="hover" data-content="" data-input="text" data-maxlength="250" value="${fn:substring(Contact.getBirthday(), 0, 10) }"required />
                                <span style="color: red;" id="spanBirthday"></span>
                            </div>
                        </div>
                        	
                        <div class="control-group">
                            <label class="control-label">QQ</label>
                            <div class="controls">
                                <input type="text" name="QQ" id="QQ" class="span6 m-wrap popovers" data-trigger="hover" data-content="" data-input="text" data-maxlength="250" value="${Contact.getQQ() }"required />
                                <span style="color: red;" id="spanQQ"></span>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">工作地址</label>
                            <div class="controls">
                                <input type="text" name="workAdress" id="workAdress" class="span6 m-wrap popovers" data-trigger="hover" data-content="" data-input="text" data-maxlength="250" value="${Contact.getWorkAddress() }"required />
                                <span style="color: red;" id="spanworkAdress"></span>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">家庭地址</label>
                            <div class="controls">
                                <input type="text" name="HomeAdress" id="HomeAdress" class="span6 m-wrap popovers" data-trigger="hover" data-content="" data-input="text" data-maxlength="250" value="${Contact.getHomeAddress() }"required />
                                <span style="color: red;" id="spanHomeAdress"></span>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">邮编</label>
                            <div class="controls">
                                <input type="text" name="Code" id="Code" class="span6 m-wrap popovers" data-trigger="hover" data-content="" data-input="text" data-maxlength="250" value="${Contact.getCode() }" required />
                                <span style="color: red;" id="spanCode"></span>
                            </div>
                        </div>
                       
                         
                        <div class="form-actions">
                            <input type="botton" style="width:100px;" class="btn yellow" onclick="sumbitCheck();"value="确认修改"/>
                            <a type="button" class="btn green" href="javascript:void(0);" onclick="Clear();">清空</a>
                          <!--   @*<a type="button" class="btn green" href="javascript:void(0);" onclick="GoBack();">返回</a>*@ -->
                        </div>
                    </form>
                    <%-- <%
                    }
                    %> --%>
                </div>
            </div>
        </div>
    </div>
    
</Layout:overwrite>
<Layout:overwrite name="MyScript">
	<script>
	function checkEmail(email){
		var check=/^[a-z0-9]+([._\\-]*[a-z0-9])*@([a-z0-9]+[-a-z0-9]*[a-z0-9]+.){1,63}[a-z0-9]+$/;
		return  check.test(email);
	}
	function checkPhone(phone){
		return !!phone.match(/^(0|86|17951)?(13[0-9]|15[012356789]|17[678]|18[0-9]|14[57])[0-9]{8}$/);
	}
	function sumbitCheck(){
		alert("ll");
		var ID=$("#ID").val();
		var user=$("#Name").val().trim();
		var sex = $(":radio[name='sex']:checked").val();
		var email=$("#email").val().trim();
		var phone=$("#phone").val().trim();
		var QQ=$("#QQ").val().trim();
		var workAdress=$("#workAdress").val().trim();
		var HomeAdress=$("#HomeAdress").val().trim();
		var Birthday=$("#Birthday").val().trim();
		var Code=$("#Code").val().trim();
		if(user!=""&&user!=null){
			$("#spanName").html("true");	
			$("#spanName").css("color","#fff");
		}
		else{		
			$("#spanName").html("用户名不能为空");
			$("#spanName").css("color","red");
			return false;
		}
		if(email!=""&& email!=null&&checkEmail(email)){
			$("#spanemail").html("TRUE");
			$("#spanemail").css("color","#fff");
		}
		else if(!checkEmail(email)){	
			$("#spanemail").html("邮箱格式不正确");
			$("#spanemail").css("color","red");
			
			return false;
		}
		else{
			$("#spanemail").innerHTML="";
		}
		if(phone!=""&&phone!=null&&checkPhone(phone)){
			$("#spanphone").html("TRUE");
			$("#spanphone").css("color","#fff");
		}
		else if(!checkPhone(phone)){
			$("#spanphone").html("电话格式不正确");
			$("#spanphone").css("color","red");
			return false;
		}
		else{
			$("#spanPhone").html("");
		}
		Clear();
		 $.ajax({
             url: "com.Manager.Communication/UpdateContact",
             type: "POST",
             data: {
            	 ID:ID,user:user,sex:sex,email:email,phone:phone,QQ:QQ,workAdress:workAdress,HomeAdress:HomeAdress,Code:Code,Birthday:Birthday
             },
             dataType: "json",
             success: function (result) {
                 if (result.code == 1) { 
                	 Clear();     
                     noty({ text: "成功修改", type: 'information', layout: 'center', timeout: 2000 });  
                     setTimeout(function () { window.location='CommunicationView/ContactList.jsp?active=menupage6_6' ;}, 1000);
                   
                 }
                 else {
                     noty({ text: "修改失败", type: 'warning', layout: 'center', timeout: 2000 });
                 }
             },
             error: function () {
                 noty({ text: "检查网络设置", type: 'warning', layout: 'center', timeout: 2000 });
             }

         });
		return true;
		
	};
	//清空
	function Clear() {
		$(':input','#myform') 
		.not(':button, :reset, :hidden') 
		.val('') 
		.removeAttr('checked') 
		.removeAttr('selected');
	};
	 
	 
	 
	</script>
</Layout:overwrite>

<%@ include file="/share/_Layout.jsp"%>