<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="../Main_css/cardadd.css">

</head>

<script type="text/javascript">

function check() {
	
	if(!form.card_name.value) {
		alert("카드 이름을 입력해주세요.");
		document.form.card_name.focus();
		return false;
	}
	if(form.card_name.value.length < 2) {
		alert("카드이름[최소 2글자] 입니다.");
		document.form.card_name.focus();
		return false;
	}
	if(!form.card_company.value) {
		alert("카드사를 선택해주세요.");
		document.form.card_company.focus();
		return false;
	}
	if(!form.membership_fee.value) {
		alert("연회비를 입력해주세요.");
		document.form.membership_fee.focus();
		return false;
	}
	if(isNaN(form.membership_fee.value)) {
		alert("연회비는 숫자로만 입력해주세요.");
		document.form.membership_fee.value = "";
		document.form.membership_fee.focus();
		return false;
	}
	if(form.membership_fee.value < 0) {
		alert("연회비는 양수로만 입력가능합니다.");
		document.form.membership_fee.value = "";
		document.form.membership_fee.focus();
		return false;
	}
	if(!form.images.value) {
		alert("카드 이미지는 필수입니다.");
		document.form.images.focus();
		return false;
	}
	if(!form.bank_link.value) {
		alert("카드사 링크를 입력해주세요.\n정확하게 입력 바랍니다.");
		document.form.bank_link.focus();
		return false;
	}else {
		return true;
	}
	
}

</script>

<body>

<%@include file="../Main_jsp/header.jsp" %>

<div id="table">


	<h3>카드 등록</h3>
	
	<form name="form" method="post" enctype="multipart/form-data" action="cardaddcontroller.jsp">
	
		<table id="table_1">
		<%@include file="admin.jsp" %>
			<tr>
				<th>카드이름</th>
				<td>
					<input type="text" name="card_name" size="30">
				</td>
			</tr>
			
			<tr>
				<th>카드사</th>
				<td>
					<select name="card_company" style="width: 150px;">
						<option value="">선택해주세요</option>
						<option value="국민카드">국민카드</option>
						<option value="롯데카드">롯데카드</option>
						<option value="신한카드">신한카드</option>
						<option value="삼성카드">삼성카드</option>
						<option value="우리카드">우리카드</option>
						<option value="NH농협카드">농협카드</option>
						<option value="하나카드">하나카드</option>
						<option value="씨티카드">씨티카드</option>
						<option value="IBK기업카드">기업카드</option>
						<option value="현대카드">현대카드</option>
						<option value="우체국">우체국</option>
					</select>
				</td>
			</tr>
			
			<tr>
				<th>연회비</th>
				<td>
					<input type="text" name="membership_fee" size="30">
				</td>
			</tr>
			
			<tr>
				<th>이미지</th>
				<td>
					<input type="file" name="images" size="30">
				</td>
			</tr>
			
			<tr>
				<th>발급사링크</th>
				<td>
					<input type="text" name="bank_link">
				</td>
			</tr>
	
			
		</table>
		
		<table id="table_2">
			
			<tr>
				<td>
					<input type="button" value="취소" onclick="history.back()">
					<input type="submit" value="완료" onclick="return check()">
				</td>
			</tr>
			
		</table>
		
	</form>
</div>

<%@include file="../Main_jsp/footer.jsp" %>

</body>
</html>