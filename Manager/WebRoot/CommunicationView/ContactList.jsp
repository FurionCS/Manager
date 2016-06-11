<%@ taglib uri="Mytag" prefix="Layout"%>
<Layout:overwrite name="import">
<%@ page import="com.Manager.Bean.*" %>
</Layout:overwrite>
<Layout:overwrite name="title">
联系人列表
</Layout:overwrite>
<Layout:overwrite name="Mycss">
  <link href="Content/bootstrap/DT_bootstrap.css" rel="stylesheet" />
  <style>
	.btnWarning{
	background-color:#f0ad4e;
	color:#fff !important;
	}
	.btnWarning:hover,.btnWarning:VISITED,.btnWarning:active{
	background-color:#EEA239 !important;
	}
	.btnprimary{
	background-color:#4d90fe;
	color:#fff !important;
	}
	.btnprimary:hover,.btnprimary:VISITED,.btnprimary:active{
	background-color:#0d638f !important;
	}

	</style>
	<link rel="stylesheet" type="text/css" href="Content/bootstrap/jquery.fileupload-ui.css" />
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
                        <a href="javascript:void(0)">联系人列表</a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <div class="clearfix"></div>
  
        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"></span></button>
        <h4 >excel上传到数据库</h4>
      </div>
      <div class="modal-body">
        <form id="fileupload">
        	<span class="btn green fileinput-button">
        		<i class="icon-plus icon-white"></i>
        		<span>上传文件</span>
        		<input type="file" name="files[]" id="upfile" multiple/>    
        	</span>       
        </form>
        	<p>说明：如果您不清楚上传的要求请先下载模板</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <a type="button" class="btnWarning btn" href="com.Manager.Util/SmartDownload?filename=博弈经济协会.xlsx"><i class="m-icon-swapdown m-icon-white"></i>下载模板</a>
        <button type="button" class="btn btnprimary"><i class="m-icon-swapup m-icon-white"></i>确定上传</button>
      </div>
    </div>
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
     getContactList();
        document.getElementById("pagesize").onchange = function () {
            if (this.value < 0) {
                pageSize = count;
            } else
                pageSize = this.value;
            getContactList();
        }
        document.getElementById("search").onkeyup = function () {
            strSearch = this.value;
            getContactList();
        };

        document.getElementById("delete").onclick = function () {
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
                    text: '确定要删除这些信息吗',
                    type: 'information',
                    layout: 'center',
                    buttons: [
                        {
                            addClass: 'btn blue', text: '确定', onClick: function ($noty) {
                                $.ajax({
                                    url: "com.Manager.Communication/DeleteContact",
                                    type: "POST",
                                    data: {
                                        ids: str
                                    },
                                    dataType: "json",
                                    success: function (result) {
                                        if (result.code == 1) {
                                        	alert(result.DeleteNum);
                                            $noty.close();
                                            noty({ text: result.msg, type: 'information', layout: 'center', timeout: 2000 });
                                            getContactList();
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


    function getContactList() {
        $.ajax({
            url: "com.Manager.Communication/GetContactByPage",
            type: "POST",
            data: { pageSize: pageSize, pageIndex: pageIndex, strSearch: strSearch},
            dataType: "json",
            success: function (result) {            	
                if (result.code == 1) {
                    count = result.count;
                    var html = "";
                    var data=result.ContactList;          
                    for (var i = 0; i < data.length; i++) {
                        html += '<tr class="odd gradeX">';
                        html += '<td class="sorting_1"><div class="checker"><span><input type="checkbox" onclick="checkItem(this);" class="checkboxes" value=' + data[i].ID + '></span></div></td>';
                        html += '<td class="hidden-480">' + data[i].name+ '</td>';
                        html += '<td class="hidden-480">' + data[i].sex + '</td>';
                        html += '<td class="hidden-480">' + data[i].phone + '</td>';
                        html += '<td class="hidden-480">' + data[i].email + '</td>';
                        html += '<td class="hidden-480">' + data[i].QQ  + '</td>';
                        html += '<td class="hidden-480">' + data[i].homeAddress + '</td>';
                        html += '<td class="hidden-480">' + data[i].workAddress + '</td>';
                        html += '<td class="hidden-480">' + data[i].code + '</td>';
                        html += '<td class="hidden-480"><a href="./com.Manager.Communication/EditContact?ID=' + data[i].ID + '&active=menupage6_6" class="label label-important" style="color: white;">编辑</a></td>';
                      
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