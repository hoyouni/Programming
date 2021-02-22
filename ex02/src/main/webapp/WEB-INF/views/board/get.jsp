<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>		
<%@ include file="../includes/header.jsp" %>
<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">게시물 조회</h1>
	</div>
</div>

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">게시물 조회</div>
			<div class="panel-body">
				<div class="form-group">
					<label>글 번호</label>
					<input class="form-control" name="bno" value='<c:out value="${board.bno}"/>' readonly="readonly"/>
				</div>			
				<div class="form-group">
					<label>글 제목</label>
					<input class="form-control" name="title"  value='<c:out value="${board.title}"/>' readonly="readonly"/>
				</div>
				<div class="form-group">
					<label>내용</label>
					<textarea class="form-control" name="content" rows="3" readonly="readonly"><c:out value="${board.content}"></c:out> </textarea>
				</div>
				<div class="form-group">
					<label>작성자</label>
					<input class="form-control" name="writer"  value='<c:out value="${board.writer}"/>' readonly="readonly"/>
				</div>
				<button data-oper='modify' class="btn btn-default" onclick="location.href='/board/modify?bno=<c:out value="${board.bno}"/>'"> 글 수정</button>
				<button data-oper='list' class="btn btn-info" onclick="location.href='/board/list'">목록으로 이동하기</button>
					
			</div>
		</div>
	</div>
</div>
<%@ include file="../includes/footer.jsp" %>