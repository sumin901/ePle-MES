<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../include/head.jsp"%>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<title>수주정보</title>
</head>
<body>
<!-- 콘텐츠 시작 -->
	<div class="modal-content">
		<div class="login-box bg-white box-shadow border-radius-10">
			<!-- 타이틀 -->
			<div class="login-title">
				<h1 class="text-center text-primary">수주 정보</h1>
			</div>
			<!-- 폼 -->
			<form action="" method="post" id="addForm">
				<!-- 비입력 구간 -->
				<!-- 입력 구간 -->
				<div class="row">
					<div class="col-sm-12 mb-3">
						<!-- 필수입력내역 -->
						<div class="form-group">
							<label>수주번호</label> 
							<input class="form-control" type="text"  name="code" id="code" readonly value="${vo.code }">
						</div>
						<div class="form-group">
							<label>업체코드</label> 
							<input class="form-control" type="text"  name="client_code" id="client_code" readonly value="${vo.client_code }">
						</div>
						<div class="form-group">
							<label>수주일자</label> 
							<input class="form-control date-picker" name="date" type="text" id="date-picker" readonly value="${vo.date }">
						</div>
						<div class="form-group">
							<label>납품일자</label> 
							<input class="form-control date-picker" name="deadline" type="text"  readonly value="${vo.deadline }">
						</div>
						<div class="form-group">
							<label>담당자코드</label> <input class="form-control" name="manager" type="text"  readonly value="${vo.manager }">
						</div>
						<div class="form-group">
							<label>품번</label> <input class="form-control" name="product" type="text" readonly value="${vo.product }">
						</div>
						<div class="form-group">
							<label>수주량</label> <input class="form-control" name="amount" type="text" readonly value="${vo.amount }">
						</div>
						<!-- 자동입력내역 -->
						<div class="form-group">
							<label>업체명</label> <input class="form-control" type="text" readonly value="${vo.clientName }">
						</div>
						<div class="form-group">
							<label>담당자명</label> <input class="form-control" type="text" readonly value="${vo.managerName}">
						</div>
						<div class="form-group">
							<label>품명</label> <input class="form-control" type="text" readonly value="${vo.productName }">
						</div>
						<div class="form-group">
							<label>단위</label> <input class="form-control" name ="unit" type="text" readonly value="${vo.unit }">
						</div>
						<div class="form-group">
							<label>재고량</label> <input class="form-control" name ="stock" type="text" readonly value="${vo.stock }">
						</div>
						<div class="form-group">
							<label>과부족량</label> <input class="form-control" type="text" readonly value="${vo.stock - vo.amount}">
						</div>
						<div class="form-group">
							<label>단가</label> <input class="form-control" name ="currency" type="text" readonly value="${vo.currency }">
						</div>
						<div class="form-group">
							<label>수주상태</label> <input class="form-control" name ="status" type="text" readonly value="${vo.status }" id="status">
						</div>


				<!-- 버튼 -->
				<div class="row">
					<div class="col-sm-12 mb-3 justify-content-center btn-toolbar btn-group">
						<button type="button" class="btn btn-secondary" onclick="window.close();">
							<b>취소</b>
						</button>
						<input type="button" class="btn btn-success" value="수정" id="update">
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
	<script type="text/javascript">
	var popupWidth, popupHeight, popupX, popupY, link;
	var set;

	function retPopupSetting(width, height){
		// 만들 팝업창 width 크기의 1/2 만큼 보정값으로 빼주기
		popupX = Math.ceil((window.screen.width - width) / 2);
		// 만들 팝업창 height 크기의 1/2 만큼 보정값으로 빼주기
		popupY = Math.ceil((window.screen.height - height) / 2);

		var setting = "";
		setting += "toolbar=0,";
		setting += "scrollbars=0,";
		setting += "statusbar=0,";
		setting += "menubar=0,";
		setting += "resizeable=0,";
		setting += "width=" + width + ",";
		setting += "height=" + height + ",";
		setting += "top=" + popupY + ",";
		setting += "left=" + popupX;
		return setting;
	}

	function openPage(i, width, height) {
		set = retPopupSetting(width, height);
		return window.open(i, 'Popup_Window', set); // 가운데거가 이름이 똑같으면 같은창에서 열림
	}

	$(document).ready(function() {
		
		var codes = document.getElementById("code").value;
		const status = document.getElementById("status").value;
		console.log(codes);
		console.log(status);
		// 추가
		$("#update").click(function() {
			if(status == "등록"){
			// 가로, 세로 설정
			openPage("/request/update?code="+codes, 400, 700);
			}else{
				alert('수정불가능합니다');
			}
		});
		
		
		
		
		
		
	});
	
	</script>
	<%@ include file="../include/footer.jsp"%>
</body>
</html>