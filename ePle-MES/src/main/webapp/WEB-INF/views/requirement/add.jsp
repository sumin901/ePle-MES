<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../include/head.jsp"%>
<title>소요량 등록</title>
</head>
<body>
    <!-- 콘텐츠 시작 -->
    <div class="modal-content">
        <div class="login-box bg-white box-shadow border-radius-10">
            <!-- 타이틀 -->
            <div class="login-title">
                <h1 class="text-center text-primary">소요량 등록</h1>
            </div>
            <!-- 폼 -->
            <form action="/requirement/add" method="post">

                <!-- 입력 구간 -->
                <div class="row">
                    <div class="col-sm-12 mb-3">
                        <!-- examples -->
                        <div class="form-group">
                            <label>완제품 품번</label> 
                            <input class="form-control" type="text" name="mapd_code" id="mapd_code"
                             placeholder="완제품 품번 입력" required readonly>
                        </div>
                        <div class="form-group">
                            <label>완제품 품명</label> 
                            <input class="form-control" type="text" id="mapdName" name="mapdName"
                             placeholder="완제품 품명 입력" required readonly>
                        </div>
                        <div class="form-group">
                            <label>재료 품번</label> 
                            <input class="form-control" type="text" id="material"
                            name="material" placeholder="재료 품번 입력" required readonly>
                        </div>
                        <div class="form-group">
                            <label>메모</label> 
                            <input class="form-control" type="text" id="content"
                            name="content" placeholder="재료 품번 입력" required >
                        </div>
                        <div class="form-group">
                            <label>소요량</label> 
                            <input class="form-control" type="number" 
                            name="requirement" placeholder="소요량 입력" required>
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
			<!-- 폼 -->
		</div>
	</div>
	<!-- 콘텐츠 끝> -->

	<%@ include file="../include/footer.jsp"%>
	<script type="text/javascript">
		// 추가
		$("#mapd_code").click(function() {
			window.open("/requirement/searchMAPD","search","width=500,height=600");
		});
		$("#material").click(function() {
			window.open("/requirement/searchMaterial","search","width=500,height=600");
		});

	</script>
</body>
</html>