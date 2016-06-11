<%@ taglib uri="Mytag" prefix="Layout"%>
<Layout:overwrite name="title">
导入联系人通过excel
</Layout:overwrite>
<Layout:overwrite name="MyContent">
<div class="row-fluid">
        <div class="span12">
            <ul class="breadcrumb">
                <li>
                    <i class="icon-home"></i>
                    <a href="/Home/Index">首页</a>
                    <i class="icon-angle-right"></i>
                </li>
                <li>
                    <a href="javascript:void(0);">通讯管理</a><i class="icon-angle-right"></i>
                </li>
                <li>
                    <a href="javascript:void(0);">通讯录管理</a><i class="icon-angle-right"></i>
                </li>
                <li>
                    <a href="javascript:void(0);">导入联系人通过excel</a><i class="icon-angle-right"></i>
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
                        <span class="NavTitle">通讯录表格</span>
                    </div>
                    <div class="tools">
                        <a href="javascript:;" class="collapse"></a>
                    </div>
                </div>
                <div class="portlet-body form">
                    <form action="#" id="InfoForm" class="form-horizontal" novalidate="novalidate">
                        <div class="control-group">
                            <label class="control-label">Excel文件</label>
                            <div class="controls">
                                <input type="file"id="fileInput" style="display:none;" />
                                <a id="choose" href="javascript:void(0);" type="button"  class="btn blue">上传文件<i class="icon-file"></i></a>
                                <span id="filename"></span>
                                <a type="button" class="btnWarning btn yellow" href="com.Manager.Util/SmartDownload?filename=博弈经济协会.xlsx"><i class="m-icon-swapdown m-icon-white"></i>下载模板</a>
                            </div>
                           
                        </div>                      
                        <div class="control-group"><div class="controls">注意:1:如果您还不清楚上传要求请下载模板。<br/>&nbsp;&nbsp;&nbsp;&nbsp;2:先选择文件并查看预览，确认无误后点击导入！！！</div></div>
                        <div class="control-group">
                        <div class="portlet"style="width:900px;">
							<div class="portlet-body" style="display: block;">
                                <div class="portlet-title" style="background:#57b5e3">
								<div class="caption" id="tableHeader"><i class="icon-bell" style="color:#fff"></i>预览</div>
							</div>
								<table class="table table-striped table-bordered table-advance table-hover">
									<thead>
										<tr>
											<th><i class="icon-male"></i> 名字</th>											
                                            <th><i class="icon-female"></i> 性别</th>
                                            <th><i class="icon-shopping-cart"></i> 出生日期</th>
                                            <th><i class="icon-comment"></i> 电话</th>
                                            <th><i class="icon-envelope"></i> 邮箱</th>
                                            <th><i class="icon-comment"></i> QQ</th>
                                            <th><i class=" icon-group"></i> 工作地址</th>
                                            <th><i class="icon-home"></i> 家庭地址</th>
                                            <th><i class="icon-inbox"></i> 邮编</th>										
										</tr>                                   
									</thead>
									<tbody id="ListBody">
										<tr>
											<td colspan="8" style="text-align:center;">上传表格后，在这里预览</td>
											
										</tr>
									</tbody>
								</table>
							</div>
                            </div>
						</div>
                        <div class="form-actions">
                            <a type="submit" class="btn green" href="javascript:void(0);" onclick="SaveForm();">导入</a>
    <!--                         @*<a type="button" class="btn green" href="javascript:void(0);" onclick="Clear();">清空</a>
                            <a type="button" class="btn green" href="javascript:void(0);" onclick="GoBack();">返回</a>*@ -->
                        </div>
                    </form>
                </div>

            </div>
            
        </div>
    </div>

</Layout:overwrite>
<Layout:overwrite name="MyScript">
<script>
    var reportlst = [];
    $(document).ready(function () {
        $("#choose").click(function () {
            $("#fileInput").click();
        });
        $("#fileInput").change(function () {
            reportlst = [];
            alert(this.value);
            if (this.value == "" || this.value == null) {
                $("#filename").html("没有选择任何文件");
                return;
            }
            $("#filename").html(this.value.split("\\").pop());
            var a = noty({
                text: "文件上传中...",
                type: 'information',
                dismissQueue: true,
                closeWith: ['click', 'backdrop'],
                modal: true,
                layout: 'topCenter',
                theme: 'defaultTheme',
                maxVisible: 10
            });
            /*var data = new FormData();
             data.append('file', this.files[0]);  */
             
             
             var data={'filename':this.value};
         	 alert(data.filename);
            var url = "com.Manager.Communication/ShowExcel";
            xhr = new XMLHttpRequest();
            xhr.open("post", url, true);
            xhr.onreadystatechange = function () {
                if (xhr.readyState == 4) {
                    if (200 == xhr.status) {
                        //alert(xhr.responseText); 
                        var json = JSON.parse(xhr.responseText);
                        if (json.code == "0") {
                            alert(json.message);
                        }
                        else if (json.code == "1") {
                            //上传成功
                            //alert(json.msg);
                            var html = "";
                            var data = JSON.parse(json.msg);
                            var n = 0;                          
                            for (var i = 0; i < (data.length) ; i++) {
                             
                                html += '<tr>';
                                html += '<td>' + data[i].cName + '</td>';
                                html += '<td>' + data[i].cDateStart + '</td>';
                                html += '<td>' + data[i].cDateEnd + '</td>';
                              
                                //html += '<td><a href="#" class="btn mini purple"><i class="icon-file"></i> 删除</a></td>';
                                html += '</tr>';
                                data[i].Time = null;
                                reportlst.push(data[i]);
                                n++;
                            }
                            $("#tableHeader").html("<i class='icon-bell'></i>" + "共 " + n + " 条记录");
                            $("#ListBody").html(html + '<tr><th colspan="3">请认真核对信息</th></tr>');
                        }
                        else if (json.code == "-1") {
                            alert(json.message);
                        }

                        xhr = null;

                    }
                    else {
                        alert('发生错误\nstatus:' + xhr.status + '\n返回内容:' + xhr.responseText);
                    }
                }

                a.close();
            }
            xhr.send(data);
        });
    });
    function SaveForm() {
        if (reportlst.length < 1) { return; }
        $.ajax({
            url: "/Class/save",
            type: "POST",
            data: {
                lst:reportlst
            },
            dataType: "json",
            success: function (result) {
                if (result.code == 1) {
                    noty({ text: result.msg, type: "success", layout: "topCenter", timeout: 3000, modal: true });
                    setTimeout(function () { location.href = "/Class/index?active=menupage6_5" }, 2000)
                }
                else {
                    noty({ text: result.msg, type: "warning", layout: "topCenter", timeout: 3000 });
                }
            },
            error: function () {
                console.log("error");
            }
        });
    }
</script>
</Layout:overwrite>
<%@ include file="/share/_Layout.jsp"%>