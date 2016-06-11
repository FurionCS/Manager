<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>Registered</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="Css/config.css">
	<link rel="stylesheet" type="text/css" href="Css/Login.css">
	<link rel="stylesheet" type=text/css" href="Css/Reqistered.css">
  </head>
  
  <body>
   		<div id="main">
    <div class="logo">    
            <img src="Img/Logo.png" />
    </div>
    <!-- END LOGO -->
    <!-- BEGIN LOGIN -->
    <div class="content">
        <!-- BEGIN LOGIN FORM -->
        <form action="com.Manager.Home/Registered" method="post" onsubmit="return sumbitCheck();" >
            <h3 class="form-title">登录到你的帐户</h3>
            <div class="form-group">
                <span class="control-label">*用户ID</span>
                <input type="text" class="form-control" placeholder="请输入用户ID" id="playerID" name="playerID" value="admin"/>
            </div>
            <span id="spanUser" class='tip'> </span>
            <div class="form-group">
                <span class="control-label">*密码</span>
                <input type="password" class="form-control placeholder-no-fix" placeholder="请输入密码" id="password" name="password" value="admin" />
            </div>  
            <span id="spanPassword" class='tip'></span>
             <div class="form-group">
                <span class="control-label">*确认密码</span>
                <input type="password" class="form-control placeholder-no-fix" placeholder="请确认密码" id="surepassword" name="surepassword" value="admin" />
            </div>  
             <span id="spansurePassword" class='tip'></span>
             <div class="form-group">
                <span class="control-label">姓名</span>
                <input type="text" class="form-control placeholder-no-fix" placeholder="请填写姓名" id="" name="email" value="" />
            </div> 
            <span id="spansurePassword" class='tip'></span>
            
            <div class="form-group">
                <span class="control-label">电话</span>
                <input type="text" class="form-control placeholder-no-fix" placeholder="请填写手机号" id="phone" name="phone" value="" />
            </div>  
             <span id="spanphone" class='tip'></span>
            <div class='login'>
            	<a href="index.jsp">&lt-马上登陆</a>
            </div>         
            <div class="form-actions">
                <input type='submit' class="btnLogin" id='btnLogin' value='马上注册'/>
            </div>
        <!-- END LOGIN FORM -->
        </form>
    </div>
        </div>
    <div class="footer"><p>程胜 版权所有 2015</p></div>
      <script src="Js/Registered.js" charset="UTF-8"></script>
 	
  </body>
</html>
