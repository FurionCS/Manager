
<%@ taglib uri="Mytag" prefix="Layout"%>
<Layout:overwrite name="import">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
</Layout:overwrite>
<Layout:overwrite name="title">
I am title
</Layout:overwrite>
<Layout:overwrite name="Mycss">
<link href="Content/bootstrap/blog.css" rel="stylesheet" type="text/css"/>
</Layout:overwrite>

<Layout:overwrite name="MyContent">
<!-- BEGIN PAGE CONTAINER-->
			<div class="container-fluid">
			<!-- BEGIN PAGE HEADER-->
				<div class="row-fluid">
					<div class="span12">
						<!-- BEGIN PAGE TITLE & BREADCRUMB-->
						<ul class="breadcrumb">
							<li>
								<i class="icon-home"></i>
								<a href="index.html">首页</a> 
								<i class="icon-angle-right"></i>
							</li>
							<li>
								<a href="#">企业管理</a>
								<i class="icon-angle-right"></i>
							</li>
							<li><a href="#">公司公告</a></li>
						</ul>
						<!-- END PAGE TITLE & BREADCRUMB-->
					</div>
				</div>
				<!-- END PAGE HEADER-->
				<!-- BEGIN PAGE CONTENT-->
				<div class="row-fluid">
					<div class="span12 blog-page">
						<div class="row-fluid">
							<div class="span9 article-block" >
								<h1>公司公告
								<c:if test="${login.get(0).getID()==2}">
								<a class="btn blue" href="CompanyView/EditPublish.jsp?active=menupage4_2">
										发布公告
										<i class="icon-edit m-icon-white"></i>
								</a></c:if> 	</h1>
							<div id="ListBody">
								
							</div>
									
						</div>
							<!--end span9-->
							<div class="span3 blog-sidebar">
								<h2>热门模块</h2>
								<div class="top-news">
									<a href="javascript:void(0)" class="btn red">
									<span>Metronic News</span>
									<em>Posted on: April 16, 2013</em>
									<em>
									<i class="icon-tags"></i>
									Money, Business, Google
									</em>
									<i class="icon-briefcase top-news-icon"></i>
									</a>
									<a href="javascript:void(0)" class="btn green">
									<span>Top Week</span>
									<em>Posted on: April 15, 2013</em>
									<em>
									<i class="icon-tags"></i>
									Internet, Music, People
									</em>
									<i class="icon-music top-news-icon"></i>                             
									</a>
									<a href="javascript:void(0)" class="btn blue">
									<span>Gold Price Falls</span>
									<em>Posted on: April 14, 2013</em>
									<em>
									<i class="icon-tags"></i>
									USA, Business, Apple
									</em>
									<i class="icon-globe top-news-icon"></i>                             
									</a>
									<a href="javascript:void(0)" class="btn yellow">
									<span>Study Abroad</span>
									<em>Posted on: April 13, 2013</em>
									<em>
									<i class="icon-tags"></i>
									Education, Students, Canada
									</em>
									<i class="icon-book top-news-icon"></i>                              
									</a>
									<a href="javascript:void(0)" class="btn purple">
									<span>Top Destinations</span>
									<em>Posted on: April 12, 2013</em>
									<em>
									<i class="icon-tags"></i>
									Places, Internet, Google Map
									</em>
									<i class="icon-bolt top-news-icon"></i>                              
									</a>
								</div>
								<div class="space20"></div>
								<div class="space20"></div>
								<h2>公告事项</h2>
								<div class="tabbable tabbable-custom">
									<ul class="nav nav-tabs">
										<li class="active"><a data-toggle="tab" href="#tab_1_1">注意点</a></li>
										<li class=""><a data-toggle="tab" href="#tab_1_2">要求</a></li>
										<li class=""><a data-toggle="tab" href="#tab_1_3">规范</a></li>
									</ul>
									<div class="tab-content">
										<div id="tab_1_1" class="tab-pane active">
											<p>I'm in Section 1.</p>
											<p>
												Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat.
											</p>
										</div>
										<div id="tab_1_2" class="tab-pane">
											<p>Howdy, I'm in Section 2.</p>
											<p>
												Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat. Ut wisi enim ad minim veniam, quis nostrud exerci tation.
											</p>
										</div>
										<div id="tab_1_3" class="tab-pane">
											<p>Howdy, I'm in Section 3.</p>
											<p>
												Duis autem vel eum iriure dolor in hendrerit in vulputate.
												Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat
											</p>
										</div>
									</div>
								</div>
								<div class="space20"></div>
							</div>
							<!--end span3-->
						</div>
						<div class="row-fluid">
	                        <div class="span6">
	                            <div id="pageInfo" class="dataTables_info"></div>
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
				<!-- END PAGE CONTENT-->
			</div>
			<!-- END PAGE CONTAINER--> 

