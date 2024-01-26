<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../include/head.jsp"%>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<link
         href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
         rel="stylesheet"
         integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
         crossorigin="anonymous"
      />
<title>출하 수정</title>
</head>
<body>
	<!-- 콘텐츠 시작 -->
	<div class="modal-content">
		<div class="login-box bg-white box-shadow border-radius-10">
			<!-- 타이틀 -->
			<div class="login-title">
				<h1 class="text-center text-primary">출하명령 수정</h1>
			</div>
			<!-- 폼 -->
			<form action="/shipment/update" method="post" id="addForm">
				<!-- 입력 구간 -->
				<div class="row">
					<div class="col-sm-12 mb-3">
						<div class="form-group">
							<label for="client_code">출하번호</label> 
							<input class="form-control" type="text"  
							name="code" id="code" readonly required="required" value="${List.code }">
						</div>
						<div class="form-group">
							<label for="client_code">수주번호</label> 
							<input class="form-control" type="text"  
							name="reqs_code" id="reqs_code" readonly required="required" value="${List.reqs_code}">
						</div>
						<div class="form-group">
							<label>업체명</label> 
							<input class="form-control" type="text" readonly id="clientName" required="required"
							readonly value="${List.clientName }">
						</div>
						<div class="form-group">
							<label for="date">수주일자</label> 
							<input class="form-control " name="reqsdate" type="text" id="reqsdate"
							 autocomplete="off" required="required" readonly value="${List.reqsdate }">
						</div>
						<div class="form-group">
							<label for="date">납품예정일</label> 
							<input class="form-control " name="reqsdate" type="text" id="reqsdate"
							 autocomplete="off" required="required" readonly value="${List.deadlineDate}">
						</div>
						<div class="form-group">
							<label for="deadline">출하일자</label> 
							<input class="form-control date-picker" name="date" type="text" id="date"
							autocomplete="off" required="required"  value="${List.date }">
						</div>
						<div class="form-group">
							<label>품번</label> 
							<input class="form-control" type="text" readonly id="product" required="required"
							value="${List.product}" >
						</div>
						<div class="form-group">
							<label for="amount">수주량</label> 
							<input class="form-control" name="reqsamount" id="reqsamount"
							type="number" autocomplete="off" min="1" required="required" readonly value="${List.amount }">
						</div>
						<div class="form-group">
							<label>재고량</label> 
							<input class="form-control" name ="stock" type="text" readonly id="stock" 
							required="required" value="${List.stock }">
						</div>
						<div class="form-group">
							<label>단위</label> 
							<input class="form-control" name ="unit" type="text" readonly id="unit" 
							required="required" value="${List.unit }">
						</div>
						<div class="form-group">
							<label for="amount">출하량</label> 
							<input class="form-control" name="amount" id="amount"
							type="number" readonly autocomplete="off" min="1" required="required" value="${List.amount }">
						</div>
						<div class="form-group">
							<label>창고코드</label> 
							<input class="form-control" name ="ware_code" type="text" readonly id="ware_code" 
							required="required" value="${List.ware_code }" readonly>
						</div>
						<!-- 자동입력내역 -->
						<div class="form-group">
							<label for="status">수주상태</label>
								<select name="status" id="status" class="custom-select col-12"  required="required">
									<option value="출하대기" <c:if test="${List.status eq '출하대기'}">selected</c:if>>출하대기</option>
									<option value="출하완료" <c:if test="${List.status eq '출하완료'}">selected</c:if>>출하완료</option>		
								</select>
						</div>
						<input type="hidden" name="reg_date" value="${List.reg_date }">
						<input type="hidden" name="reg_emp" value="${List.reg_emp }">


				<div class="row">
					<div class="col-sm-12 mb-3 justify-content-center btn-toolbar btn-group">
						<button type="button" class="btn btn-secondary" onclick="window.close();">
							<b>취소</b>
						</button>
						<input type="submit" class="btn btn-success" value="등록" >
					</div>
				</div>
					</div>
				</div>
				<!-- 버튼 -->
			</form>
			<!-- 폼 -->
		</div>
	</div>
	<!-- 콘텐츠 끝> -->
	<%@ include file="../include/footer.jsp"%>
	

	 <script type="text/javascript">
	$(document).ready(function(){
	
		$("#reqs_code").click(function() {
			window.open("/shipment/searchRequest", "Request Search", "width=500,height=600");
		});
	
	});
	
	</script> 
</body>
</html>