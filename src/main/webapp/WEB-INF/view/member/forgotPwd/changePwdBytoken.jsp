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
<link href="${contextRoot}/css/bootstrap.min.css" rel="stylesheet" >
<title>修改密碼</title>
<script>window.verifyCallback = verifyCallback;</script>
</head>
<body>

<c:if test="${error} != null">
alert(${error});
</c:if>

<form class="form" method="post" action="${contextRoot}/changePwdByToken" onsubmit="return(checkRobot())">
<div class="container mt-5">
<h2 class="form-row justify-content-center">修改密碼</h2>

<div class="form-row justify-content-center mt-2">
	
    
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

<div class="form-row justify-content-center mt-4">
<button class="btn btn-outline-success col-md-3 mt-4" type="button" id="input">一鍵輸入</button>
<button type="submit" class="btn btn-outline-primary col-md-3 mt-4" id="submit">送出</button></div>
</div>
</form>


<script src="${contextRoot}/js/jquery-3.6.0.js"></script>
<script src="${contextRoot}/js/bootstrap.bundle.min.js"></script>
<script src="https://www.google.com/recaptcha/api.js" async defer></script>
<script type="text/javascript">

$('#input').click(function(){
	$('#password').val('a12345');
	$('#password2').val('a12345');
})

$('#password').keyup(function(){
	var pswInput = $('#password').val();
// 	var pattern = new RegExp("^[0~9a-zA-Z!@#$%^&*]+$");
	var pattern = new RegExp("^[A-Za-z0-9]+$");
		
	if (pswInput == "") {
		$('#submit').attr("disabled", true);
		$('#pswmsg')[0].innerHTML='請輸入密碼'
	}		
	if (pswInput.length >= 6) {
		if (pattern.test(pswInput)) {
			$('#submit').attr("disabled", false);
			$('#pswmsg')[0].innerHTML=''
		} else {
			$('#submit').attr("disabled", true);
			$('#pswmsg')[0].innerHTML='本欄位只接受數字及英文字母'
		}
	} else {
		$('#submit').attr("disabled", true);
		$('#pswmsg')[0].innerHTML='請輸入至少六位數之密碼'
	}
});

$('#password').keyup(function(){
	var pswInput = $('#password').val();
	var pswInput2 = $('#password2').val();
	var pattern = new RegExp("^[A-Za-z0-9]+$");
	
	if (pswInput2 == "") {
		$('#submit').attr("disabled", true);
		$('#pswmsg2')[0].innerHTML='請再次輸入密碼'
	}	
	
	if(pswInput2 != pswInput){
		$('#submit').attr("disabled", true);
		$('#pswmsg2')[0].innerHTML='密碼不一致'	
	}else{
		pswChecked = true;
		$('#submit').attr("disabled", false);
		$('#pswmsg2')[0].innerHTML=''
	}
});

$('#password2').keyup(function(){
	var pswInput = $('#password').val();
	var pswInput2 = $('#password2').val();
	var pattern = new RegExp("^[A-Za-z0-9]+$");
	
	if (pswInput2 == "") {
		$('#submit').attr("disabled", true);
		$('#pswmsg2')[0].innerHTML='請再次輸入密碼'
	}	
	
	if(pswInput2 != pswInput){
		$('#submit').attr("disabled", true);
		$('#pswmsg2')[0].innerHTML='密碼不一致'	
	}else{
		pswChecked = true;
		$('#submit').attr("disabled", false);
		$('#pswmsg2')[0].innerHTML=''
	}
});

</script>
</body>
</html>