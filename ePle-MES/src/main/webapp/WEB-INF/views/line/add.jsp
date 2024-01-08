<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../include/head.jsp"%>
<title>라인 등록</title>
</head>
<body>
    <!-- 콘텐츠 시작 -->
    <div class="modal-content">
        <div class="login-box bg-white box-shadow border-radius-10">
            <!-- 타이틀 -->
            <div class="login-title">
                <h1 class="text-center text-primary">라인 등록</h1>
            </div>
            <!-- 폼 -->
            <form action="/line/add" method="post">

                <!-- 입력 구간 -->
                <div class="row">
                    <div class="col-sm-12 mb-3">
                        <!-- examples -->
                        <div class="form-group">
                            <label>라인 코드</label> <input class="form-control" type="text" name="code">
                        </div>
                        <div class="form-group">
                            <label>라인명</label> <input class="form-control" type="text" name="name">
                        </div>
                        <div class="form-group">
                            <label>공정</label> <input class="form-control" type="text" name="process">
                        </div>
                        <div class="form-group">
						    <label>작업장</label>
						    <select class="form-control" name="place">
						        <option value="" disabled selected>선택</option>
						        <option value="firstPlace">1작업장</option>
						        <option value="SecondPlace">2작업장</option>
						        <option value="thirdPlace">3작업장</option>
						        <option value="fourthPlace">4작업장</option>
						    </select>
						</div>
						<div class="form-group">
						    <label>설비상태</label>
						    <select class="form-control" name="status">
						        <option value="" disabled selected>설비상태 선택</option>
						        <option value="true">Y</option>
						        <option value="false">N</option>
						    </select>
						</div>
                        <div class="form-group">
                            <label>비고</label> <input class="form-control" type="text" name="note">
                        </div>
					</div>
                    <div class="form-group">
						    <label>사용여부</label>
						    <select class="form-control" name="active" required>
						        <option value="" disabled selected>사용여부 선택</option>
						        <option value="true">Y</option>
						        <option value="false">N</option>
						    </select>
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
    <!-- 콘텐츠 끝 -->
    
    <%@ include file="../include/footer.jsp"%>
</body>
</html>