</Layout:overwrite>
<Layout:overwrite name="MyScript">
	<script>
		var pageSize = 3; //一页显示的记录数
	    var pageIndex = 1; //当前页
	    var PSize = 3;
	    var orderby = "", strSearch = "";
	    var count = 0;  //总记录数
	    $(document).ready(function () {
	     getContactList();
	    });   
	    /**标准化时间*/
		function StandardTime(Time){
			if(Time==null){
				return "未知时间";
			}
			else{
				return new Date(Time.time).toLocaleDateString()+" "+Time.hours+":"+Time.minutes+":"+Time.seconds;
			}
		}
	    function getContactList() {
	        $.ajax({
	            url: "com.Manager.Company/GetPublishByPage",
	            type: "POST",
	            data: { pageSize: pageSize, pageIndex: pageIndex, strSearch: strSearch},
	            dataType: "json",
	            success: function (result) {            	
	                if (result.code == 1) {
	                    count = result.count;
	                    var html = "";
	                    var data=result.PublishList;
	                    //alert(data[0].);
	                    for (var i = 0; i < data.length; i++) {
	                    	html+='<div class="row-fluid"><div class="blog-img blog-tag-data"><div class="row-fluid"><div class="span4 blog-img blog-tag-data">';
	                    	html+='<img src="'+data[i].picUrl+'" alt="公告图片" style="width:245px;height:180px;"/>';
							html+='<ul class="unstyled inline">';
							html+='<li><i class="icon-calendar"></i> <a href="#">'+StandardTime(data[i].publishTime)+'</a></li>';
							html+='<li><i class="icon-paper-clip"></i><a href="com.Manager.Company/BatchDownload?attachUrl='+data[i].attachment1+'&attachUrl2='+data[i].attachment2+'&attachUrl3='+data[i].attachment3+'">下载附件</a></li></ul>';
							html+='<ul class="unstyled inline blog-tags"><li>';
							html+='<i class="icon-tags"></i>';
							html+='<a href="javascript:void(0)">'+data[i].tabOne+'</a>';
							html+='<a href="javascript:void(0)">'+data[i].tabTwo+'</a>';
							html+='<a href="javascript:void(0)">'+data[i].tabThree+'</a> </li></ul></div>';
							html+='<div class="span8 blog-article">';
							html+='<h2><a href="javascript:void(0)">'+data[i].title+'</a></h2>';
							html+='<p>'+data[i].content+'</p>';
							html+='</div></div></div></div><hr>';
							
	                    }
	                    $("#ListBody").html(html);
	                }
	                else {
	                    var html = "";
	                    html += "<tr class='odd gradeX'>";
	                    html += "<td colspan='10' style='text-align:center'>抱歉，还没有任何信息</td>";
	                    html += "</tr>";
	                    $("#ListBody").html(html);
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
	            $("#pagePart").html(pageHtml);
	            if (pageSize * pageIndex > recordCount) {
	                if (recordCount == 0) {
	                    $("#pageInfo").html("显示第 0 条数据到 0 条数据，总共 0 页");
	                }
	                else {
	                    $("#pageInfo").html("显示第 " + ((pageIndex - 1) * pageSize + 1) + " 条数据到 " + recordCount + " 条数据，总共 " + pageCount + " 页");
	                }
	            }
	            else {
	                $("#pageInfo").html("显示第 " + ((pageIndex - 1) * pageSize + 1) + " 条数据到 " + pageSize * pageIndex + " 条数据，总共 " + pageCount + " 页");
	            }
	        }
	        else {
	            pageHtml += "<li class='prev disabled' ><a>← <span class='hidden-480'>上一页</span></a></li>";
	            pageHtml += " <li class='next disabled'><a><span class='hidden-480'>下一页</span> → </a></li>";
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
</Layout:overwrite>
<%@ include file="/share/_Layout.jsp"%>