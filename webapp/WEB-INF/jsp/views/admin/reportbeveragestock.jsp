<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description"
	content="A fully featured admin theme which can be used to build CRM, CMS, etc.">
<meta name="author" content="Coderthemes">

<link rel="shortcut icon" href="images/favicon_1.ico">

<title>KOSIGN WeCafe...</title>

<!-- Base Css Files -->
<link
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css"
	rel="stylesheet" />

<!-- Font Icons -->
<link
	href="${pageContext.request.contextPath}/resources/assets/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/resources/assets/ionicon/css/ionicons.min.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/resources/css/material-design-iconic-font.min.css"
	rel="stylesheet">

<!-- animate css -->
<link
	href="${pageContext.request.contextPath}/resources/css/animate.css"
	rel="stylesheet" />

<!-- Waves-effect -->
<link
	href="${pageContext.request.contextPath}/resources/css/waves-effect.css"
	rel="stylesheet">

<!-- sweet alerts -->
<link
	href="${pageContext.request.contextPath}/resources/assets/sweet-alert/sweet-alert.min.css"
	rel="stylesheet">

<!-- Custom Files -->
<link href="${pageContext.request.contextPath}/resources/css/helper.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet" type="text/css" />

<link href="${pageContext.request.contextPath}/resources/css/customize.css" rel="stylesheet" type="text/css" />

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
        <![endif]-->

<script
	src="${pageContext.request.contextPath}/resources/js/modernizr.min.js"></script>

<style>
@media print {
	.content-page {
		margin-top: 0px;
		margin-left: 0px;
	}
	.content {
		margin-top: 0px;
		margin-bottom: 0px;
	}
}
</style>
</head>



<body class="fixed-left-void">

	<!-- Begin page -->
	<div id="wrapper">

		<!-- Top Bar Start -->
		<%@ include file="topbar.jsp"%>
		<!-- Top Bar End -->


		<!-- ========== Left Sidebar Start ========== -->
		<%@ include file="left_sidebar.jsp"%>
		<!-- Left Sidebar End -->
		<!-- ============================================================== -->
		<!-- Start right Content here -->
		<!-- ============================================================== -->
		<div class="content-page">
			<!-- Start content -->
			<div class="content">
				<div class="container">
					<div class="row">
						<div class="col-md-12">
							<div class="panel panel-default">
								<div class="panel-heading">
                                    <h4>Beverage Stock</h4>
                                    Date : <span id="labelDate"></span>
                                </div>  
								<div class="panel-body">
									
									<div class="row">
										<div class="col-md-12" id="print_data">
											<div class="overflow-x">
												<table>
													<thead>
														<tr>
															<th>#</th>															
															<th>Item</th>
															<th>Carried Over</th>
															<th>Purchase</th>
															<th>Sale</th>
															<th>Balance</th>
															
														</tr>
													</thead>
													<tbody id="searchDetail">
													 
													</tbody>
												</table>
											</div>
										</div>
									</div>
								
									<hr>
									<div class="row">
										<div class="col-md-2">
											<select id="PER_PAGE" class="form-control">
												
												<option value="15">15</option>
												<option value="30">30</option>
												<option value="50">50</option>
												<option value="100">100</option>
											</select>
										</div>
										<div id="PAGINATION" class="pull-right"></div>
									</div>
									<hr>
									<div class="hidden-print">
										<div class="pull-right">
											<a href="javascrpt:" class="btn btn-inverse waves-effect waves-light" id="btn_print" ><i class="fa fa-print"></i></a> <!-- <a
												href="#" class="btn btn-primary waves-effect waves-light">Submit</a> -->
										</div>
									</div>
								</div>
							</div>

						</div>

					</div>



				</div>
				<!-- container -->

			</div>
			<!-- content -->

			<footer class="footer text-center hidden-print"> KOSIGN
				WECAFE © 2015. </footer>
			
			<%@ include file="print_report_beverage_stock.jsp"%>

		</div>
		<!-- ============================================================== -->
		<!-- End Right content here -->
		<!-- ============================================================== -->
	</div>
	<!-- END wrapper -->

