<%@ taglib uri="Mytag" prefix="Layout"%>
<Layout:overwrite name="title">
编辑公告
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
    #upPic,#upAttachment1,#upAttachment2,#upAttachment3{
    	margin-left:-100px;
    	padding-left:10px;
    	width:90px;
    	font-size:22px;
		opacity:0;	
    }
    #ShowPublishPic{ 		
   		 width:150px;
   		 height:100px;
    }
    #PicUrl{
    	display:none;
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
                    <a href="javascript:">公司管理</a><i class="icon-angle-right"></i>
                </li>
                <li>
                    <a href="CommunicationView/Message.jsp?active=menupage6_0">公告管理</a><i class="icon-angle-right"></i>
                </li>
                <li>
                    <a href="javascript:">编辑公告</a><i class="icon-angle-right"></i>
                </li>
            </ul>
        </div>
    </div>
    <div class="clearfix"></div>
<div class="row-fluid">
        <div class="span12">
            <div class="portlet box yellow">
                <div class="portlet-title">
                    <div class="caption">
                        <i class="icon-reorder"></i>
                        <span class="NavTitle">编辑公告</span>
                    </div>
                    <div class="tools">
                        <a href="javascript:;" class="collapse"></a>
                    </div>
                </div>
                <div class="portlet-body form">
                    <form action="com.Manager.Util/Mail" method="post" onsubmit="return sumbitCheck();"  id="myform" class="form-horizontal" novalidate="novalidate">                         
                        <div class="control-group">
                            <label class="control-label">公告主题</label>
                            <div class="controls">
                                <input type="text" name="Title" id="Title" class="span6 m-wrap popovers" data-trigger="hover" data-content="请填写主题" data-input="text" data-maxlength="250" required />
                                <span style="color: red;" id="spanTitle"></span>
                            </div>
                        </div>
                       <div class="control-group">
										<label class="control-label">公告类型</label>
										<div class="controls">
											<div class="row-fluid">
												<div class="span3">
													<label class="checkbox line">
													<input type="checkbox" name="Tab" value="日常" /> 日常
													</label>
													<label class="checkbox line">
													<input type="checkbox" name="Tab" value="工作" /> 工作
													</label>
													<label class="checkbox line">
													<input type="checkbox" name="Tab" value="安排" /> 安排
													</label>
												</div>
												<div class="span3">
													<label class="checkbox line">
													<input type="checkbox" name="Tab" value="福利" /> 福利
													</label>
													<label class="checkbox line">
													<input type="checkbox" name="Tab" value="紧急通知" /> 紧急通知
													</label>
													<label class="checkbox line">
													<input type="checkbox" name="Tab" value="企业文化" /> 企业文化
													</label>
												</div>
												 
											</div>
											 <span style="color: red;" id="spanTab"></span>
										</div>
									</div>   
						<div class="control-group">
                            <label class="control-label">公告首图片</label>
                            <div class="controls">
                            	<img src="" id="ShowPublishPic"/>
                                <input type="text" name="PicUrl" id="PicUrl" class="span6 m-wrap popovers" data-trigger="hover" data-content="公告图片" data-input="text" data-maxlength="250" disabled sy />             
                               	<span class="btn green">上传图片</span>
                               	<input type="file" name="files[]"  id="upPic"/>
                                <span style="color: red;" id="SpanAttachment3"></span>
                            </div>
                       </div>  
                        <div class="control-group">
                            <label class="control-label">公告附件</label>
                            <div class="controls">
                                <input type="text" name="AttachmentUrl1" id="AttachmentUrl1" class="span6 m-wrap popovers" data-trigger="hover" data-content="公告图片" data-input="text" data-maxlength="250" disabled />             
                               	<span class="btn yellow">上传附件</span>
                               	<input type="file" name="files[]"  id="upAttachment1"/>
                                <span style="color: red;" id="SpanAttachment3"></span>
                            </div>
                       </div> 
                       <div class="control-group">
                            <label class="control-label">公告附件</label>
                            <div class="controls">
                                <input type="text" name="AttachmentUrl2" id="AttachmentUrl2" class="span6 m-wrap popovers" data-trigger="hover" data-content="公告图片" data-input="text" data-maxlength="250" disabled />             
                               	<span class="btn yellow">上传附件</span>
                               	<input type="file" name="files[]"  id="upAttachment2"/>
                                <span style="color: red;" id="SpanAttachment3"></span>
                            </div>
                       </div> 
                       <div class="control-group">
                            <label class="control-label">公告附件</label>
                            <div class="controls">
                                <input type="text" name="AttachmentUrl3" id="AttachmentUrl3" class="span6 m-wrap popovers" data-trigger="hover" data-content="公告图片" data-input="text" data-maxlength="250" disabled />             
                               	<span class="btn yellow">上传附件</span>
                               	<input type="file" name="files[]"  id="upAttachment3"/>
                                <span style="color: red;" id="SpanAttachment3"></span>
                            </div>
                       </div>                     
                        <div class="control-group">
                            <label class="control-label">公告内容</label>
                            <div class="controls">
                               <textarea id="txtContent" name="content" style="width: 100%; height: 300px;"></textarea>             
                            </div>
                             <span style="color: red;" id="spanContent"></span>
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
<script src="Scripts/bootstrap/ajaxfileupload.js"></script>
<script>
KindEditor.ready(function (K) {
    var editor1 = K.create('#txtContent', {
        cssPath: '../Scripts/kindeditor-4.1.10/plugins/code/prettify.css',
        uploadJson: '../com.Manager.Company/SmartUploadForPublish',
        fileManagerJson: '../com.Manager.Company/SmartUploadForPublish',
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

function upload(ID,purl,num){
	var Rurl="";
	$.ajaxFileUpload({
        url: purl,
        secureuri: false,
        type:"post",
        fileElementId:ID,
        dataType: 'json',
        success: function (result) {
            if (result.code ==1) {      	
            	Rurl=result.Rurl;  
            	if(num==0){
            		$("#PicUrl").val(Rurl);
            	     $("#ShowPublishPic").attr('src',Rurl);
            	}
            	else if(num==1){
            		 $("#AttachmentUrl1").val(Rurl);
            	}
            	else if(num==2){
            		 $("#AttachmentUrl2").val(Rurl);
            	}
            	else {
            		$("#AttachmentUrl3").val(Rurl);
            	}
            }
            else if (data.code ==0) {
                noty({ text: "抱歉，您上传的图片类型不正确！", type: "warning", layout: "topCenter", timeout: 3000 });
            }
            else {
                noty({ text: "请不要上传非图片文件！", type: "warning", layout: "topCenter", timeout: 3000 });
            }
        },
        error: function (data, status, e) {
        	 noty({ text: "不好意思哦！俺出错了", type: "warning", layout: "topCenter", timeout: 3000 });
        },
        complete: function (XMLHttpRequest, textStatus) {
            $("#ImgUploadWait").modal("hide");
        }
    });	
}
$("#upPic").change(function(){
	upload("upPic","com.Manager.Company/SmartUploadForPublish",0);
});
$("#upAttachment1").change(function(){
	upload("upAttachment1","com.Manager.Company/SmartUploadForAttachment",1);
});
$("#upAttachment2").change(function(){
	upload("upAttachment2","com.Manager.Company/SmartUploadForAttachment",2);

});
$("#upAttachment3").change(function(){
	upload("upAttachment3","com.Manager.Company/SmartUploadForAttachment",3);
});

function SaveForm() {
    
    var Title = $("#Title").val().trim();       
    var PicUrl = $("#PicUrl").val().trim();
    var Attachment1=$("#AttachmentUrl1").val().trim();
    var Attachment2=$("#AttachmentUrl2").val().trim();
    var Attachment3=$("#AttachmentUrl3").val().trim();
    var Tab = document.getElementsByName('Tab');
    var TabList="";
    var num=0;
    for(var i = 0; i < Tab.length; i++){
      if(Tab[i].checked){
    	  num+=1;
    	  if(num>3){
    		  $("#spanTab").html("不能超过三个哦！");
    		  return;
    	  }
    	  else{
    		  $("#spanTab").html("");
    	  }
    	  TabList += (TabList == "") ? Tab[i].value : ("," + Tab[i].value);
      }
     }  
    var content = $(".ke-edit-iframe").contents().find(".ke-content").html();
    if(Title==""){
    	$("#spanTitle").html("请填写公告主题");
    	return false;
    }
    else{
    	$("#spanTitle").html("");
    }
    if(PicUrl==""){
    	$("#spanPicUrl").html("请上传公告图片");
    	return false;
    }
    else{
    	$("#spanPicUrl").html("");
    }
    if(content==""){
    	$("#spanContent").html("请编辑内容");
    	return false;
    }
    else{
    	$("#spanContent").html("");
    }

    $("#cover").show();
    $.ajax({
        url: "com.Manager.Company/AddPublish",
        type: "POST",
        data: {
        	Title: Title,PicUrl: PicUrl,content: content,TabList:TabList,Attachment1:Attachment1,Attachment2:Attachment2,Attachment3:Attachment3
        },
        dataType: "json",
        success: function (result) {
            if (result.code == 1) {
                noty({ text: "发送成功！", type: "success", layout: "topCenter", timeout: 3000 }); $("#myform")[0].reset();
                setTimeout(function () { location.href ="CompanyView/Publish.jsp?active=menupage4_2"}, 1000);
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