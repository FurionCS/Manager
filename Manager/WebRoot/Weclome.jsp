<%@ taglib uri="Mytag" prefix="Layout"%>
<Layout:overwrite name="title">
首页
</Layout:overwrite>
<Layout:overwrite name="MyContent">

<div class="row-fluid">
        <div>
            <div class="span12">
                <ul class="breadcrumb">
                    <li>
                        <i class="icon-home"></i>
                        <a href="Weclome.jsp">首页</a>
                        <i class="icon-angle-right"></i>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <div class="clearfix"></div>
            <div class="row-fluid"  style="font-family:微软雅黑">
						<div class="span3 responsive" data-tablet="span6" data-desktop="span3">
							<div class="dashboard-stat blue">
								<div class="visual">
									<i class="icon-comments"></i>
								</div>
								<div class="details">
									<div id="msNumber"class="number">66</div>
									<div class="desc">未读短消息</div>
								</div>
								<a class="more" href="CommunicationView/Message.jsp?active=menupage6_0">查看详情 <i class="m-icon-swapright m-icon-white"></i></a>                 
							</div>
						</div>
						<div class="span3 responsive" data-tablet="span6" data-desktop="span3">
							<div class="dashboard-stat green">
								<div class="visual">
									<i class="icon-group"></i>
								</div>
								<div class="details">
									<div id="csNumber" class="number">549</div>
									<div class="desc">通讯录人数</div>
								</div>
								<a class="more" href="CommunicationView/ContactList.jsp?active=menupage6_6">查看详情 <i class="m-icon-swapright m-icon-white"></i></a>                 
							</div>
						</div>
						<div class="span3 responsive" data-tablet="span6  fix-offset" data-desktop="span3">
							<div class="dashboard-stat purple">
								<div class="visual">
									<i class="icon-bell"></i>
								</div>
								<div class="details">
									<div class="number">666</div>
									<div class="desc">新增工作公告</div>
								</div>
								<a class="more" href="javascript:">查看详情 <i class="m-icon-swapright m-icon-white"></i></a>          
							</div>
						</div>
						<div class="span3 responsive" data-tablet="span6" data-desktop="span3">
							<div class="dashboard-stat yellow">
								<div class="visual">
									<i class="icon-bullhorn"></i>
								</div>
								<div class="details">
									<div class="number">44</div>
									<div class="desc">新增公司公告</div>
								</div>
								<a class="more" href="javascript:">查看详情 <i class="m-icon-swapright m-icon-white"></i></a>                 
							</div>
						</div>
					
							<div class="">
							<!-- BEGIN tendency-->
							<div class="portlet solid bordered light-grey">
								<div class="portlet-title">
									<div class="caption"><i class="icon-bar-chart"></i>趋势图</div>
									<div class="tools">
										<div class="btn-group pull-right" data-toggle="buttons-radio">
											<!--<a href="#" class="btn mini active">评价</a>
                                            <a href="#" class="btn mini">投诉</a>-->
                                            <select id="chartType">
                                                <option value="hour">过去12小时内</option>
                                                <option value="day">过去两周内</option>
                                                <option value="month">过去1年内</option>
                                            </select>
										</div>
									</div>
								</div>
							<!-- END tendency-->	
											
								<div class="portlet-body">
									<div id="site_statistics_loading">
										<img src="Content/image/loading.gif" alt="loading" />
									</div>
									<div id="site_statistics_content" class="hide">
										<div id="site_statistics" class="chart"></div>
									</div>
								</div>
							</div>
							<!-- END PORTLET-->
						</div>
					</div>
					
				<!-- 	<div class="span5 responsive">
						BEGIN BUTTONS PORTLET
						<div class="portlet box green">
							<div class="portlet-title">
								<div class="caption"><i class="icon-reorder"></i>Buttons</div>
								<div class="tools">
									<a href="javascript:;" class="collapse"></a>
									<a href="#portlet-config" data-toggle="modal" class="config"></a>
									<a href="javascript:;" class="reload"></a>
									<a href="javascript:;" class="remove"></a>
								</div>
							</div>
							<div class="portlet-body">

								<h4>联系人男女比例如下图:</h4>

								<div id="pie_chart_7" class="chart"></div>

							</div>

						</div>
                    </div>
            	 -->

