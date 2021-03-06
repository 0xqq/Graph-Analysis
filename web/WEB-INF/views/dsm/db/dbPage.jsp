<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="Shortcut Icon"
	href="${pageContext.request.contextPath}/img/main/icon.png" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/utils/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/utils/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/utils/font-awesome/css/font-awesome-ie7.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/utils/materialize/css/materialize.min.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/utils/jquery/jquery-3.1.0.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/utils/easyui/js/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/utils/easyui/js/easyui-lang-zh_CN.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/utils/materialize/js/materialize.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/css/dsm/db/db.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/utils/easyui/css/easyui.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/utils/easyui/css/icon.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/utils/jRange/css/jquery.range.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/dsm/db/db.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/utils/cytoscape/js/cytoscape.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/utils/jscolor/js/jscolor.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/utils/jRange/js/jquery.range.js"></script>
</head>
  
<body>
    <div class="main">
		<div class="main-side-bar-left" >
			<div class="logo">
				
			</div>
            
			<div class="source">
				<h5>连接</h5>
				<ul>
					<li>
						<div class="file-title"><%= request.getParameter("ipAddress") %></div>
						<div class="file-type"><%= request.getParameter("dataBaseType") %></div>
					</li>
				</ul>
			</div>

			<div class="worksheet" id="data-source">
				<h5>数据库</h5>
				<ul>
					<li>
						<div>
							<select class="browser-default" id="db_select">
								<option value="" selected>请选择数据库</option>
							</select>
						</div>
					</li>
				</ul>
			</div>
			
			<div class="worksheet" id="data-source">
				<h5>表</h5>
				<ul>
					<li>
						<div>
							<select class="browser-default" id="table_select">
								<option value="" selected>请选择表</option>
							</select>
						</div>
					</li>
				</ul>		
			</div>
            
            <div class="worksheet" id="data-source">
				<h5>源点</h5>
				<ul>
					<li>
						<div>
							<select class="browser-default" id="source_select">
								<option value="" selected>请选择起始点</option>
							</select>
						</div>
					</li>
				</ul>			
			</div>
			
			<div class="worksheet" id="data-source">
				<h5>目标点</h5>
				<ul>
					<li>
						<div>
							<select class="browser-default" id="target_select">
								<option value="" selected>请选择目标点</option>
							</select>
						</div>
					</li>
				</ul>		
			</div>
			
			<div class="worksheet">
				<h5>布局</h5>
				<ul>
					<li>
						<div>
							<select class="browser-default" id="layout_graph">
								<option value="" selected>请选择布局</option>
								<option value="grid">grid</option>
								<option value="concentric">concentric</option>
								<option value="cose">cose</option>
								<option value="circle">circle</option>
								<option value="breadthfirst">breadthfirst</option>
								<option value="random">random</option>
								<option value="preset">preset</option>
							</select>
						</div>
					</li>
				</ul>		
			</div>
			

			<div style="padding-left: 32px;margin-right: 18px;margin-top: 20px;">
			  <button class="waves-effect waves-light btn" style="width: 100%;" onclick="graph_display()"><i class="icon-off"></i>&nbsp;&nbsp;&nbsp;运行</button>
			</div>
			
		</div>
		<input type="hidden" id="nodeTap"/>   <!-- 隐藏域，保存抓取到的点的id -->
		

		<div class="main-content-center">
			<!-- 中心部分内容 -->
			<div class="main-content-center-header">
				<h5 style="margin-left: 25px;" > 
					<i class="icon-file-text-alt" style="margin-right: 24px;"></i><%= request.getParameter("ipAddress") %>
			    </h5>
			</div>
			<!-- 撑开该部分，使得和左侧导航条的logo处一样的高度 -->

			<div id="main-content-center-footer">
			 
			</div>
		</div>

        <!-- 右侧边栏放置分析算法 -->
		<div class="main-side-bar-right">
			<ul class="collapsible" data-collapsible="accordion" style="margin: 0; padding: 0;">
				<li>
					<div class="collapsible-header">
						<i class="icon-foursquare"></i>ALOGRITHM
					</div>
					<div class="collapsible-body" id="alogrithm-tabs">
					
					<ul>
					<li>
						<div>
							<select class="browser-default" id="graph_select">
								<option value="" selected>请选择图分析算法</option>
							</select>
						</div>
					</li>
				  </ul>
					  <!-- <ul>
					    <li>
					      <span class="title">fitstNeighbor</span>
					      <button class="go-run" style="width: 40px;height: 22px;padding-bottom: 10px;">run<i class="icon-play-circle"></i></button>
					    </li>
					     <li>
					      <span class="title">breadthFirstSearch</span>
					      <button class="go-run" style="width: 40px;height: 22px;padding-bottom: 10px;">run</button>
					    </li>
					     <li>
					      <span class="title">depthFirstSearch</span>
					      <button class="go-run" style="width: 40px;height: 22px;padding-bottom: 10px;">run</button>
					    </li>
					     <li>
					      <span class="title">pageRank</span>
					      <button class="go-run" style="width: 40px;height: 22px;padding-bottom: 10px;">run</button>
					    </li>
					  </ul> -->
					</div>
				</li>
				<li>
					<div class="collapsible-header">
						<i class="icon-cogs"></i>SETTING
					</div>
					<div class="collapsible-body" id="setting-tabs">
						<ul>
						  <li><span>节点颜色</span><input class="jscolor {required:false}" id="setting-node-color" style="height: 20px;"></li>
						  <li><span>边颜色</span><input class="jscolor {required:false}" id="setting-edge-color" style="height: 20px;"></li>
						  <li style="margin-bottom: 20px;"><span>点宽度</span></li>
						  <li style="margin-bottom: 20px;width: 90%"><input type="hidden" class="slider-input" value="10" id="setting-node-width" title="点宽度"/></li>
						  <li style="margin-bottom: 20px;"><span>边宽度</span></li>
						  <li style="margin-bottom: 20px;width: 90%"><input type="hidden" class="slider-input" value="10" id="setting-edge-width" /></li>
						  <li>
						    <span>点形状</span>
						    <select id="setting-node-shape" style="width: 100%;height: 35px;" class="browser-default">
			                 <option>default</option>
						     <option>rectangle</option>
						     <option>roundrectangle</option>
						     <option>ellipse</option>
						     <option>triangle</option>
						     <option>pentagon</option>
						     <option>hexagon</option>
						     <option>heptagon</option>
						     <option>octagon</option>
						     <option>star</option>
						     <option>diamond</option>
						     <option>vee</option>
						     <option>rhomboid</option>
						     <option>polygon</option>
							 </select>
					      </li>
					      <li style="margin-bottom: 20px;"><span>点透明度</span></li>
					      <li style="margin-bottom: 20px;width: 90%"><input type="hidden" class="node-edge-opacity" value=".2" id="node-opacity" title="点宽度"/></li>
					      <li style="margin-bottom: 20px;"><span>边透明度</span></li>
					      <li style="margin-bottom: 20px;width: 90%"><input type="hidden" class="node-edge-opacity" value=".2" id="edge-opacity" title="点宽度"/></li>
					      <li>
						    <span>线类型</span>
						    <select id="edge-style" style="width: 100%;height: 35px;" class="browser-default">
					         <option>default</option>
			                 <option>solid</option>
						     <option>dotted</option>
						     <option>dashed</option>
							 </select>
					      </li>
					      <li style="margin-bottom: 20px;"><span>点高度</span></li>
						  <li style="margin-bottom: 20px;width: 90%"><input type="hidden" class="slider-input" value="10" id="setting-node-height" title="点宽度"/></li>
						  <li style="margin-bottom: 20px;"><span>边高度</span></li>
						  <li style="margin-bottom: 20px;width: 90%"><input type="hidden" class="slider-input" value="10" id="setting-edge-height" /></li>
						  <li>
						    <span>边方向</span>
						    <select id="edge-direction" style="width: 100%;height: 35px;" class="browser-default">
					         <option>haystack</option>
			                 <option>bezier</option>
						     <option>unbundled-bezier</option>
							 </select>
					      </li>
					      <li  style="margin-bottom: 10px;">
						    <span>箭头形状</span>
						    <select id="arrow-shape" style="width: 100%;height: 35px;" class="browser-default">
					         <option>tee</option>
			                 <option>triangle</option>
						     <option>triangle-tee</option>
						     <option>triangle-backcurve</option>
						     <option>square</option>
						     <option>circle</option>
						     <option>diamond</option>
						     <option>none</option>
							 </select>
					      </li>
						  <li><button class="waves-effect waves-light btn"  style="width: 100%" onclick="refreshGraph()"><i class="icon-refresh"></i>&nbsp;&nbsp;&nbsp;刷新</button><li>
						</ul>
					</div>
					
				</li>
			</ul>
		</div>
		<!-- main-side-bar-right结束 -->
		<%-- <div class="logo">
				
			</div>
            
			<div class="source">
				<h5>连接</h5>
				<ul>
					<li>
						<div class="file-title"><%= request.getParameter("ipAddress") %></div>
						<div class="file-type"><%= request.getParameter("dataBaseType") %></div>
					</li>
				</ul>
			</div> --%>

			<!-- <div class="worksheet" id="data-source"> -->
				<!-- <h5>图分析算法</h5>
				<ul>
					<li>
						<div>
							<select class="browser-default" id="graph_select">
								<option value="" selected>请选择图分析算法</option>
							</select>
						</div>
					</li>
				</ul> -->
			</div>
			<!-- <div class="worksheet" id="setting" style="height: 455px;"> -->
				<!-- <h5>图属性设置</h5>
				<div>
				  <input class="jscolor {required:false}" id="setting-node-color" style="height: 20px;" placeholder="节点颜色">
				  <input class="jscolor {refine:false}"  id="setting-edge-color" style="height: 20px;" placeholder="边颜色">
				  <input type="hidden" class="slider-input" value="10" id="setting-node-width" />
				  <p style="height: 30px;"></p>
				  <input type="hidden" class="slider-input" value="5" id="setting-node-height"/>
				  <p style="height: 30px;"></p>
				  
				  <select id="setting-node-shape" style="height: 20px;">
				     <option>default</option>
				     <option>rectangle</option>
				     <option>roundrectangle</option>
				     <option>ellipse</option>
				     <option>triangle</option>
				     <option>pentagon</option>
				     <option>hexagon</option>
				     <option>heptagon</option>
				     <option>octagon</option>
				     <option>star</option>
				     <option>diamond</option>
				     <option>vee</option>
				     <option>rhomboid</option>
				     <option>polygon</option>
				  </select>
				  
				</div> -->
				
			<!-- </div> -->
			
			<!-- <div style="padding-left: 32px;margin-right: 18px;margin-top: 20px;">
			  <button class="waves-effect waves-light btn" style="width: 100%;" onclick="refreshGraph()">刷新</button>
			</div> -->
		<!-- </div> -->
	
	<script type="text/javascript">
	  $(document).ready(function() {
        $('select').material_select();
      });
	</script>
	
	<!-- 当页面加载完成后，完成数据库的初始化操作 -->
	<script type="text/javascript">
	  $(function (){
	     //在加载该页面时完成"选择数据库"下拉菜单的初始化
	     var driverName =  '<%= (String) request.getParameter("driverName")%>';
		 var dataBaseType = '<%= (String) request.getParameter("dataBaseType")%>';
		 var ipAddress = '<%= (String) request.getParameter("ipAddress")%>';
		 var portNumber = '<%= (String) request.getParameter("portNumber")%>';
		 var connectionName = '<%= (String) request.getParameter("connectionName")%>';
		 var userName = '<%= (String) request.getParameter("userName")%>';
		 var password = '<%= (String) request.getParameter("password")%>';
		 if (dataBaseType == "GREENPLUM") {
		     var dataBaseName = '<%= (String) request.getParameter("dataBaseName")%>';
		     //alert("数据库名为:" + dataBaseName)
		     $.ajax({
		     url: "/graphanalysis/dsm/db/showDatabase?t=" + (new Date()).getTime(),
		     type: "POST",
		     dataType: "JSON",
		     data : {
				"driverName" : driverName,
				"dataBaseType" : dataBaseType,
				"ipAddress": ipAddress,
				"portNumber": portNumber,
				"connectionName": connectionName,
				"dataBaseName": dataBaseName,
				"userName": userName,
				"password": password,
			},
			success: function (backData){
			     var dbNames = backData.dbNames.toString();
			     //alert(dbNames);
			     var arr = dbNames.split(",");   //将字符串从,处切分开
			     var selector = $('#db_select');   //找到相应的select元素
			     for(var i = 0 ; i < arr.length ; i++){
			        //alert(arr[i]);   //遍历得到的字符数组
			        selector.append('<option value="'+i+'">'+arr[i]+'</option>');  //得到的元素形式为<option value="0">information_schema</option>
			     }
			},
			
			error : function(XMLHttpRequest, textStatus, errorThrown) {
					alert("数据库返回错误");
				}
		 })
		 }else {
		     $.ajax({
		     url: "/graphanalysis/dsm/db/showDatabase?t=" + (new Date()).getTime(),
		     type: "POST",
		     dataType: "JSON",
		     data : {
				"driverName" : driverName,
				"dataBaseType" : dataBaseType,
				"ipAddress": ipAddress,
				"portNumber": portNumber,
				"connectionName": connectionName,
				"userName": userName,
				"password": password,
			},
			success: function (backData){
			     var dbNames = backData.dbNames.toString();
			     //alert(dbNames);
			     var arr = dbNames.split(",");   //将字符串从,处切分开
			     var selector = $('#db_select');   //找到相应的select元素
			     for(var i = 0 ; i < arr.length ; i++){
			        //alert(arr[i]);   //遍历得到的字符数组
			        selector.append('<option value="'+i+'">'+arr[i]+'</option>');  //得到的元素形式为<option value="0">information_schema</option>
			     }
			},
			
			error : function(XMLHttpRequest, textStatus, errorThrown) {
					alert("数据库返回错误");
				}
		    })
		 }
	  })
	</script>
	
	<!-- 完成数据库和该数据库中表的二级联动 -->
	<script type="text/javascript">
	    $('#db_select').change(function (){
	        //在构造option之前，应该删除之前已经存在的option，否则会出现option的叠加现象
	        var tableElement = document.getElementById("table_select");
	        tableElement.options.length = 1;
	        var sourceElement = document.getElementById("source_select");  //联动源点的下拉菜单
	        sourceElement.options.length = 1;
	        var targetElement = document.getElementById("target_select");   //联动目标点的下拉菜单
	        targetElement.options.length = 1; 
	        
	        
	        //获取数据库选中的值
	        var index = this.selectedIndex;  //this代表是当前select下拉框
	        var optionElement = this[index];   //把整个下拉框看成一个数组来处理，每一个option都是数组中的元素
	        var dbName = optionElement.innerHTML;   //获取到选中下来框的内容
	        var driverName =  '<%= (String) request.getParameter("driverName")%>';
			var dataBaseType = '<%= (String) request.getParameter("dataBaseType")%>';
			var ipAddress = '<%= (String) request.getParameter("ipAddress")%>';
			var portNumber = '<%= (String) request.getParameter("portNumber")%>';
			var connectionName = '<%= (String) request.getParameter("connectionName")%>';
			var userName = '<%= (String) request.getParameter("userName")%>';
			var password = '<%= (String) request.getParameter("password")%>';
			//alert("选择的数据库为:" + dbName)
	        //发送ajax请求到服务器端，得到该数据库下所有的表
	        if(dbName != "请选择数据库"){
	            $.ajax({
	            url: "/graphanalysis/dsm/db/showTable?t=" + (new Date()).getTime(),
	            type: "POST",
	            dataType: "JSON",
	            data: {
	                "driverName" : driverName,
					"dataBaseType" : dataBaseType,
					"ipAddress": ipAddress,
					"portNumber": portNumber,
					"connectionName": connectionName,
					"userName": userName,
					"password": password,
					"dbName": dbName,
	            },
				success : function(backData) {
					if (backData.tables != null) {
						var tables = backData.tables.toString();
						var arr = tables.split(",");

						var selector = $('#table_select'); //找到相应的select元素
						for (var i = 0; i < arr.length; i++) {
							selector.append('<option value="' + i + '">' + arr[i] + '</option>'); //构造选择表下拉菜单的option
						}

					}
				},
				error: function (){
                alert("数据库表返回错误");
                }    
	        })       
	        }
	        
	    })
	</script>
	
	<!-- 完成数据库表到表的列的二级联动 -->
	<script type="text/javascript">
	    $('#table_select').change(function (){
	        //在构造option之前，应该删除之前已经存在的option，否则会出现option的叠加现象
	        var sourceElement = document.getElementById("source_select");  //联动源点的下拉菜单
	        sourceElement.options.length = 1;
	        var targetElement = document.getElementById("target_select");   //联动目标点的下拉菜单
	        targetElement.options.length = 1; 
	        
	        //获取选中的数据库名
	        var dbName = $('#db_select').find("option:selected").text();
	        /* alert(dbName); */
	        //获取表选中的值
	        var index = this.selectedIndex;  //this代表是当前select下拉框
	        var optionElement = this[index];   //把整个下拉框看成一个数组来处理，每一个option都是数组中的元素
	        var tableName = optionElement.innerHTML;   //获取到选中下来框的内容
	        
	        //alert(tableName);
	        var driverName =  '<%= (String) request.getParameter("driverName")%>';
			var dataBaseType = '<%= (String) request.getParameter("dataBaseType")%>';
			var ipAddress = '<%= (String) request.getParameter("ipAddress")%>';
			var portNumber = '<%= (String) request.getParameter("portNumber")%>';
			var connectionName = '<%= (String) request.getParameter("connectionName")%>';
			var userName = '<%= (String) request.getParameter("userName")%>';
			var password = '<%= (String) request.getParameter("password")%>';
	        //发送ajax请求到服务器端，得到该数据库下所有的表
	        $.ajax({
	            url: "/graphanalysis/dsm/db/showColumn?t=" + (new Date()).getTime(),
	            type: "POST",
	            dataType: "JSON",
	            data: {
	                "driverName" : driverName,
					"dataBaseType" : dataBaseType,
					"ipAddress": ipAddress,
					"portNumber": portNumber,
					"connectionName": connectionName,
					"userName": userName,
					"password": password,
					"dbName": dbName,
					"tableName": tableName
	            },
	            success: function (backData){
	               var columns = backData.columns.toString();
	               var arr = columns.split(",");
	               var selector_source = $('#source_select');   //找到相应的select元素
	               var selector_target = $('#target_select');   //找到相应的select元素
	               for(var i = 0 ; i < arr.length ; i++){    
	                   selector_source.append('<option value="'+i+'">'+arr[i]+'</option>');  //构造选择表下拉菜单的option
	                   selector_target.append('<option value="'+i+'">'+arr[i]+'</option>');  //构造选择表下拉菜单的option
	               }
	            },
	            error: function (){
	                alert("返回错误");
	            }    
	        })       
	    })
	</script>
	
	<!-- 构造JSON串，实现图展示 -->
	<script type="text/javascript">
		function graph_display() {
			var dbName = $('#db_select').find("option:selected").text(); //获取当前的选中的数据库
			var tableName = $('#table_select').find("option:selected").text(); //获取当前选中的表
			var sourceNode = $('#source_select').find("option:selected").text(); //获取当前选中的起始点
			var targetNode = $('#target_select').find("option:selected").text(); //获取当前选中的终点
			var ly = $('#layout_graph').find("option:selected").text();  //获取当前选中的布局
			var driverName =  '<%= (String) request.getParameter("driverName")%>';
			var dataBaseType = '<%= (String) request.getParameter("dataBaseType")%>';
			var ipAddress = '<%= (String) request.getParameter("ipAddress")%>';
			var portNumber = '<%= (String) request.getParameter("portNumber")%>';
			var connectionName = '<%= (String) request.getParameter("connectionName")%>';
			var userName = '<%= (String) request.getParameter("userName")%>';
			var password = '<%= (String) request.getParameter("password")%>';
	
			//alert("获取到的数据为:" + dbName + " " + tableName + " " + source + " " + target);
			
			if(dbName == "请选择数据库" || tableName == "请选择表" || sourceNode == "请选择起始点" || targetNode == "请选择目标点") {
			    //alert("不执行");
			}else{
			    //alert("执行");
			    //获取到数据库的连接信息、选择好的数据库、数据库表、表中的两行发送到服务器端
			    $.ajax({
			       url: "/graphanalysis/dsm/db/dbDataFormatJson?t=" + (new Date()).getTime(),
			       type: "POST",
			       dataType: "JSON",
			       data: {
			            "dbName": dbName,
			            "tableName": tableName,
			            "sourceNode": sourceNode,
			            "targetNode": targetNode,		            
			            "driverName" : driverName,
						"dataBaseType" : dataBaseType,
						"ipAddress": ipAddress,
						"portNumber": portNumber,
						"connectionName": connectionName,
						"userName": userName,
						"password": password,
			       },
			       success: function (backData){
			         //alert("成功的开始构造JSON字符串");
			         var str = JSON.stringify(backData,  null , 2);  //将JSON对象转换成字符串
			         //alert(str);
			         cy = cytoscape({    //在此声明了一个全局变量cy，在任何地方都能引用该变量
							container : $("#main-content-center-footer"),  //jquery获取元素
							elements : backData,
							style : [ // the stylesheet for the graph
									{
										selector : 'node',
										style : {
										    'label' : 'data(name)',
											/* 'background-color' : 'red',
											
											'width': 2,
											'opacity': .9,
											'size': 60,
											'shape': 'ellipse',
											'width': 10,
											'height': 20,  */
										}
									},
	
									{
										selector : 'edge',
										style : {
										    'label': 'data(name)',
										    /* 'target-arrow-shape' : 'triangle',
											'width' : 4,
											'line-color' : '#ccc',
											'target-arrow-color' : '#ccc',
											'opacity': 2,
											'curve-style': 'bezier', //设置边到底是有向还是无向边
											 */
										}
									}
								],
							layout : {
								name : ly,
								directed: true,
								/* padding: 10, */
								margin: 2,
							},
							zoom: 1,
                            pan: { x: 0, y: 0 },
                            hideEdgesOnViewport: true,
                            motionBlur: true,
                            motionBlurOpacit: 0.5,
                            wheelSensitivity: 0.5,  /*滚轮滚动时改变图的大小的参数*/
                            pixelRatio: 'auto',
						});
						$('#setting-icon').removeClass('icon-cog');  
						$('#setting-icon').addClass('icon-cog');  //在右侧增加设置按钮
						
						/*进行布局的切换*/
						$("#layout_graph").change(function() {
						    //alert("切换布局");
						    if(cy != undefined){
						        ly = $('#layout_graph').find("option:selected").text();   //获取当前选中的布局方式
							    //alert(cy);   //获取到变量
							    //alert("布局方式为:" + ly + "接受到的id为:" + id + "接受到的fileName为:" + fileName);
							    cy.layout({name: ly});    //使用API获取到全局变量cy，切换布局方式
						    }
							
						});
						cy.nodes().on('tap', function(event) {
							var nodeID = event.cyTarget.id();   //获取到点击时元素的id
							//获取到要删除元素的id,cyTarget代表当前事件操作的元素
							var nodeObj = cy.$('#'+ nodeID);    //使用#和id进行拼接，形成完整的id选择器，并获取到该元素
							//alert("点击节点"+ nodeID);
						    
						    //当选中图中的点之后，创建图分析算法的option
						    var graphElement = document.getElementById("graph_select")  //父亲节点
						    graphElement.options.length = 1;
						    
						    var graphSelect = $('#graph_select');
						    var selection_1 = $('<option>firstNeighbors</option>');  //创建第一个节点
						    var selection_2 = $('<option>breadthFirstSearch</option>');  //创建第二个节点
						    var selection_3 = $('<option>depthFirstSearch</option>');  //创建第三个节点
	                        var selection_4 = $('<option>pageRank</option>');  //创建第四个节点
	                        graphSelect.append(selection_1);
	                        graphSelect.append(selection_2);
	                        graphSelect.append(selection_3);
	                        graphSelect.append(selection_4);
	                        
	                        
	                        var colorStr="";
						    //字符串的每一字符的范围  
				            var randomArr=['0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f']; 
				            //产生一个六位的字符串  
						    for(var i=0;i<6;i++){  
						        //15是范围上限，0是范围下限，两个函数保证产生出来的随机数是整数  
						        colorStr+=randomArr[Math.ceil(Math.random()*(15-0)+0)];  
						    }  
						    var color = '#' + colorStr;    //拼接成一个随机色
						    
						    //直接给该选中的元素着色
						    nodeObj.style({'background-color' : color});
						    
	                        //将上述得到的nodeID保存到sessinon中，方便客户端其它函数获取
	                        $.ajax({
	                            async: false,
	                            url: "/graphanalysis/dsm/db/saveNodeId?t=" + (new Date()).getTime(),
	                            type: "POST",
	                            dataType: "JSON",
	                            data: {
	                                "nodeID" : nodeID,
	                                "color" : color,
	                            },
	                            success: function (backData) {
	                                //alert(typeof(backData.nodeID)); 
	                                var inputElement = $('#nodeTap');
	                                inputElement.val(backData.nodeID + "," + backData.color);
	                            },
	                            error: function (XMLHttpRequest, textStatus, errorThrown){
	                                alert("返回错误");
	                                alert(XMLHttpRequest.readyState + XMLHttpRequest.status + XMLHttpRequest.responseText);
	                            }
	                        })
						});  //tap事件结束
						
		 	       },
			       error: function (XMLHttpRequest, textStatus, errorThrown) {
			           alert("返回错误");
			           alert(XMLHttpRequest.readyState + XMLHttpRequest.status + XMLHttpRequest.responseText);
			       },
			    })
			}
		}   //构造JSON串实现图
	</script>
	
	<!-- 当图分析算法发生点击事件时，激活该段代码 -->
	<script type="text/javascript">
     /*在单选列表上增加鼠标单击事件，进行算法切换*/
		$('#graph_select').change(function() {
			var algorithmName = $('#graph_select').find("option:selected").text();;   //获取当前选中的元素值#graph_select
			//alert("得到的算法为:"+algorithmName);
		    var nodeIDAndColor = $('#nodeTap').val();   //得到点的id和color值，分别拆成id和color
		    //alert(nodeIDAndColor);
		    var arrNodeColor = nodeIDAndColor.split(",");  //从逗号处将整个字符串拆开
		    var nodeID = arrNodeColor[0];     //从拆开的数组中获取到nodeID的值
		    //alert("第一个点的序号为:" + nodeID);
		    var color = arrNodeColor[1];      //从拆开的数组中获取到color的值
		    var nodeObj = cy.$('#'+ nodeID);    //使用#和id进行拼接，形成完整的id选择器，并获取到该元素
		    /* nodeObj.style({'background-color' : color});    //将选中的点的颜色设置为黑色 */
		    //alert("得到的最近的节点为:"+ nodeID); 
		    switch (algorithmName){
		        case "firstNeighbors" :
		        {
                    nodeObj.neighborhood('node').style({'background-color' : color});   //将选中的点的邻居点全部颜色设置为黑色
                    nodeObj.neighborhood('edge').style({'line-color' : color});   //将选中的点的邻居边全部设置为蓝色
                    nodeObj.neighborhood('edge').style({'target-arrow-color' : color});   //将选中的点的邻居边全部设置为蓝色
                    
                    break;
		        }
		        case "breadthFirstSearch" :
		        {
		            var bfs = cy.elements().bfs({
		                 roots: nodeObj,   
		            });
		            var path = bfs.path;   //找到的路径
		            var found = bfs.found;   //找到的点
		            path.style({'background-color' : color});   //给找到的边着色
		            found.style({'background-color' : color});  //给找到的点着色
		            break;
		        }
		        case "depthFirstSearch" :
		        {
		            var dfs = cy.elements().dfs({
		                roots: nodeObj,
		            });
		            var path = dfs.path; //找到的点的路径
		            var found = dfs.found ; //找到的点
		            path.style({'background-color' : color});   //给找到的边着色
		            found.style({'background-color' : color});  //给找到的点着色
		            break;
		        }
		        
		        case "pageRank" :
		        {
		            var pr = cy.elements().pageRank();
		            alert(pr.rank(nodeObj));   //输出某个点的pageRank值
		            break;
		        }
		        
		        case "k-means" :
		        {
		            break;
		        }
		        case "markov" :
		        {
		            break;
		        }
		        case "hierarchical" :
		        {
		            break;
		        }
		        case "affinity" :
		        {
		            break;
		        }
		        
		    }
		});
	</script>
	
	<!-- jquery的范围插件，不用手动输入值，这样能够避免参数的校验 -->
	<script type="text/javascript">
	   $('.slider-input').jRange({
	    from: 1,     /*开始刻度*/
	    to: 50,     /*结束刻度*/
	    step: 1,     /*滑动过程的步长*/
	    scale: [1,10,20,30,40,50],  /*整个尺子的刻度*/
	    format: '%s',  
	    width: 290,    /*尺子的宽度*/
	    showLabels: true,    /*滑动的过程中是否显示当前值*/
	    snap: true,   /*滑动过程中捕获步长值*/
	    theme: 'theme-blue',
	   });
	</script>
	
	<script type="text/javascript">
	    function refreshGraph(){
	        /*设置点的颜色*/
	        var settingNodeElement = $('#setting-node-color').val();
	        var settingNodeColor = '#' + settingNodeElement;
	        cy.nodes().style({'background-color': settingNodeColor});
	        
	        /*设置边的颜色*/
	        var settingEdgeElement = $('#setting-edge-color').val();
	        //alert(settingEdgeElement)
	        var settingEdgeColor = '#' + settingEdgeElement;
	        cy.edges().style({'line-color': settingEdgeColor});
	        
	        /*设置点的宽和高*/
	        var settingNodeWidth = $('#setting-node-width').val();
	        //alert("宽为 " + settingNodeWidth )
	        cy.nodes({'width': Number(settingNodeWidth)});
	        var settingNodeHeight = $('#setting-node-height').val();
	        //alert("高为 " + settingNodeHeight );
	        cy.nodes({'height': Number(settingNodeHeight)});
	        
	        /*设置点的类型*/
	        var nodeShape = $('#setting-node-shape').find("option:selected").text()  //setting-node-shape
	        cy.nodes().style({'shape':nodeShape});
	        
	        /*设置点透明度*/
	        var settingNodeOpacity = $('#node-opacity').val();
	        cy.nodes().style({'opacity': Number(settingNodeOpacity)});
	        
	        /*设置边透明度*/
	        var settingEdgeOpacity = $('#edge-opacity').val();
	        //alert(typeof(settingEdgeOpacity))
	        cy.edges().style({'opacity': Number(settingEdgeOpacity)});
	        
	        /*设置线类型*/
	        var edgeStyle = $('#edge-style').find("option:selected").text();
	        cy.edges().style({'line-style': edgeStyle});
	        
	        /*设置点标签内容*/
	        var nodeLabelContent = $('#node-label-content').find("option:selected").text();
	        cy.nodes().style({'label': 'data(nodeLabelContent)'});
	        /*设置边标签内容*/
	        var edgeLabelContent = $('#edge-label-content').find("option:selected").text();
	        //alert(edgeLabelContent)
	        cy.nodes().style({'label': 'data(edgeLabelContent)'});
	        
	        /*设置边的宽和高*/
	        var settingEdgeWidth = $('#setting-edge-width').val();
	        //alert("宽为 " + settingNodeWidth )
	        cy.edges({'width': Number(settingEdgeWidth)});
	        var settingEdgeHeight = $('#setting-edge-height').val();
	        cy.edges().style({'height': Number(settingEdgeHeight)});
	        
	        /*设置边方向*/
	        var edgeDirection = $('#edge-direction').find("option:selected").text();
	        cy.edges().style({'curve-style': edgeDirection});
	        
	        /*设置箭头形状*/
	        var arrowShape = $('#arrow-shape').find("option:selected").text();
	        cy.edges().style({'target-arrow-shape': ''  + arrowShape});
	    }
	</script>
	
	<script type="text/javascript">
	  //
	  $('.node-edge-opacity').jRange({
	    from: 0,     /*开始刻度*/
	    to: 1,     /*结束刻度*/
	    step: 0.1,     /*滑动过程的步长*/
	    scale: [0,0.2,0.4,0.6,0.8,1],  /*整个尺子的刻度*/
	    format: '%s',  
	    width: 290,    /*尺子的宽度*/
	    showLabels: true,    /*滑动的过程中是否显示当前值*/
	    snap: true,   /*滑动过程中捕获步长值*/
	    theme: 'theme-blue',
	   });
	</script>
</body>
</html>
