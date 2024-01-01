<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../include/head.jsp"%>
<title>품목 등록</title>
</head>
<body>
    <!-- 콘텐츠 시작 -->
    <div class="modal-content">
        <div class="login-box bg-white box-shadow border-radius-10">
            <!-- 타이틀 -->
            <div class="login-title">
                <h1 class="text-center text-primary">품목 등록</h1>
            </div>
            <!-- 폼 -->
            <form action="/product/add" method="post">

                <!-- 입력 구간 -->
                <div class="row">
                    <div class="col-sm-12 mb-3">
                        <!-- examples -->
                        <div class="form-group">
                            <label>품번</label> <input class="form-control" type="text" name="code">
                        </div>
                        <div class="form-group">
                            <label>품목명</label> <input class="form-control" type="text" name="name">
                        </div>
                        <div class="form-group">
                            <label>규격</label> <input class="form-control" type="text" name="size">
                        </div>
                        <div class="form-group">
                            <label>단위</label> <input class="form-control" type="number" name="unit">
                        </div>
                        <div class="form-group">
                            <label>입고 단가</label> <input class="form-control" type="text" name="inprice">
                        </div>
                        
                        <div class="form-group">
                            <label>이미지</label> <input type="file" class="form-control-file form-control height-auto" name="image">
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
                        <button type="submit" class="btn btn-success" onclick="notifyParent();">
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
    <script type="text/javascript">
        // Function to notify the parent window about the success
        function notifyParent() {
            // Check if the parent window exists
            if (window.opener) {
                // Notify the parent window about the success
                window.opener.showSuccessAlert();
                // Close the popup window
                window.close();
            }
        }
    </script>
    <%@ include file="../include/footer.jsp"%>
</body>
</html>
