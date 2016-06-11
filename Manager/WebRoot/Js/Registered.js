/**
 * 
 */


function $(id){
	return document.getElementById(id);
}

function checkPassword(pw){
		var pa=/^(?=[`~!@#\$%\^&*\(\)\-_=\+\\\|\[\]\{\}:;\"\',.<>\/\?\d]*[a-zA-Z]+)(?=[a-zA-Z`~!@#\$%\^&*\(\)\-_=\+\\\| \[\]\{\}:;\"\',.<>\/\?]*\d+)[`~!@#\$%\^&*\(\)\-_=\+\\\|\[\]\{\}:;\"\',.<>\/\?\w]{6,16}$/;
		return pa.test(pw);
	}
function checkEmail(email){
	var check=/^[a-z0-9]+([._\\-]*[a-z0-9])*@([a-z0-9]+[-a-z0-9]*[a-z0-9]+.){1,63}[a-z0-9]+$/;
	return  check.test(email);
}
function checkPhone(phone){
	return !!phone.match(/^(0|86|17951)?(13[0-9]|15[012356789]|17[678]|18[0-9]|14[57])[0-9]{8}$/);
}
$("password").onkeyup=function(){	
	
	if(checkPassword(this.value)){
		$("spanPassword").innerHTML="true";
		
		$("spanPassword").style.color="#fff";	
	}
	else{
		$("spanPassword").innerHTML="密码由6-16为数字和字母组成，可特殊字符";
		$("spanPassword").style.color="red";
	}
	
};
$("surepassword").onblur=function(){
	if(this.value.trim()!=$("password").value.trim()){
		$("spansurePassword").innerHTML="两次密码不一致";
		$("spansurePassword").style.color="red";
	}
	else{
		$("spansurePassword").innerHTML="true";
		$("spansurePassword").style.color="#fff";
	}
};
$("email").onblur=function(){
	if(checkEmail(this.value)){
		$("spanemail").innerHTML='TRUE';
		$("spanemail").style.color="#fff";
	}
	else if(this.value.trim()!=""&&!checkEmail(this.value)){
		$("spanemail").innerHTML='邮箱格式不正确';
		$("spanemail").style.color="red";
	}
	else{
		$("spanemail").innerHTML='';
	}
};
$("phone").onblur=function(){
	
	if(checkPhone(this.value)){
		$("spanphone").innerHTML='TRUE';
		$("spanphone").style.color="#fff";	
	}
	else if(this.value.trim()!="" &&!checkPhone(this.value)){
		$("spanphone").innerHTML='手机号码格式不正确';
		$("spanphone").style.color="red";
	}
	else{
		$("spanphone").innerHTML='';
	}
};
function sumbitCheck(){
	var user=$("playerID").value.trim();
	var password=$("password").value.trim();
	var surePassword=$("surepassword").value.trim();
	var email=$("email").value.trim();
	var phone=$("phone").value.trim();
	if(user!=""&&user!=null){
		$("spanUser").innerHTML="true";	
		$("spanUser").style.color="#fff";
	}
	else{		
		$("spanUser").innerHTML="用户名不能为空";
		$("spanUser").style.color="red";
		return false;
	}
	if(password!=""&& password!=null&&checkPassword(password)){
		$("spanPassword").innerHTML="true";
		$("spanPassword").style.color="#fff";		
	}
	else{
	    $("spanPassword").innerHTML = "密码由6-16为数字和字母组成，可特殊字符";
		$("spanPassword").style.color="red";
		return false;
	}
	if(password!=surePassword){
		$("spansurePassword").innerHTML="两次密码不一致";
		$("spansurePassword").style.color="red";
		return false;
	}
	else{
		$("spansurePassword").innerHTML="";
		$("spansurePassword").style.color="#fff";
	}
	if(email!=""&& email!=null&&checkEmail(email)){
		$("spanemail").innerHTML='TRUE';
		$("spanemail").style.color="#fff";
	}
	else{
		$("spanemail").innerHTML='';
	}
	if(phone!=""&&phone!=null&&checkPhone(phone)){
		$("spanphone").innerHTML='TRUE';
		$("spanphone").style.color="#fff";
	}
	else{
		$("spanphone").innerHTML='';
	}
	return true;
	
};