<script id="CONTENT_TEMPLATE" type="text/x-jquery-tmpl">
	<tr>
	     <td>{{= order}}</td>
	     <td>{{= pro_name}}</td>
	     <td>{{= carried_over}}</td>
	     <td>{{= pro_qty}}</td>
	     <td>{{= sale}}</td>
	     <td>{{= balance}}</td>
	</tr> 
</script>
	<script>
        var resizefunc = [];
        
    </script>

	<!-- jQuery  -->
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.ui.datepicker-ko.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery-ui.js"></script>
	<link rel="stylesheet"
		href="${pageContext.request.contextPath}/resources/css/jquery-ui.css">

	<script
		src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/waves.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/wow.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.nicescroll.js"
		type="text/javascript"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.scrollTo.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/jquery-detectmobile/detect.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/fastclick/fastclick.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/jquery-slimscroll/jquery.slimscroll.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/jquery-blockui/jquery.blockUI.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/jquery.tmpl.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/jquery.bootpag.min.js"></script>
	<script	src="${pageContext.request.contextPath}/resources/js/numeral.min.js"></script>
	
<script	src="${pageContext.request.contextPath}/resources/js/print.js"></script>
	<!-- CUSTOM JS -->
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.app.js"></script>
	<script>
 var st = "";
 $(document).ready(function(){ 
	// setCalendar();
	$("#labelDate").html(moment().format('YYYY-MM-DD'));
	 searchByDate(1);
	 var check = true;
		var order = 1;
		var v=[];
		var b = true;
	  
	 function searchByDate(currentPage){
      	var startDate 		= moment().format('YYYY-MM-DD');  
		  json = { 
					"currentPage" : currentPage,
		    		"perPage"     : $("#PER_PAGE").val() ,
		    		"start_date"   : startDate 
		};
		$.ajax({
			url: "${pageContext.request.contextPath}/admin/getsearchBeveragebydate/", 
	    	type: 'GET',
			//dataType: 'JSON',
			data: json, 
			beforeSend: function(xhr) {
	            xhr.setRequestHeader("Accept", "application/json");
	            xhr.setRequestHeader("Content-Type", "application/json");
	        },
			success: function(data){
				console.log(data);
				b = true;
				v = data;	
				if(data.beverage.length>0){
				$("tbody#searchDetail").html('');
				for(var i=0;i<data.beverage.length;i++){ 
					format(data.beverage[i]);
				}
				$("#CONTENT_TEMPLATE").tmpl(data.beverage).appendTo("tbody#searchDetail");
			}else{
				$("tbody#searchDetail").html('');
				
			}
	    	 if(check){
	    		setPagination(data.pagination.totalPages,1);
	    		check=false;
	    	}    
			},
			error:function(data, status,er){
				console.log("error: " + data + "status: " + status + "er: ");
			}
		});  
	 }

	  // print pursurse monthly 
    $("#btn_print").click(function(){ 
    	$("#report_start_date").html("Date : " + (moment().format('YYYY-MM-DD')));
    	
    	$('#request_stock_list').modal({
			"backdrop":"static"
		}) ;
		print_berverage();
    });
	  
	 function print_berverage(){
	      	var startDate 		= moment().format('YYYY-MM-DD');  
			  json = { 
			    		"start_date"   : startDate 
				};
			$.ajax({
				url: "${pageContext.request.contextPath}/admin/getsearchBeveragebydate_print/", 
		    	type: 'GET',
				data: json, 
				beforeSend: function(xhr) {
		            xhr.setRequestHeader("Accept", "application/json");
		            xhr.setRequestHeader("Content-Type", "application/json");
		        },
				success: function(data){
					console.log(data);
					b = true;
					 
					if(data.beverage.length>0){
					$("tbody#PRINT_CONTENTS").html('');
					for(var i=0;i<data.beverage.length;i++){ 
						format(data.beverage[i]);
					}
					$("#CONTENT_Print_beverage").tmpl(data.beverage).appendTo("tbody#PRINT_CONTENTS");
				}else{
					$("tbody#PRINT_CONTENTS").html('');				
				}  
				},
				error:function(data, status,er){
					console.log("error: " + data + "status: " + status + "er: ");
				}
			});  
		 }
		  
	  
	 
	 
	 
	 $("#btnREGS_DATE_S").click(function(){	
	 			$( "#REGS_DATE_S" ).datepicker("show");		
	 			
	 		});		
	 	$("#btnREGS_DATE_E").click(function(){
	 			$( "#REGS_DATE_E" ).datepicker("show");			
	 		});

	 function calculateDay(start, end){		
	         var days = (end - start) / (1000 * 60 * 60 * 24);
	         $("#totalday").val(days);
	         return;
	 }

	 function setCalendar(){		
	 		$("#REGS_DATE_S").datepicker({
	 		      defaultDate: new Date(),
	 		      setDate: new Date(),
	 		      changeMonth: true,
	 		      numberOfMonths: 1,
	 		      dateFormat: "yy-mm-dd",
	 		      onClose: function( selectedDate ) {			    	  
	 			    	    calculateDay($("#REGS_DATE_S").datepicker("getDate"),$("#REGS_DATE_E").datepicker("getDate"));
	 						//moneyPerDay($("#totalAmount").val(), $("#totalday").val());
	 						$("#REGS_DATE_E").datepicker("option", "minDate", selectedDate);
	 						searchByDate();
	 			      }
	 		});
	 		$("#REGS_DATE_E").datepicker({
	 		     defaultDate: new Date(),
	 		      setDate: new Date(),
	 		      changeMonth: true,
	 		      numberOfMonths: 1,
	 		      dateFormat: "yy-mm-dd",
	 		      onClose: function( selectedDate ) {

	 			    	  $("#REGS_DATE_S").datepicker("option", "maxDate", selectedDate);
	 			    	    calculateDay($("#REGS_DATE_S").datepicker("getDate"),$("#REGS_DATE_E").datepicker("getDate"));
	 						//moneyPerDay($("#totalAmount").val(), $("#totalday").val());
	 			    	   searchByDate();
	 			      }
	 		});		
	 		$("#REGS_DATE_S").datepicker('setDate', moment().format('YYYY-MM-DD'));
	 		//$("#REGS_DATE_E").datepicker('setDate', moment().add(30, 'days').format('YYYY-MM-DD'));
	 		$("#REGS_DATE_E").datepicker('setDate', moment().format('YYYY-MM-DD'));
	 }
	 setPagination = function(totalPage, currentPage){
	    	$('#PAGINATION').bootpag({
		        total: totalPage,
		        page: currentPage,
		        maxVisible: 10,
		        leaps: true,
		        firstLastUse: true,
		        first: 'First',
		        last: 'Last',
		        wrapClass: 'pagination',
		        activeClass: 'active',
		        disabledClass: 'disabled',
		        nextClass: 'next',
		        prevClass: 'prev',
		        lastClass: 'last',
		        firstClass: 'first'
		    }).on("page", function(event, currentPage){
		    	check = false;
		    	searchByDate(currentPage);
		    }); 
		};
		$("#PER_PAGE").change(function(){
			check = true;
			searchByDate(1);
	    });
	  	format = function(value){ 
			value["carried_over"] = numeral(value["carried_over"]).format('0,0');
			value["pro_qty"] = numeral(value["pro_qty"]).format('0,0');
			value["sale"] = numeral(value["sale"]).format('0,0'); 
			value["balance"] = numeral(value["balance"]).format('0,0');  
			if(b){
	 			order = v.pagination.perPage * (v.pagination.currentPage-1);
	 			j = order + 1;
	 			value["order"] =j;
	 			b = false;
	 		}
	 		else  
	 		value["order"] = ++j;
		}  
	 });
 </script>


</body>
</html>