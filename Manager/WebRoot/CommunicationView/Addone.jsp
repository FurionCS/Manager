<%@ taglib uri="Mytag" prefix="Layout"%>
<Layout:overwrite name="title">
增加联系人
</Layout:overwrite>
<Layout:overwrite name="Mycss">
<link href="Content/bootstrap/datepicker.css" rel="stylesheet" />
    <link href="Content/bootstrap/datetimepicker.css" rel="stylesheet" />
     <link href="Content/bootstrap/jquery-ui-1.7.2.custom.css" rel="stylesheet" />
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
                    <a href="javascript:">联系人录入</a><i class="icon-angle-right"></i>
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
                        <span class="NavTitle">填写联系人信息</span>
                    </div>
                    <div class="tools">
                        <a href="javascript:;" class="collapse"></a>
                    </div>
                </div>
               
                <div class="portlet-body form">
                    <form action="com.Manager.Communication/Addone" method="post" onsubmit="return sumbitCheck();"  id="myform" class="form-horizontal" novalidate="novalidate">
                        <div class="control-group">
                            <label class="control-label">姓名</label>
                            <div class="controls">
                                <input type="text" name="Name" id="Name" class="span6 m-wrap popovers" data-trigger="hover" data-content="请填写联系人姓名" data-input="text" data-maxlength="250" required />
                                <span style="color: red;" id="spanName"></span>
                            </div>
                        </div>
                        
                        <div class="control-group">
                            <label class="control-label">性别&nbsp;</label>
                            <div class="controls" >
                                <input type="radio" name="sex" id="sex1" class="span6 m-wrap popovers"value="男" checked="checked" required /><span style="position:relative;top:4px;">男</span>
                                <input type="radio" name="sex" id="sex2" class="span6 m-wrap popovers"value="女"  required /><span  style="position:relative;top:4px;">女</span>
                                <span style="color: red;" id="spanOriginalPrice"></span>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">电话&nbsp;</label>
                            <div class="controls">
                                <input type="text" name="phone" id="phone" class="span6 m-wrap popovers" data-trigger="hover" data-content="请填写联系人电话" data-input="text" data-maxlength="250" required />
                                <span style="color: red;" id="spanphone"></span>
                            </div>
                        </div>
                       
                        <div class="control-group">
                            <label class="control-label">邮箱</label>
                            <div class="controls">
                                <input type="email" name="email" id="email" class="span6 m-wrap popovers" data-trigger="hover" data-content="请填写邮箱" data-input="text" data-maxlength="250" required />
                                <span style="color: red;" id="spanemail"></span>
                            </div>
                        </div>
                        <!-- <div class="control-group">
                            <label class="control-label">出生年月</label>
                            <div class="controls">
                                <input type="date" name="Birthday" id="Birthday" class="span6 m-wrap popovers" data-trigger="hover" data-content="请填写出生年月" data-input="text" data-maxlength="250" required />
                                <span style="color: red;" id="spanBirthday"></span>
                            </div>
                        </div> -->
                         <div class="control-group">
                            <label class="control-label">出生年月</label>
                            <div class="controls">
                                <input type="text" name="Birthday" id="Birthday" class="span6 m-wrap popovers" data-trigger="hover" data-content="请填写出生年月" data-input="text" data-maxlength="250" required />
                                <span style="color: red;" id="spanEndTime"></span>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">QQ</label>
                            <div class="controls">
                                <input type="text" name="QQ" id="QQ" class="span6 m-wrap popovers" data-trigger="hover" data-content="请填写QQ" data-input="text" data-maxlength="250" required />
                                <span style="color: red;" id="spanQQ"></span>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">工作地址</label>
                            <div class="controls">
                                <input type="text" name="workAdress" id="workAdress" class="span6 m-wrap popovers" data-trigger="hover" data-content="请填写工作地址" data-input="text" data-maxlength="250" required />
                                <span style="color: red;" id="spanworkAdress"></span>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">家庭地址</label>
                            <div class="controls">
                                <input type="text" name="HomeAdress" id="HomeAdress" class="span6 m-wrap popovers" data-trigger="hover" data-content="请填写家庭地址" data-input="text" data-maxlength="250" required />
                                <span style="color: red;" id="spanHomeAdress"></span>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">邮编</label>
                            <div class="controls">
                                <input type="text" name="Code" id="Code" class="span6 m-wrap popovers" data-trigger="hover" data-content="请填写邮编" data-input="text" data-maxlength="250" required />
                                <span style="color: red;" id="spanCode"></span>
                            </div>
                        </div>
                       
                         
                        <div class="form-actions">
                            <input type="submit" class="btn green" value="保存"/>
                            <a type="button" class="btn green" href="javascript:void(0);" onclick="Clear();">清空</a>
                          <!--   @*<a type="button" class="btn green" href="javascript:void(0);" onclick="GoBack();">返回</a>*@ -->
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    
  </Layout:overwrite>
<Layout:overwrite name="MyScript">
	<script src="Scripts/bootstrap/bootstrap-datepicker.js"></script>
    <script src="Scripts/bootstrap/bootstrap-datetimepicker.min.js"></script>
    <script src="Scripts/bootstrap/locales/bootstrap-datetimepicker.zh-CN.js"></script>
	<script src="./Js/AddoneCommunication.js" charset="UTF-8"></script>
</Layout:overwrite>
<%@ include file="../share/_Layout.jsp"%>
 
 
 
 