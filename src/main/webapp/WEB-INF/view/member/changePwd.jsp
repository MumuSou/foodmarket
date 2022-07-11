<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<jsp:include page="../layout/memberNavbar.jsp" />
<title>修改密碼</title>
</head>
<body>

<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-md-4">
  <div
   class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
   <h1 class="h2">會員管理</h1>
  </div>
 </main>

<div class="col-md-9 ml-sm-auto col-lg-10 px-md-4 pb-2 mb-3 border-bottom">
 <div class="container-fluid">
<form class="form" method="post" action="${contextRoot}/changePwd">
<div class="container mt-5">
<div class="form-row justify-content-start mt-2">
	
	<div class="form-group col-md-5">
      <label for="oldPassword">請輸入現在的密碼</label>
      <span id="oldpswmsg" class="badge badge-secondary badge-danger"></span>
      <input type="password" class="form-control" id="oldPassword" name="oldPassword" required value="">
    </div>
    
     <div class="w-100"></div>
    
    <div class="form-group col-md-5">
      <label for="password">請輸入新密碼</label>
      <span id="pswmsg" class="badge badge-secondary badge-danger"></span>
      <input type="password" class="form-control" id="password" name="password" required value="">
    </div>
    
     <div class="w-100"></div>
     
    <div class="form-group col-md-5">
      <label for="password2">請再次輸入新密碼</label>
      <span id="pswmsg2" class="badge badge-secondary badge-danger"></span>
      <input type="password" class="form-control" id="password2" name="password2" required value="">
    </div>

</div>

<div class="form-row justify-content-start mt-4">
<button class="btn btn-outline-success col-md-3 mt-4" type="button" id="input">一鍵輸入</button>
<button type="submit" class="btn btn-outline-primary col-md-3 mt-4" id="submit">送出</button></div>
</div>
</form>
 </div>
</div>

<c:if test="${error != null}">
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">錯誤</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        ${error}
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
<button class="btn btn-primary" onclick="show()">show</button>
</c:if>


<script src="${contextRoot}/js/jquery-3.6.0.js"></script>
<script src="${contextRoot}/js/bootstrap.bundle.min.js"></script>

<script type="text/javascript">

$('#input').click(function(){
	$('#oldPassword').val('a12345');
	$('#password').val('a12345');
	$('#password2').val('a12345');
})

$(window).ready(() => {
	$('#myModal').modal('show');
})

var oldPwdCheck = false;
var pwd1Checked = true;
var pwd2Checked = true;
var oldPwdInput = $('#oldPassword').val();

$(document).ready(function(){
	   $('#oldPassword').keyup(function(){
		   var oldPassword = $('#oldPassword').val();
		   var id = ${loginUserId}
		   
// 		   if($.trim(oldPassword)==''){
// 			   alert('Account is empty');
// 			   return;
// 		   }
		   
		   var params = {"oldPassword":''+oldPassword, "id":''+ id};
		   console.log(params)
		  
		   $.ajax({
			   type:'post',
			   url:'${contextRoot}/checkPwd',
			   contentType:'application/json',
			   data: JSON.stringify(params),
			   success: function(data){
				   if(data=='Y'){
					   oldPwdCheck = true;
						$('#oldpswmsg')[0].innerHTML=''
						lock();
				   }
				   
				   if(data=='N'){
					   oldPwdCheck = false;
						$('#oldpswmsg')[0].innerHTML='密碼錯誤'
						lock();
				   }
			   },
			   error: function(e){
				   console.log(e);
			   }
		   });
	   });
});

$('#password').keyup(function(){
	var pswInput = $('#password').val();
	var pattern = new RegExp("^[A-Za-z0-9]+$");
		
	if (pswInput == "") {
		pwd1Checked = false;
		lock();
		$('#pswmsg')[0].innerHTML='請輸入密碼'
	}		
	if (pswInput.length >= 6) {
		if (pattern.test(pswInput)) {
			pwd1Checked = true;
			lock();
			$('#pswmsg')[0].innerHTML=''
		} else {
			pwd1Checked = false;
			lock();
			$('#pswmsg')[0].innerHTML='本欄位只接受數字及英文字母'
		}
	} else {
		pwd1Checked = false;
		lock();
		$('#pswmsg')[0].innerHTML='請輸入至少六位數之密碼'
	}
});

$('#password').keyup(function(){
	var pswInput = $('#password').val();
	var pswInput2 = $('#password2').val();
	
	if (pswInput2 == "") {
		pwd2Checked = false;
		lock();
		$('#pswmsg2')[0].innerHTML='請再次輸入密碼'
	}	
	
	if(pswInput2 != pswInput){
		pwd2Checked = false;
		lock();
		$('#pswmsg2')[0].innerHTML='密碼不一致'	
	}else{
		pwd2Checked = true;
		lock();
		$('#pswmsg2')[0].innerHTML=''
	}
});

$('#password2').keyup(function(){
	var pswInput = $('#password').val();
	var pswInput2 = $('#password2').val();
	
	if (pswInput2 == "") {
		pwd2Checked = false;
		lock();
		$('#pswmsg2')[0].innerHTML='請再次輸入密碼'
	}	
	
	if(pswInput2 != pswInput){
		pwd2Checked = false;
		lock();
		$('#pswmsg2')[0].innerHTML='密碼不一致'	
	}else{
		pwd2Checked = true;
		lock();
		$('#pswmsg2')[0].innerHTML=''
	}
});

function lock(){
	if(oldPwdCheck == true && pwd1Checked == true && pwd2Checked == true){
		$('#submit').attr("disabled", false);
	}else{
		$('#submit').attr("disabled", true);
	}
}

</script>
</body>
</html>