<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../../include/head.jsp"%>
<title>보전 신청 수정</title>
</head>
<body>
	<!-- 콘텐츠 시작 -->
	<div class="modal-content">
		<div class="login-box bg-white box-shadow border-radius-10">
			<button type="button" class="close" onclick="window.close();">×</button>
			<div class="pd-20">
				<!-- 타이틀 -->
				<div class="login-title">
					<h1 class="text-center text-primary">보전 신청 수정</h1>
				</div>
				<form method="post">
					<!-- 설비 목록 -->
					<div class="row">
						<div class="col-sm-12 mb-6">
							<div class="form-group">
								<label><b>설비 목록</b></label> <select class="custom-select2 form-control" name="fac_code" style="width: 100%; height: 38px">
									<option value="None">선택</option>
									<c:if test="${!empty fac_list}">
										<c:forEach items="${fac_list}" var="i">
											<option value="${i.code}">${i.name}(${i.model})</option>
										</c:forEach>
									</c:if>
								</select>
							</div>
						</div>
					</div>
					<!-- 설비 목록 -->

					<!-- 입력 구간 -->
					<div class="row">
						<div class="col">
							<!-- examples -->
							<div class="form-group">
								<label><b>사유</b></label> <input class="form-control" type="text" placeholder="Johnny Brown">
							</div>
							<input type="hidden" name="group_id" value="MT">
							<div class="form-group">
								<label><b>원인</b></label>
								<div class="custom-control custom-radio mb-5">
									<input type="radio" id="customRadio1" name="code_id" value="001" class="custom-control-input" checked> <label class="custom-control-label" for="customRadio1">초기 고장</label>
								</div>
								<div class="custom-control custom-radio mb-5">
									<input type="radio" id="customRadio2" name="code_id" value="002" class="custom-control-input"> <label class="custom-control-label" for="customRadio2">우발 고장</label>
								</div>
								<div class="custom-control custom-radio mb-5">
									<input type="radio" id="customRadio3" name="code_id" value="003" class="custom-control-input"> <label class="custom-control-label" for="customRadio3">마모 고장</label>
								</div>
							</div>
							<div class="form-group">
								<label><b>상세 내용</b></label>
								<textarea class="form-control" name="mt_content"></textarea>
							</div>
							<!-- examples end -->
						</div>
					</div>
					<!-- 입력 구간 -->

					<!-- 버튼 -->
					<div class="row">
						<div class="col-sm-12 mb-3 justify-content-center btn-toolbar btn-group">
							<button type="button" class="btn btn-secondary" onclick="window.close();">
								<b>취소</b>
							</button>
							<button type="submit" class="btn btn-success">
								<b>등록</b>
							</button>
						</div>
					</div>
					<!-- 버튼 -->
				</form>
			</div>
		</div>
		<!-- 콘텐츠 끝> -->
		<%@ include file="../../include/footer.jsp"%>
	</div>
</body>
</html>