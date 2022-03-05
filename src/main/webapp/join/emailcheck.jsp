<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이메일 중복체크</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.container{
  margin-top: 50px;
}
.row {
   margin: 0px auto;
   width:380px;
}
h1{
    text-align: center;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<!-- 
     Shadow는 서버를 거쳐서 데이터 읽고 실행 => 종료 
 -->
<script type="text/javascript">
$(function(){
	$('#emailBtn').click(function(){
		// id읽기
		let u_email=$('#check_email').val();
		if(u_email.trim()=="")
		{
			$('#check_email').focus();
			return;
		}
		// 서버로 요청 => 결과값을 읽기 
		$.ajax({
			type:'POST',
			url:'../join/emailcheck_result.do',// 요청
			data:{"u_email":u_email},
			success:function(result) //결과값 받기
			{
				let count=result.trim();//0,1
				if(count==0)
				{
					$('#print').html('<font color=blue>'+u_email+"는(은) 사용가능합니다</font>")
					$('#ok').show();
				}
				else
				{
					$('#print').html('<font color=red>'+u_email+"는(은) 사용중입니다</font>")
				}
				
			}
		})
	})
	$('#okBtn').click(function(){
		parent.join_frm.u_email.value=$('#check_email').val()
		parent.Shadowbox.close()
	})
})
</script>
</head>
<body>
  <div class="container">
   <div class="row">
    <table class="table">
     <tr>
       <td class="text-center">
       Email:<input type=text name=u_email id="check_email" class="input-sm" size=25>
       <input type=button value="이메일체크" class="btn btn-sm btn-danger"
         id="emailBtn"> 
       </td>
     </tr>
     <tr>
       <td class="text-center" id="print"></td>
     </tr>
     <tr id="ok" style="display:none">
       <td class="text-center">
        <input type=button value="확인" id="okBtn"
          class="btn btn-sm btn-success">
       </td>
     </tr>
    </table>
   </div>
  </div>
</body>
</html>






