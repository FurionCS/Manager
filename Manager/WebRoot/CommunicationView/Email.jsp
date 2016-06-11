<%@ taglib uri="Mytag" prefix="Layout"%>
<Layout:overwrite name="title">
邮件发送
</Layout:overwrite>
<Layout:overwrite name="Mycss">
<link href="Scripts/kindeditor-4.1.10/themes/default/default.css" rel="stylesheet" />
<style>
#cover{
        position:fixed;
     	width:100%;height:100%;left:0;top:0;
        background:rgba(0,0,0,0.3);
        text-align: center;
    }
    #cover img{
   		position:absolute;
   		top:50%;
   		margin-top:-40px;
    }
    </style>
</Layout:overwrite>

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
                    <a href="CommunicationView/Message.jsp?active=menupage6_0">短消息管理</a><i class="icon-angle-right"></i>
                </li>
                <li>
                    <a href="javascript:">Email发送</a><i class="icon-angle-right"></i>
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
                        <span class="NavTitle">邮件发送</span>
                    </div>
                    <div class="tools">
                        <a href="javascript:;" class="collapse"></a>
                    </div>
                </div>
                <div class="portlet-body form">
                    <form action="com.Manager.Util/Mail" method="post" onsubmit="return sumbitCheck();"  id="myform" class="form-horizontal" novalidate="novalidate">
                        <div class="control-group">
                            <label class="control-label">发件人</label>
                            <div class="controls">
                               <input type="text" name="Name" id="Name" class="span6 m-wrap popovers" data-trigger="hover" data-content="请填写发件人姓名" data-input="text" data-maxlength="250" value="${test}" required />
                           
                                <span style="color: red;" id="spanName"></span>
                            </div>
                        </div>                       
                        <div class="control-group">
                            <label class="control-label">发件人邮箱</label>
                            <div class="controls">
                                <input type="email" name="email" id="email" class="span6 m-wrap popovers" data-trigger="hover" data-content="请修改邮箱" data-input="text" data-maxlength="250" required />
                                <span style="color: red;" id="spanemail"></span>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">邮箱密码</label>
                            <div class="controls">
                                <input type="password" name="password" id="password" class="span6 m-wrap popovers" data-trigger="hover" data-content="请填写密码" data-input="text" data-maxlength="250" required />
                                <span style="color: red;" id="spanpassword"></span>
                            </div>
                        </div>
                      
                        <div class="control-group">
                            <label class="control-label">收件人邮箱</label>
                            <div class="controls">
                                <input type="text" name="GetEmail" id="GetEmail" class="span6 m-wrap popovers" data-trigger="hover" data-content="请修改QQ" data-input="text" data-maxlength="250" required />
                                <span style="color: red;" id="spanGetEmail"></span>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">邮箱主题</label>
                            <div class="controls">
                                <input type="text" name="thome" id="thome" class="span6 m-wrap popovers" data-trigger="hover" data-content="请修改工作地址" data-input="text" data-maxlength="250" required />
                                <span style="color: red;" id="spanthome"></span>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">邮箱内容</label>
                            <div class="controls">
                               <textarea id="txtContent" name="content" style="width: 100%; height: 300px;"></textarea>
                                
                            </div>
                        </div>                       
                        <div class="form-actions">
                            <input type="button" class="btn green" value="发送" onclick="SaveForm();"/>
                            <a type="button" class="btn green" href="javascript:void(0);" onclick="Clear();">清空</a>
                          <!--   @*<a type="button" class="btn green" href="javascript:void(0);" onclick="GoBack();">返回</a>*@ -->
                        </div>
                    </form>

                </div>
            </div>
        </div>
    </div>
    
  <div id='cover' style="display:none">
  		<img src="Img/svg-loaders/bars.svg" width="80" alt="">&nbsp;
  </div>
</Layout:overwrite>
<Layout:overwrite name="MyScript">
<script src="Scripts/dropzone.js"></script>
<script src="Scripts/kindeditor-4.1.10/kindeditor.js"></script>
<script src="Scripts/kindeditor-4.1.10/lang/zh_CHN.js"></script>
<script>
KindEditor.ready(function (K) {
    var editor1 = K.create('#txtContent', {
        cssPath: '../Scripts/kindeditor-4.1.10/plugins/code/prettify.css',
        uploadJson: '../Scripts/kindeditor-4.1.10/jsp/upload_json.jsp',
        fileManagerJson: '../Scripts/kindeditor-4.1.10/jsp/file_manager_json.jsp',
        allowFileManager: true,
        items: [
'source', '|', 'undo', 'redo', '|', 'preview', 'cut', 'copy', 'paste',
'plainpaste', 'wordpaste', '|', 'justifyleft', 'justifycenter', 'justifyright',
'justifyfull', 'insertorderedlist', 'insertunorderedlist', 'indent', 'outdent', 'subscript',
'superscript', 'quickformat', 'selectall', '|', 'fullscreen', '|',
'formatblock', 'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold',
'italic', 'underline', 'strikethrough', 'lineheight', 'removeformat', '|', 'multiimage',
'media', 'insertfile', 'table', 'hr', 'emoticons', 'pagebreak',
'anchor', 'link', 'unlink','baidumap'
        ],
        afterCreate: function () {
            var self = this;
            K.ctrl(document, 13, function () {
                self.sync();
                K('form[name=example]')[0].submit();
            });
            K.ctrl(self.edit.doc, 13, function () {
                self.sync();
                K('form[name=example]')[0].submit();
            });
        }
    });
});
function checkEmail(email){
	var check=/^[a-z0-9]+([._\\-]*[a-z0-9])*@([a-z0-9]+[-a-z0-9]*[a-z0-9]+.){1,63}[a-z0-9]+$/;
	return  check.test(email);
}
function SaveForm() {
    
    var SendName = $("#Name").val().trim();       
    var email = $("#email").val().trim();
    var GetEmail = $("#GetEmail").val().trim();
    var thome = $("#thome").val().trim();
    var password = $("#password").val().trim();
    var content = $(".ke-edit-iframe").contents().find(".ke-content").html();
    if(SendName==""){
    	$("#spanName").html("请填写发信人姓名");
    	return false;
    }
    else{
    	$("#spanName").html("");
    }
    if(!checkEmail(email)){
    	$("#spanemail").html("邮箱格式不正确！！");
    	return false;
    }
    else{
    	$("#spanemail").html("");
    }
    if(!checkEmail(GetEmail)){
    	$("#spanGetEmail").html("邮箱格式不正确！！");
    	return false;
    }else{
    	$("#spanGetEmail").html("");
    }
    $("#cover").show();
    $.ajax({
        url: "com.Manager.Util/Mail",
        type: "POST",
        data: {
        	SendName: SendName,email: email, thome:thome,password:password,GetEmail:GetEmail,content: content
        },
        dataType: "json",
        success: function (result) {
            if (result.code == 1) {
                noty({ text: "发送成功！", type: "success", layout: "topCenter", timeout: 3000 }); $("#InfoForm")[0].reset();
                setTimeout(function () {  }, 1000);
            }
            else {
                noty({ text: "发送失败！"+result.result, type: "warning", layout: "topCenter", timeout: 3000 });
            }
        },
        error: function () {
            console.log("error");
        }
    });
    $("#cover").hide();

}
</script>
</Layout:overwrite>
<%@ include file="/share/_Layout.jsp"%>
