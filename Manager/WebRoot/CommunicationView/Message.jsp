<%@ taglib uri="Mytag" prefix="Layout"%>
<Layout:overwrite name="title">
消息发送
</Layout:overwrite>
<Layout:overwrite name="Mycss">
 <link href="Content/bootstrap/DT_bootstrap.css" rel="stylesheet" />
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
        <div>
            <div class="span12">
                <ul class="breadcrumb">
                    <li>
                        <i class="icon-home"></i>
                        <a href="/Home/Index">首页</a>
                        <i class="icon-angle-right"></i>
                    </li>
                    <li>
                        <a href="javascript:void(0)">通讯录管理</a><i class="icon-angle-right"></i>
                    </li>

                    <li>
                        <a href="javascript:void(0)">短消息管理</a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <div class="clearfix"></div>
<div class="row-fluid">
            <div class="span12">
                <div class="portlet box light-grey" style="border-top: 1px solid #eee;">
                    <div class="portlet-body">
                        <div class="clearfix">
                           
                            <div class="btn-group">
                                <a id="addhref" href="CommunicationView/EditShortMessage.jsp?active=menupage6_0"type="button" class="btn green">编辑<i class="icon-edit"></i>
                                </a>
                             
                            </div>
                           <!--  <div class="btn-group">
                                <a id="excel" href="com.Manager.Communication/DownloadExcel" type="button" class="btn yellow">导出Excel <i class="icon-bar-chart"></i>
                                </a>
                            </div> -->
                             <div id="Email" class="btn-group">
                                <a href="CommunicationView/Email.jsp?active=menupage6_0" type="button" class="btn purple">Email <i class="icon-envelope-alt"></i>
                                </a>
                            </div> 
                            <div class="btn-group">
                                <a id="selectRead" href="javascript:void(0);" type="button" class="btn red">标记勾选为已读 <i class="icon-ok"></i>
                                </a>
                            </div>
                            
                        </div>
                        <div class="row-fluid">
                            <div class="span6">
                                <div id="sample_1_length" class="dataTables_length">
                                    <label>
                                        <select size="1" name="sample_1_length" id="pagesize" aria-controls="sample_1" class="m-wrap small">
                                            <option value="5">5</option>
                                            <option value="10" selected="selected">10</option>
                                            <option value="20">20</option>
                                            <option value="-1">All</option>

                                        </select> 条记录每页</label>
                                </div>
                            </div>
                            <div class="span6">
                                <div class="dataTables_filter" id="sample_1_filter">
                                    <label>检索: <input type="text" aria-controls="sample_1" class="m-wrap small" id="search" style="height:30px;" placeholder="姓名、电话、地址"></label>
                                </div>
                            </div>
                        </div>
                        <table class="table table-striped table-bordered table-hover">
                        <thead>
                            <tr>
                                <th style="text-align: center">
                                    <input type="checkbox" id="chk_All" class="checkboxes" onclick="CheckAll(this)" />
                                </th>
                                <th>发件人</th>
                                <th>发送内容</th>
                                <th>发送时间</th>
                                <th>消息状态</th>
                                <th>操作</th>
                            </tr>
                        </thead>
                        <tbody id="ListBody">
								<%-- <%
									ArrayList ContactList=(ArrayList)session.getAttribute("ContactList");
									if(ContactList==null || ContactList.size()==0){
								%>
								<tr class='odd gradeX'><td colspan='10' style='text-align:center'>抱歉，还没有任何信息</td></tr>
								<% 
									}
									else{
										for(int i=ContactList.size()-1;i>=0;i--){
											ContactBean CB=(ContactBean)ContactList.get(i);
											%>
											<tr class="odd gradeX">
											<td class="sorting_1"><div class="checker"><span><input type="checkbox" onclick="checkItem(this);" class="checkboxes" value="<%=CB.getID() %>"></span></div></td>
											<td class="hidden-480"><%=CB.getName() %></td>
											<td class="hidden-480"><%=CB.getSex() %></td>
											<td class="hidden-480"><%=CB.getPhone() %></td>
											<td class="hidden-480"><%=CB.getEmail() %></td>
											<td class="hidden-480"><%=CB.getQQ() %></td>
											<td class="hidden-480"><%=CB.getHomeAdress() %></td>
											<td class="hidden-480"><%=CB.getWorkAdress()%></td>
											<td class="hidden-480"><%=CB.getCode() %></td>
											<td class="hidden-480"><a href="./com.Manager.Communication/EditContact?ID=<%=CB.getID()%>"class="label label-important" style="color: white;">编辑</a></td>
											<% 
										}
										
									}
									
								%> --%>
                        </tbody>
                    </table>
                    <div class="row-fluid">
                        <div class="span6">
                            <div id="pageInfo" class="dataTables_info">
                            </div>
                        </div>
                        <div class="span6">
                            <div class="dataTables_paginate paging_bootstrap pagination">
                                <ul id="pagePart">
                                </ul>
                            </div>
                        </div>
                    </div>
                    </div>
                </div>
            </div>
        </div>
        
        	<div class="row-fluid"> 
        		<div class="span12">
						<!-- BEGIN BORDERED TABLE PORTLET-->
						<div class="portlet box yellow">
							<div class="portlet-title">
								<div class="caption"><i class="icon-share"></i>已发信息</div>
								<div class="tools">
									<a href="javascript:;" class="collapse"></a>								
									<a href="javascript:;" class="reload"></a>
									<a href="javascript:;" class="remove"></a>
								</div>
							</div>
							<div class="portlet-body">
								<table class="table table-bordered table-hover">
									<thead>
										<tr>
											<th>ID</th>
											<th>收件人</th>
											<th>发送内容</th>
											<th>发送时间</th>										
											<th>消息状态</th>
											<!-- <th>操作</th> -->
										</tr>
									</thead>
									<tbody id="sendMessageList">
										<!-- 
											<td><span class="label label-info">Pending</span></td>		
											<td><span class="label label-warning">Suspended</span></td>				
											<td><span class="label label-danger">Blocked</span></td>
										</tr> -->
									</tbody>
								</table>
					<div class="row-fluid">
                        <div class="span6">
                            <div id="pageSendInfo" class="dataTables_info">
                            </div>
                        </div>
                        <div class="span6">
                            <div class="dataTables_paginate paging_bootstrap pagination">
                                <ul id="pageSendPart">
                                </ul>
                            </div>
                        </div>
                    </div>
							</div>
						</div>
						<!-- END BORDERED TABLE PORTLET-->
       			 </div>
        </div>