</Layout:overwrite>
<Layout:overwrite name="MyScript">
	<script src="Scripts/bootstrap/jquery.flot1.js" charset="utf-8"></script>
	 <script src="Scripts/bootstrap/jquery.flot.stack.js"></script>
	<script>

	var num = 12;
    var unit = "hour";
    var pageviews = [];
    var visitors = [];
    getNumList();//消息，通讯录，新增公告
    getData();//趋势图获得数据方法
  
    
    function getNumList(){
    	$.ajax({
            url: "com.Manager.Home/GetNumList",
            type: "POST",
            data: {
            },
            dataType: "json",
            success: function (result) {
                if (result.code == 1) {
                	$("#msNumber").html(result.msCount);
                	$("#csNumber").html(result.csCount);
                }
                else {
                    noty({ text: "获取失败", type: "warning", layout: "topCenter", timeout: 3000 }); return;
                }
            },
            error: function (error) {
                noty({ text: "请检查网络！", type: "warning", layout: "topCenter", timeout: 3000 });
                console.log("error"); return;
            }
        });
    }
    $("#chartType").change(function () {
        $('#site_statistics_loading').show();
        $('#site_statistics_content').hide();
        unit = this.value;
        if (this.value == "day") num = 14;
        else num = 12;
        getData();
    });
    function getData() { 	
        $.ajax({
            url: "com.Manager.Home/GetTrendData",
            type: "POST",
            data: {
                num: num, unit: unit
            },
            dataType: "json",
            success: function (result) {
                if (result.code == 1) {
                    pageviews = result.ALSM;
                   // alert(pageviews);
                    visitors = result.ALSM2;
                    MyChart();
                }
                else {
                    noty({ text: "获取失败", type: "warning", layout: "topCenter", timeout: 3000 }); return;
                }
            },
            error: function (error) {
                noty({ text: "请检查网络！", type: "warning", layout: "topCenter", timeout: 3000 });
                console.log("error"); return;
            }
        });
    }
    function MyChart() {
        if (!jQuery.plot) {
            return;
        }
        var data = [];
        var totalPoints = 250;
        // random data generator for plot charts

        function getRandomData() {
            if (data.length > 0) data = data.slice(1);
            // do a random walk
            while (data.length < totalPoints) {
                var prev = data.length > 0 ? data[data.length - 1] : 50;
                var y = prev + Math.random() * 10 - 5;
                if (y < 0) y = 0;
                if (y > 100) y = 100;
                data.push(y);
            }
            // zip the generated y values with the x values
            var res = [];
            for (var i = 0; i < data.length; ++i) res.push([i, data[i]])
            return res;
        }

        function showTooltip(title, x, y, contents) {
            $('<div id="tooltip" class="chart-tooltip"><div class="date">' + title + '<\/div><div class="label label-success">增长量: ' + contents + '<\/div><\/div>').css({
                position: 'absolute',
                display: 'none',
                top: y - 100,
                width: 75,
                left: x - 40,
                border: '0px solid #ccc',
                padding: '2px 6px',
                'background-color': '#fff'
            }).appendTo("body").fadeIn(200);
        }

        function randValue() {
            return (Math.floor(Math.random() * (1 + 50 - 20))) + 10;
        }

     
        if ($('#site_statistics').size() != 0) {

            $('#site_statistics_loading').hide();
            $('#site_statistics_content').show();

            var plot_statistics = $.plot($("#site_statistics"), [{
                data: pageviews,
                label: "新增消息"
            }, {
                data: visitors,
                label: "新增消息"
            }
            ], {
                series: {
                    lines: {
                        show: true,
                        lineWidth: 2,
                        fill: true,
                        fillColor: {
                            colors: [{
                                opacity: 0.05
                            }, {
                                opacity: 0.01
                            }
                            ]
                        }
                    },
                    points: {
                        show: true
                    },
                    shadowSize: 2
                },
                grid: {
                    hoverable: true,
                    clickable: true,
                    tickColor: "#eee",
                    borderWidth: 0
                },
                colors: ["#d12610", "#37b7f3", "#52e136"],
                xaxis: {
                    mode: "time",
                    
                    ticks: 11,
                    tickDecimals: 0
                },
                yaxis: {
                    ticks: 11,
                    tickDecimals: 0
                }
            });

            var previousPoint = null;
            $("#site_statistics").bind("plothover", function (event, pos, item) {
                $("#x").text(pos.x.toFixed(2));
                $("#y").text(pos.y.toFixed(2));
                //alert(item);
                if (item) {
                    if (previousPoint != item.dataIndex) {
                        previousPoint = item.dataIndex;
                        //alert(item.datapoint);
                        $("#tooltip").remove();
                        var x = item.datapoint[0].toFixed(2),
                            y = item.datapoint[1].toFixed(2);
                        showTooltip(new Date(item.datapoint[0] - 8 * 60 * 60 * 1000).Format((unit!="month")?"MM月dd日":"MM月"), item.pageX, item.pageY, item.datapoint[1]); //item.series.label + " of " + x + " = " + y);

                    }
                } else {
                    $("#tooltip").remove();
                    previousPoint = null;
                }
            });
        }               
    }
    Date.prototype.Format = function (format) {
        var o = {
            "M+": this.getMonth() + 1, //month 
            "d+": this.getDate(), //day 
            "h+": this.getHours(), //hour 
            "m+": this.getMinutes(), //minute 
            "s+": this.getSeconds(), //second 
            "q+": Math.floor((this.getMonth() + 3) / 3), //quarter 
            "S": this.getMilliseconds() //millisecond 
        }

        if (/(y+)/.test(format)) {
            format = format.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
        }

        for (var k in o) {
            if (new RegExp("(" + k + ")").test(format)) {
                format = format.replace(RegExp.$1, RegExp.$1.length == 1 ? o[k] : ("00" + o[k]).substr(("" + o[k]).length));
            }
        }
        return format;
    };
    </script>
</Layout:overwrite>

<%@ include file="/share/_Layout.jsp"%>



 
 
 
 