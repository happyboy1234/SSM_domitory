<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../common/header_admin_list.jsp" %>
<body>
<form id="formId1" class="form-horizontal" style="padding:30px 20px 10px 25px;">
	<input type="hidden" name="id" />
	<div class="form-group  mt-10">
    	<label class="col-xs-3 col-sm-3 col-md-3 control-label"   ><span style="color:#F00">*</span>供应商名称</label>
    	<div class="col-xs-6 col-sm-6 col-md-6">
        	<input type="text" class="form-control" name="name" >
    	</div>
  	</div>
  	<div class="form-group  mt-10">
    	<label class="col-xs-3 col-sm-3 col-md-3 control-label"   ><span style="color:#F00">*</span>联系人</label>
    	<div class="col-xs-6 col-sm-6 col-md-6">
        	<input type="text" class="form-control" name="link" >
    	</div>
  	</div>
  	<div class="form-group  mt-10">
    	<label class="col-xs-3 col-sm-3 col-md-3 control-label"   ><span style="color:#F00">*</span>联系人电话</label>
    	<div class="col-xs-6 col-sm-6 col-md-6">
        	<input type="text" class="form-control" name="tel" >
    	</div>
  	</div>
  	<div class="form-group  mt-10">
    	<label class="col-xs-3 col-sm-3 col-md-3 control-label"   ><span style="color:#F00">*</span>公司电话</label>
    	<div class="col-xs-6 col-sm-6 col-md-6">
        	<input type="text" class="form-control" name="phone" >
    	</div>
  	</div>
  	<div class="form-group  mt-10">
    	<label class="col-xs-3 col-sm-3 col-md-3 control-label"   ><span style="color:#F00">*</span>公司地址</label>
    	<div class="col-xs-6 col-sm-6 col-md-6">
        	<input type="text" class="form-control" name="addr" >
    	</div>
  	</div>
  	<div class="form-group  mt-10">
    	<label class="col-xs-3 col-sm-3 col-md-3 control-label"   ><span style="color:#F00">*</span>备注</label>
    	<div class="col-xs-6 col-sm-6 col-md-6">
        	<input type="text" class="form-control" name="descr" >
    	</div>
  	</div>
  	<div class="form-group">
    	<div class=" col-xs-6 col-sm-6 col-md-6  col-md-offset-3 col-sm-offset-3 col-xs-offset-4">
      		<button type="submit" class="btn btn-success" lay-submit lay-filter="formDemo">保存</button>
    	</div>
  	</div>
</form>

<script type="text/javascript">
$(function(){
	//数据回显
	var id = $(this).getUrlParam("id");
	$.getJSON("getInfo.do?"+ new Date().getTime(), {id:id}, function(data){
		for(k in data){
			if ($("[name='"+k+"']").length){
				$("[name='"+k+"']").attr("val", data[k]);
				$("[name='"+k+"']").val(data[k]);
			}
		}
	});
	//数据提交
    $("#formId1").validate({
		rules:{
			name:{required:true,minlength:1,maxlength:50},
			link:{required:true,minlength:1,maxlength:50},
			tel:{required:true,minlength:1,maxlength:50},
			phone:{required:true,minlength:1,maxlength:50},
			addr:{required:true,minlength:1,maxlength:50},
			descr:{required:true,minlength:1,maxlength:50},
		},
		onkeyup:false,
		focusCleanup:true,
		submitHandler:function(form){
			$.ajax({
                type:"post", 
                dataType:"json", 
                data : $("#formId1").serialize(),
                url:"update.do",
                success:function(data){
                	if (data.success) {
                		layer.msg(data.msg, {icon:data.icon,time:1500},function(){
                			var index = parent.layer.getFrameIndex(window.name);
    		                parent.$('#search').click();
    		                parent.layer.close(index);
    		            });
                	} else {
                		layer.alert(data.msg,{icon : data.icon});
                	}
                },
                error:function(XMLHttpRequest, textStatus, errorThrown) {
                	alert(XMLHttpRequest.status + "\r\n"+ errorThrown);
                	console.log(XMLHttpRequest, XMLHttpRequest.status,textStatus, errorThrown);
                }  
            });
		}
	});

});
</script> 
</body>
</html>