</Layout:overwrite>
<Layout:overwrite name="MyScript">
	<script>
	    var pageSize = 10; //一页显示的记录数
	    var pageIndex = 1; //当前页
	    var PSize = 10;
	    var orderby = "", strSearch = "";
	    var count = 0;  //总记录数
	    $(document).ready(function () {
	     getMessageList();
	     getSendMessageList();
	        document.getElementById("pagesize").onchange = function () {
	            if (this.value < 0) {
	                pageSize = count;
	            } else
	                pageSize = this.value;
	            getMessageList();
	        };
	        document.getElementById("search").onkeyup = function () {
	            strSearch = this.value;
	            getMessageList();
	        };
	        

	        document.getElementById("selectRead").onclick = function () {
	            var lst = document.getElementsByClassName("checkboxes");
	            var str = "", shopnum = "";
	            for (var i = 1; i < lst.length; i++) {
	                if (lst[i].checked) {
	                    str += (str == "") ? lst[i].value : ("," + lst[i].value);
	                    shopnum += (shopnum == "") ? lst[i].title : ("," + lst[i].title);
	                }
	            }
	            
	            if (str.length > 0)
	                noty({
	                    text: '确定要将勾选信息标记为已读吗',
	                    type: 'information',
	                    layout: 'center',
	                    buttons: [
	                        {
	                            addClass: 'btn blue', text: '确定', onClick: function ($noty) {
	                                $.ajax({
	                                    url: "com.Manager.Communication/markerMessage",
	                                    type: "POST",
	                                    data: {
	                                        ids: str
	                                    },
	                                    dataType: "json",
	                                    success: function (result) {
	                                        if (result.code == 1) {               
	                                            $noty.close();
	                                            noty({ text: result.msg, type: 'information', layout: 'center', timeout: 2000 });
	                                            getMessageList();
	                                            uncheckAll();
	                                        }
	                                        else {
	                                            noty({ text: result.msg, type: 'warning', layout: 'center', timeout: 2000 });
	                                        }
	                                    },
	                                    error: function () {
	                                        noty({ text: "检查网络设置", type: 'warning', layout: 'center', timeout: 2000 });
	                                    }

	                                });

	                            }
	                        },
	                        {
	                            addClass: 'btn red', text: '取消', onClick: function ($noty) {
	                                $noty.close();
	                            }
	                        }
	                    ]
	                });
	        };


	    });
	    
	  //取消选中  
	    function uncheckAll()   {   
	    	 var lst = document.getElementsByClassName("checkboxes");
	    	 for (var i = 1; i < lst.length; i++) {
	    		 if(lst[i].checked){
	    			 lst[i].checked=false;
	    		 }
	    	 }
	    }  
	    /**标准化时间*/
		function StandardTime(Time){
			if(Time==null){
				return "未知时间";
			}
			else{
				return new Date(Time.time).toLocaleDateString()+" "+Time.hours+":"+Time.minutes+":"+Time.seconds;
			}
		}
	    /**标准化状态*/
	    function ShowStatu(statu){
	    	if(statu==0){
	    		return '<span class="label label-warning">未读</span>';
	    	}else{
	    		return '<span class="label">已读</span>';
	    	}
	    }
	    function getMessageList() {
	        $.ajax({
	            url: "com.Manager.Communication/GetMessageByPage",
	            type: "POST",
	            data: { pageSize: pageSize, pageIndex: pageIndex, strSearch: strSearch,type:1},
	            dataType: "json",
	            success: function (result) {            	
	                if (result.code == 1) {
	                    count = result.count;
	                 //  alert(count);
	                    var html = "";
	                    var data=result.MessageList; 
	                 //   alert(new Date(data[1].sendTime.time).toLocaleDateString());
	                    for (var i = 0; i < data.length; i++) {
	                        html += '<tr class="odd gradeX">';
	                        html += '<td class="sorting_1"><div class="checker"><span><input type="checkbox" onclick="checkItem(this);" class="checkboxes" value=' + data[i].ID + '></span></div></td>';
	                        html += '<td class="hidden-480">' + data[i].sendName+ '</td>';
	                        html += '<td class="hidden-480">' + data[i].content + '</td>';
	                        html += '<td class="hidden-480">' +StandardTime(data[i].sendTime) + '</td>';
	                        html += '<td class="hidden-480">' +ShowStatu(data[i].receiverStatu)+ '</td>';
	                        html += '<td class="hidden-480"><a href="./com.Manager.Communication/EditContact?ID=' + data[i].ID + '&active=menupage6_6" class="label label-important" style="color: white;">不再显示</a></td>';
	                    }
	                    $("#ListBody").html(html);
	                }
	                else {
	                	count=0;
	                    var html = "";
	                    html += "<tr class='odd gradeX'>";
	                    html += "<td colspan='10' style='text-align:center'>抱歉，还没有任何信息</td>";
	                    html += "</tr>";
	                    $("#ListBody").html(html);
	                }
	                $("#chk_All").attr("checked", false).closest("span").removeClass("checked");

	                GetPageInfo(count,1);
	            },
	            error: function () {
	                console.log("error");
	            }
	        });
	    }
		
	    function getSendMessageList() {
	        $.ajax({
	            url: "com.Manager.Communication/GetMessageByPage",
	            type: "POST",
	            data: { pageSize: pageSize, pageIndex: pageIndex, strSearch: strSearch,type:2},
	            dataType: "json",
	            success: function (result) {            	
	                if (result.code == 1) {
	                    count = result.count;
	                    var html = "";
	                    var data=result.MessageList; 
	                 //   alert(new Date(data[1].sendTime.time).toLocaleDateString());
	                    for (var i = 0; i < data.length; i++) {
							html += '<tr><td>'+data[i].ID +'</td>';
	                    	html += '<td>'+data[i].receiverName +'</td>';
	                    	html += '<td>'+ data[i].content+'</td>';
	                    	html += '<td>'+StandardTime(data[i].sendTime)+'</td>';
	                    	html += '<td><span class="label label-success">发送成功</span></td>';
	                       /*  html += '<td class="hidden-480"><a href="./com.Manager.Communication/DeleteMessage?ID=' + data[i].ID + '&active=menupage6_6" class="label label-important" style="color: white;">删除</a></td></tr>'; */
	                    }
	                    $("#sendMessageList").html(html);
	                }
	                else {
	                	count=0;
	                    var html = "";
	                    html += "<tr class='odd gradeX'>";
	                    html += "<td colspan='10' style='text-align:center'>抱歉，还没有任何信息</td>";
	                    html += "</tr>";
	                    $("#sendMessageList").html(html);
	                }
	                $("#chk_All").attr("checked", false).closest("span").removeClass("checked");

	                GetPageInfo(count,2);
	            },
	            error: function () {
	                console.log("error");
	            }
	        });
	    }
	    
	    function GetPageInfo(count,type) {
	        var pageHtml = "";
	        var pageInfo="pageInfo";
	        var pagePart="pagePart";
	        var pageCount=0;
	        var recordCount=0;
	        if(type==1){pageInfo="pageInfo";pagePart="pagePart";}
	        else{pageInfo="pageSendInfo";pagePart="pageSendPart";}
	        if (count != 0) {
	        	//alert("page:"+count+"pageSize:"+pageSize+"pageIndex:"+pageIndex);
	            recordCount = count;
	            pageCount = Math.ceil(recordCount / pageSize);

	            if (pageIndex == 1) {
	                pageHtml += "<li class='prev disabled' ><a>← <span class='hidden-480'>上一页</span></a></li>";
	            }
	            else {
	                pageHtml += "<li class='prev' onclick='GotoPage(" + Number(pageIndex - 1) + ")'><a>← <span class='hidden-480'>上一页</span></a></li>";
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
	                pageHtml += " <li class='next disabled'><a><span class='hidden-480'>下一页</span> → </a></li>";
	            }
	            else {
	                pageHtml += " <li class='next' onclick='GotoPage(" + Number(pageIndex + 1) + ")'><a><span class='hidden-480'>下一页</span> → </a></li>";
	            }
	            $("#"+pagePart).html(pageHtml);
	            if (pageSize * pageIndex > recordCount) {
	                if (recordCount == 0) {
	                    $("#"+pageInfo).html("显示第 0 条数据到 0 条数据，总共 0 页");
	                }
	                else {
	                    $("#"+pageInfo).html("显示第 " + ((pageIndex - 1) * pageSize + 1) + " 条数据到 " + recordCount + " 条数据，总共 " + pageCount + " 页");
	                }
	            }
	            else {
	                $("#"+pageInfo).html("显示第 " + ((pageIndex - 1) * pageSize + 1) + " 条数据到 " + pageSize * pageIndex + " 条数据，总共 " + pageCount + " 页");
	            }
	        }
	        else {
	            pageHtml += "<li class='prev disabled' ><a>← <span class='hidden-480'>上一页</span></a></li>";
	            pageHtml += " <li class='next disabled'><a><span class='hidden-480'>下一页</span> → </a></li>";
	            $("#"+pageInfo).html("显示 0 条数据到 0 条数据，总共 0 页");
	        }
	        $("#"+pagePart).html(pageHtml);
	        if (pageIndex > pageCount) {
	        	if(pageCount==0)pageIndex=1;
	        	else pageIndex = pageCount;
	        }
	    }

	    function GotoPage(topage) {
	        pageIndex = topage;
	        if (0 < topage && topage <= pageCount&&type==1)
	            getContactList();
	        else if (0 < topage && topage <= pageCount&&type==2)
	        	getSendMessageList();
	    }
	</script>
</Layout:overwrite>
<%@ include file="/share/_Layout.jsp"%>
