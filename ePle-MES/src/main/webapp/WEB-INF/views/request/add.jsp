<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../include/head.jsp"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<title>수주 등록</title>
</head>
<body>
	<!-- 콘텐츠 시작 -->
	<div class="modal-content">
		<div class="login-box bg-white box-shadow border-radius-10">
			<!-- 타이틀 -->
			<div class="login-title">
				<h1 class="text-center text-primary">수주 등록</h1>
			</div>
			<!-- 폼 -->
			<form action="" method="post" id="addForm">
				<!-- 비입력 구간 -->
				<input class="form-control" type="hidden" placeholder="수주번호" name="code" id="code" value="" >
				<!-- 입력 구간 -->
				<div class="row">
					<div class="col-sm-12 mb-3">
						<!-- 필수입력내역 -->
						<div class="form-group">
							<label>업체코드</label> 
							<input class="form-control" type="text" placeholder="클릭 시 팝업검색창이 뜹니다" name="client_code" id="client_code" readonly>
						</div>
						<div class="form-group">
							<label>수주일자</label> 
							<input class="form-control date-picker" name="date" type="text" placeholder="클릭 시 달력이 뜹니다" id="date-picker" autocomplete="off">
						</div>
						<div class="form-group">
							<label>납품일자</label> 
							<input class="form-control date-picker" name="deadline" type="text" placeholder="클릭 시 달력이 뜹니다" autocomplete="off">
						</div>
						<div class="form-group">
							<label>담당자코드</label> <input class="form-control" id="manager" name="manager" type="text" placeholder="클릭 시 팝업검색창이 뜹니다" readonly>
						</div>
						<div class="form-group">
							<label>품번</label> <input class="form-control" name="product" id="product" type="text" placeholder="클릭 시 팝업검색창이 뜹니다" readonly>
						</div>
						<div class="form-group">
							<label>수주량</label> <input class="form-control" name="amount" type="number" placeholder="필수입력" autocomplete="off" min="1">
						</div>
						<!-- 자동입력내역 -->
						<div class="form-group">
							<label>업체명</label> <input class="form-control" type="text" readonly id="clientName">
						</div>
						<div class="form-group">
							<label>담당자명</label> <input class="form-control" type="text" readonly id="managerName">
						</div>
						<div class="form-group">
							<label>품명</label> <input class="form-control" type="text" readonly id="productName">
						</div>
						<div class="form-group">
							<label>단위</label> <input class="form-control" name ="unit" type="text" readonly id="unit">
						</div>
						<div class="form-group">
							<label>재고량</label> <input class="form-control" name ="stock" type="text" readonly id="stock">
						</div>
						<div class="form-group">
							<label>과부족량</label> <input class="form-control" type="text" readonly value="" id="gwa">
						</div>
						<div class="form-group">
							<label>단가</label> <input class="form-control" name ="currency" type="text" readonly id="currency">
						</div>


				<!-- 버튼 -->
				<div class="row">
					<div class="col-sm-12 mb-3 justify-content-center btn-toolbar btn-group">
						<button type="button" class="btn btn-secondary" onclick="window.close();">
							<b>취소</b>
						</button>
						<input type="button" class="btn btn-success" value="등록" onclick="finished()">
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
	
	 <script type="text/javascript" class="id">  

	 
	 // 과부족량 계산
	 document.querySelector('input[name="amount"]').addEventListener('input', calculateDifference);
	 document.querySelector('input[name="stock"]').addEventListener('input', calculateDifference);

	 function calculateDifference() {
	     var amount = document.querySelector('input[name="amount"]').value;
	     var stock = document.querySelector('input[name="stock"]').value;
	     var difference = stock - amount;
	     var gwaField = document.querySelector('#gwa');

	     if (!isNaN(difference)) {
	    	 if(difference > 0){
	        	 document.querySelector('#gwa').value = "+"+difference;
	       	 	 gwaField.style.color = 'green'; // 폰트색 초록으로 변경
	       	 	 return;
	    	 }
	    	 if(difference <0 ){
	    		 gwaField.value = difference; 
	             gwaField.style.color = 'red'; // 폰트색 빨강으로 변경
	    		 return;
	    	 }
	    	 document.querySelector('#gwa').value = difference;
	     }
	 }
	 
	 // 수주번호 생성
	 let client;
	 let product;
	 let amount;
	 
	 document.querySelector('input[name="client_code"]').addEventListener('input', function() {
		 client = this.value; 
		});
	 document.querySelector('input[name="product"]').addEventListener('input', function() {
		 product = this.value; 
		});
	 document.querySelector('input[name="amount"]').addEventListener('input', function() {
		 amount = this.value; 
		});
	 
	 function createOrderNum() {
			const date = new Date();
			const year = date.getFullYear().toString().slice(-2); //올해연도 끝 2자리
			const month = String(date.getMonth() + 1).padStart(2, "0"); //이번달
			const day = String(date.getDate()).padStart(2, "0"); //오늘날짜 
			
			console.log(client);
			console.log(product);
			const orderNum = year+"OD"+client+month+day+product+amount;
			return orderNum;
		}
	 
	 function checkForm(){
		 // 널값이 안들어가게. 그리고 미입력칸으로 focus
	 }
	 
	 
// 	 // Submit ajax
	 function finished(){
		 
			document.querySelector('#code').value = createOrderNum();
			
			if(document.querySelector('#code').value == null){
				
			}
			
			var formdata = $("#addForm").serialize();
			if(formdata)
			
		 $.ajax({
			    url: '/request/add',
			    type: 'POST',
			    data:  formdata,
			    success: function(data) {
			    	alert('성공?');
// 			    	self.close(); 
			    	}, // function(data) 끝
		        error: function(data){
		        	alert('실패');
		        }     
			    
			});
		 
	 }
	 
	 
	$(document).ready(function(){
		
	// 업체찾기	
		$("#client_code").click(function() {
	// 가로, 세로 설정
			window.open("/request/searchClient", "Client Search", "width=500,height=600");
		});

	
	//담당자 찾기
		$("#manager").click(function() {
	// 가로, 세로 설정
			window.open("/request/searchManager", "Manager Search", "width=500,height=600");
		});
	
	// 물품정보찾기
		$("#product").click(function() {
	// 가로, 세로 설정s
			window.open("/request/searchProduct", "Product Search", "width=500,height=600");
		});
	
	
	
	});//끝
	
	
	</script> 
</body>
</html>