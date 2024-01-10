<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<title>출하 등록</title>
</head>
<body>
	<!-- 콘텐츠 시작 -->
	<div class="modal-content">
		<div class="login-box bg-white box-shadow border-radius-10">
			<!-- 타이틀 -->
			<div class="login-title">
				<h1 class="text-center text-primary">출하명령 등록</h1>
			</div>
			<!-- 폼 -->
			<form action="" method="post" id="addForm" >
				<!-- 비입력 구간 -->
				<input class="form-control" type="hidden" placeholder="출하번호" name="code" id="code" >
				<!-- 입력 구간 -->
				<div class="row">
					<div class="col-sm-12 mb-3">
						<!-- 필수입력내역 -->
						<div class="form-group">
							<label for="client_code">수주번호</label> 
							<input class="form-control" type="text" placeholder="클릭 시 팝업검색창이 뜹니다" 
							name="reqs_code" id="reqs_code" readonly required="required">
						</div>
						<div class="form-group">
							<label for="date">출하일자</label> 
							<input class="form-control date-picker" name="date" type="text" id="date"
							placeholder="클릭 시 달력이 뜹니다" autocomplete="off" required="required">
						</div>
						<div class="form-group">
							<label for="amount">출하량</label> <input class="form-control" name="amount" id="amount"
							type="number" placeholder="출하량을 입력해주세요" autocomplete="off" min="1" required="required">
						</div>
						<!-- 자동입력내역 -->
						<div class="form-group">
							<label >수주량</label> 
							<input class="form-control" name="reqsamount" id="reqsamount"
							type="number" autocomplete="off" min="1" required="required" readonly>
						</div>
						<div class="form-group">
							<label >수주일자</label> 
							<input class="form-control " name="reqsdate" type="text" id="reqsdate"
							 autocomplete="off" required="required" readonly>
						</div>
						<div class="form-group">
							<label>업체명</label> 
							<input class="form-control" type="text" readonly id="clientName" required="required"
							readonly>
						</div>
						<div class="form-group">
							<label>품번</label> 
							<input class="form-control" name = "product" type="text" readonly id="product" required="required">
						</div>
						<div class="form-group">
							<label>단위</label> 
							<input class="form-control" name ="unit" type="text" readonly id="unit" required="required">
						</div>
						<div class="form-group">
							<label>재고량</label> 
							<input class="form-control" name ="stock" type="text" readonly id="stock" required="required">
							<input class="form-control" name ="ware_code" type="hidden" readonly id="ware_code" required="required">
							<input class="form-control" name ="stock_code" type="hidden" readonly id="stock_code" required="required">
							<input class="form-control" name ="wareHistory_code" type="hidden" readonly id="wareHistory_code" required="required">
						</div>


				<!-- 버튼 -->
				<div class="row">
					<div class="col-sm-12 mb-3 justify-content-center btn-toolbar btn-group">
						<button type="button" class="btn btn-secondary" onclick="window.close();">
							<b>취소</b>
						</button>
						<input type="submit" class="btn btn-success" value="등록" id="sa-custom-position">
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

	 <script type="text/javascript" class="formDataSetting">  

	 // 출하일자 min / 출하량 max 설정
	 document.getElementById('reqsdate').addEventListener('input', function() {
  		document.getElementById('date').min = document.getElementById('reqsdate').value;
  		document.getElementById('amount').max = document.getElementById('reqsamount').value;
	});
	 
	// 출하량 입력 필드 선택
	 var amountInput = document.getElementById('amount');

	 // 'keyup' 이벤트 리스너 추가
	 amountInput.addEventListener('keyup', function() {
	   // 수주량과 출하량 가져오기
	   var reqsAmount = Number(document.getElementById('reqsamount').value);
	   var amount = Number(this.value);

	   // 출하량이 수주량을 초과하는지 확인
	   if (amount > reqsAmount) {
	     // 메시지 표시(이거 alert 말고 append로 바꾸기)
	     alert('출하량이 수주량을 초과하였습니다.');
	   }
	 });
	 
 
	 // 출하번호 생성 당해연도 YY+OT(Out)+MMDD+출고창고코드+출하인덱스 3자리(001부터)
	 // 24OT0101a23001
	 let ware_code;
	 
	 document.querySelector('input[name="ware_code"]').addEventListener('input', function() {
		 ware_code = this.value; 
		});
	 
	 function createOrderNum() {
			const date = new Date();
			const year = date.getFullYear().toString().slice(-2); //올해연도 끝 2자리
			const month = String(date.getMonth() + 1).padStart(2, "0"); //이번달
			const day = String(date.getDate()).padStart(2, "0"); //오늘날짜 
			
			const orderNum = year+"OT"+month+day+ware_code; 
			return orderNum;
		}
	 
	 function createHistoryNum(){
		 const date = new Date();
			const year = date.getFullYear().toString(); //올해연도 끝 2자리
			const month = String(date.getMonth() + 1).padStart(2, "0"); //이번달
			const day = String(date.getDate()).padStart(2, "0"); //오늘날짜 
			
			const historyNum = "OT"+year+month+day;
			return historyNum;
	 }
	 
	 
	 
	 
	 document.querySelector('form').addEventListener('submit', function(event) {
		    // 기본 제출 이벤트를 막음
		    event.preventDefault();
		    
		    // 출하번호 생성
		    const orderNum = createOrderNum();
		    const historyNum = createHistoryNum();
		    
		    // 생성된 출하번호를 name="code"인 요소의 값으로 설정
		    document.querySelector('input[name="code"]').value = orderNum;
		    document.querySelector('input[name="wareHistory_code"]').value = historyNum;
		 
		    // 폼 제출
		    this.submit();
		});
	 </script>
	
	<!-- 팝업 -->
	<script type="text/javascript">
	$(document).ready(function(){
	
	// 수주번호 찾기	
		$("#reqs_code").click(function() {
	// 가로, 세로 설정
			window.open("/shipment/searchRequest", "Request Search", "width=500,height=600");
		});
	
	
	});//끝
	
	
	</script>

</body>
</html>