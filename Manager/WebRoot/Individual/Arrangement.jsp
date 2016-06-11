<%@ taglib uri="Mytag" prefix="Layout"%>
<Layout:overwrite name="title">
日程安排
</Layout:overwrite>
<Layout:overwrite name="Mycss">
<link href="Content/bootstrap/fullcalendar.css" rel="stylesheet" />

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
                        <a href="javascript:void(0)">个人管理</a><i class="icon-angle-right"></i>
                    </li>

                    <li>
                        <a href="javascript:void(0)">日程安排</a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <div class="clearfix"></div>
				<!-- END PAGE HEADER-->
				<!-- BEGIN PAGE CONTENT-->
				<div class="row-fluid">
					<div class="portlet box blue calendar">
						<div class="portlet-title">
							<div class="caption"><i class="icon-reorder"></i>Calendar</div>
						</div>
						<div class="portlet-body light-grey">
							<div class="row-fluid">
								<div class="span3 responsive" data-tablet="span12 fix-margin" data-desktop="span8">
									<!-- BEGIN DRAGGABLE EVENTS PORTLET-->    
									<h3 class="event-form-title">Draggable Events</h3>
									<div id="external-events">
										<form class="inline-form">
											<input type="text" value="" class="m-wrap span12" placeholder="Event Title..." id="event_title" /><br />
											<a href="javascript:;" id="event_add" class="btn green">Add Event</a>
										</form>
										<hr />
										<div id="event_box">
										</div>
										<label for="drop-remove">
										<input type="checkbox" id="drop-remove" />remove after drop                         
										</label>
										<hr class="visible-phone" />
									</div>
									<!-- END DRAGGABLE EVENTS PORTLET-->            
								</div>
								<div class="span9">
									<div id="calendar" class="has-toolbar"></div>
								</div>
							</div>
							<!-- END CALENDAR PORTLET-->
						</div>
					</div>
				</div>
			<!-- END PAGE CONTENT-->		
			<!-- END PAGE CONTAINER--> 
</Layout:overwrite>
<Layout:overwrite name="MyScript">
<script src="Scripts/bootstrap/bootbox.min.js"></script>
	<script src="Scripts/bootstrap/fullcalendar.min.js"></script>
	<script src="Scripts/bootstrap/calendar-ch.js"></script>
 <script>
		jQuery(document).ready(function() {       
		   // initiate layout and plugins
		   Calendar.init();	
		}); 
</script>
		
</Layout:overwrite> 
<%@ include file="/share/_Layout.jsp"%>
