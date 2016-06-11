<%@ taglib uri="Mytag" prefix="Layout"%>
<Layout:overwrite name="title">
编辑短消息
</Layout:overwrite>
<Layout:overwrite name="Mycss">
	<style>	
		#shownum{
			position:relative;
			margin-left:-120px;
			top:90px;
			color:#999;
		}	
		.search-field{
			height:27px;
		}
	</style>
	<link rel="stylesheet" type="text/css" href="Content/bootstrap/chosen.css" />
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
                    <a href="javascript:">编辑短消息</a>
                </li>
            </ul>
        </div>
    </div>
    <div class="clearfix"></div>
<div class="row-fluid">
        <div class="span8">
            <div class="portlet box green">
                <div class="portlet-title">
                    <div class="caption">
                        <i class="icon-reorder"></i>
                        <span class="NavTitle">编辑短信息</span>
                    </div>
                    <div class="tools">
                        <a href="javascript:;" class="collapse"></a>
                    </div>
                </div>
               
                <div class="portlet-body form">
                    <form  id="myform" class="form-horizontal" novalidate="novalidate">
                       <input id="ID" name="ID" value="" style="display:none"/>
                        <div class="control-group">
                            <label class="control-label">收件人姓名</label>
                            <div class="controls"id="controlspan">
                                <input type="text" name="Name" id="Name" class="span6 m-wrap popovers" data-trigger="hover" data-content="请填写姓名" data-input="text" data-maxlength="250" placeholder="请从右边选择" disabled/>
                                <span style="color: red;" id="spanName"></span>
                            </div>
                       </div>
            
          						<div class="control-group">
										<label class="control-label">收件人姓名</label>
										<div class="controls">
											<select data-placeholder="Your Favorite Football Teams" class="chosen span6" multiple="multiple" tabindex="6">
												<option value=""></option>
												<optgroup label="请选择：">
													<option>css</option>
													<option>admin</option>
													<option>程胜</option>
													<option>张博</option>													
													<option>css</option>
													<option>admin</option>
													<option>程胜</option>
													<option>张博</option>													
													<option>admin</option>
													<option>程胜</option>
													<option>张博</option>
												</optgroup>
											</select>
										</div>
									</div>
          								              
                        <div class="control-group">
                            <label class="control-label">消息内容</label>
                            <div class="controls">
                                	  <textarea id="ShortContent" name="ShortContent" style="width: 80%; height: 200px;"></textarea>
                                	  <span id="shownum">已输入<b id="num">0</b>个字</span>
                            </div>
                        </div>      
                        <div class="form-actions">
                            <input type="button" class="btn green" onclick="SendMessage()" value="发送"/>
                            <a type="button" class="btn green" href="javascript:void(0);" onclick="Clear();">清空</a>
                          <!--   @*<a type="button" class="btn green" href="javascript:void(0);" onclick="GoBack();">返回</a>*@ -->
                        </div>
                    </form>
                </div>
            </div>
        </div>
		<div class="span4">
						<!-- BEGIN SAMPLE TABLE PORTLET-->
						<div class="portlet box light blue">
							<div class="portlet-title">
								<div class="caption"><i class="icon-male"></i>管理员通讯录</div>
								<div class="tools">
									<a href="javascript:;" class="collapse"></a>
									<a href="javascript:;" class="reload"></a>
									<a href="javascript:;" class="remove"></a>
								</div>
							</div>
							<div class="portlet-body">
								<table class="table table-hover">
									<thead>
										<tr>
											<th style="text-align: center">
                                  				  <input type="checkbox" id="chk_All" class="checkboxes" onclick="CheckAll(this)" />
                               				 </th>
											<th>管理员</th>
											<th>电话</th>
											<th>Status</th>
										</tr>
									</thead>
									<tbody id="AdminListBody">
									
									</tbody>
									
								</table>
								<div class="row-fluid">
			                        <div class="span6">
			                            <div id="pageInfo" class="dataTables_info">
			                            </div>
			                        </div>
			                        <div class="span6">
			                            <div class="dataTables_paginate paging_bootstrap pagination pagination-mini" style="float:right;margin:0;">
			                                <ul id="pagePart">
			                                </ul>
			                            </div>
			                        </div>
                  				 </div>
							</div>
						</div>
						<!-- END SAMPLE TABLE PORTLET-->
					</div>
    </div>
    
  </Layout:overwrite>
  
  <Layout:overwrite name="MyScript">
  	<script>	
		document.getElementById("ShortContent").onkeyup=function(){
			if(this.value.length<=140){
				document.getElementById("shownum").innerHTML="已输入<b id='num'>0</b>个字";
				document.getElementById("num").innerHTML=this.value.length;
				document.getElementById("shownum").style.color="#999";
			}
			else{
				document.getElementById("shownum").innerHTML="已经超出字数限制";
				document.getElementById("shownum").style.color="red";
			}
		};	
		function Clear(){
			//alert("jinlai");
			 var lst = document.getElementsByClassName("checkboxes");
	    	 for (var i = 1; i < lst.length; i++) {
	    		 if(lst[i].checked){
	    			 alert(lst[i].checked);
	    			 lst[i].checked=false;
	    		 }
	    	 }
	    	 $("#ShortContent").val("");
		}
		function SendMessage() {
			 var lst = document.getElementsByClassName("checkboxes");
			 var namelst=document.getElementsByClassName("userName");
			  if(lst.length<1){$("#spanName").html("请选择要发送的人");return false;}
			 else{$("#spanName").html("");}
			   var ReceiverIDList ="";
			   var ReceiverNameList="";
	            for (var i = 1; i < lst.length; i++) {
	                if (lst[i].checked) {
	                	ReceiverIDList += (ReceiverIDList == "") ? lst[i].value : ("," + lst[i].value);   
	                	ReceiverNameList+=(ReceiverNameList =="")? namelst[i-1].innerHTML:(","+namelst[i-1].innerHTML);
	                }
	            } 
	            //alert(ReceiverIDList+"/////"+ReceiverNameList);
			var content=$("#ShortContent").val();
			 if(content.length<=140){
				document.getElementById("shownum").innerHTML="已输入<b id='num'>0</b>个字";
				document.getElementById("num").innerHTML=content.length;
				document.getElementById("shownum").style.color="#999";
				
			}else{
				document.getElementById("shownum").innerHTML="已经超出字数限制";
				document.getElementById("shownum").style.color="red";
				return false;
			} 
			  $.ajax({
			        url: "com.Manager.Communication/SendMessage",
			        type: "POST",
			        data: {
			        	ReceiverIDList:ReceiverIDList,content:content,ReceiverNameList:ReceiverNameList
			        },
			        dataType: "json",
			        success: function (result) {
			            if (result.code == 1) {
			       			Clear();
			                noty({ text: "发送成功！", type: "success", layout: "topCenter", timeout: 3000 }); 		               
			                setTimeout(function () { window.location='CommunicationView/Message.jsp?active=menupage6_0' ;}, 1000);
			            }
			            else {
			                noty({ text: "发送失败！"+result.result, type: "warning", layout: "topCenter", timeout: 3000 });
			            }
			        },
			        error: function () {
			            console.log("error");
			        }
			    });
	    }
		
			var pageSize = 10; //一页显示的记录数
		    var pageIndex = 1; //当前页
		    var PSize = 10;
		    var orderby = "", strSearch = "";
		    var count = 0;  //总记录数
		    $(document).ready(function () {
		     getAdminList();
		    }); 
		    function getAdminList() {
		        $.ajax({
		            url: "com.Manager.Communication/GetAdminList",
		            type: "POST",
		            data: { pageSize: pageSize, pageIndex: pageIndex, strSearch: strSearch},
		            dataType: "json",
		            success: function (result) {            	
		                if (result.code == 1) {
		                    count = result.count;
		                    var html = "";
		                    var data=result.LoginList;          
		                    for (var i = 0; i < data.length; i++) {
	
		                        html += '<tr class="odd gradeX">';
		                        html += '<td class="sorting_1" style="text-align: center" ><div class="checker"><span><input type="checkbox" onclick="checkItem(this);" class="checkboxes" value=' + data[i].ID + '></span></div></td>';
		                        html += '<td class="hidden-480 userName">' + data[i].userName+ '</td>';       
		                        html += '<td class="hidden-480">' + data[i].phone + '</td>';
		                        html += '<td class="hidden-480"><a href="./com.Manager.Communication/EditContact?ID=' + data[i].ID + '&active=menupage6_6" class="label label-success" style="color: white;">Approved</a></td></tr>';
		                      
		                    }
		                    $("#AdminListBody").html(html);
		                }
		                else {
		                    var html = "";
		                    html += "<tr class='odd gradeX'>";
		                    html += "<td colspan='10' style='text-align:center'>抱歉，还没有任何信息</td>";
		                    html += "</tr>";
		                    $("#AdminListBody").html(html);
		                }
		                $("#chk_All").attr("checked", false).closest("span").removeClass("checked");

		                GetPageInfo(count);
		            },
		            error: function () {
		                console.log("error");
		            }
		        });
		    }

		    function GetPageInfo(count) {
		        var pageHtml = "";
		        if (count != 0) {
		            recordCount = count;
		            pageCount = Math.ceil(recordCount / pageSize);

		            if (pageIndex == 1) {
		            	
		                pageHtml += "<li class='prev disabled' ><a> « </a></li>";
		            }
		            else {
		                pageHtml += "<li class='prev' onclick='GotoPage(" + Number(pageIndex - 1) + ")'><a>«</a></li>";
		            }

		            var PNumCount = Math.ceil(pageCount / PSize);//判断总分页
		            var PNum = parseInt((pageIndex - 1) / PSize);//判断第几页分页
		            if (PNum >= 1)
		                pageHtml += "<li onclick='GotoPage(" + Number((PNum - 1) * PSize + 1) + ")'><a >...</a></li>";
		            for (var j = PNum * PSize; j < (pageCount <= PSize * (PNum + 1) ? pageCount : PSize * (PNum + 1)) ; j++) {
		                if (j == pageIndex - 1) {
		                    pageHtml += "<li class=\"active\"><a >" + (j + 1) + "</a></li>";
		                }
		                else {
		                    pageHtml += "<li onclick='GotoPage(" + (j + 1) + ")'><a >" + (j + 1) + "</a></li>";
		                }
		            }
		            if ((PNum + 1) < PNumCount)
		                pageHtml += "<li onclick='GotoPage(" + Number((PNum + 1) * PSize + 1) + ")'><a >...</a></li>";

		            if (pageIndex == pageCount) {
		                pageHtml += " <li class='next disabled'><a>»</a></li>";
		            }
		            else {
		                pageHtml += " <li class='next' onclick='GotoPage(" + Number(pageIndex + 1) + ")'><a>»</a></li>";
		            }
		            $("#pagePart").html(pageHtml);
		            if (pageSize * pageIndex > recordCount) {
		                if (recordCount == 0) {
		                    $("#pageInfo").html("暂无数据");
		                }
		                else {
		                    $("#pageInfo").html("第" + ((pageIndex - 1) * pageSize + 1) + "-" + recordCount + "条，共 " + pageCount + "页");
		                }
		            }
		            else {
		                $("#pageInfo").html("第 " + ((pageIndex - 1) * pageSize + 1) + "-" + pageSize * pageIndex + " 条，共 " + pageCount + " 页");
		            }
		        }
		        else {
		            pageHtml += "<li class='prev disabled' ><a>«</a></li>";
		            pageHtml += " <li class='next disabled'><a> » </a></li>";
		            $("#pageInfo").html("显示 0 条数据到 0 条数据，总共 0 页");
		        }
		        $("#pagePart").html(pageHtml);
		        if (pageIndex > pageCount) {
		            pageIndex = pageCount;
		        }
		    }

		    function GotoPage(topage) {
		        pageIndex = topage;
		        if (0 < topage && topage <= pageCount)
		            getContactList();
		    }
		
  	</script>
  	<script type="text/javascript" src="Scripts/bootstrap/chosen.jquery.min.js"></script>
  </Layout:overwrite>
<%@ include file="../share/_Layout.jsp"%>
 
 
 
 