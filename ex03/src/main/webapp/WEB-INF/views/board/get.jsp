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
				<button data-oper='modify' class="btn btn-default" > 수정</button>
				<button data-oper='list' class="btn btn-info" >목록</button>
				<form id="operForm" action="/board/modify" method="get">
					<input type="hidden" id="bno" name="bno" value='<c:out value="${board.bno}"/> '>
					<input type="hidden" name="pageNum" value="<c:out value="${cri.pageNum}"/>" >
					<input type="hidden" name="amount" value="<c:out value="${cri.amount}"/>" >
				</form>
			</div>
		</div>
	</div>
</div>

<div class="row">
	<div class="col-lg-12">
		<!-- /.panel -->
		<div class="panel panel-default">
			<div class="panel-heading">
				<i class="fa fa-comments fa-fw"></i> Reply
				<button id="addReplyBtn" class="btn btn-primary btn-xs pull-right">댓글 작성</button>
			</div>
			<!-- <div class="panel-heading">
				<i class="fa fa-comments fa-fw"></i> Reply
			</div> -->
		</div>
		
		<!-- /.panel-heading -->
		<div class="panel-body">
			<ul class="chat">
				<!-- start reply -->
				<li class="left clearfix" data-rno='12'>
					<div>
						<div class="header">
							<strong class="primary-font">user00</strong>
							<small class="pull-right text-muted">2021-0101 18:18</samll>
						</div>
						<p>Good job!</p>
					</div>
				</li>
				<!-- end reply -->
			</ul>
				<!-- ./ end ul -->
		</div>
		<!-- end /. panel .chat-panel -->
	</div>
	<!-- ./ end row -->
</div>

<%@ include file="../includes/footer.jsp" %>

<script type="text/javascript" src="/resources/js/reply.js"></script>

<script>
	
	$(document).ready(function () {
		var bnoValue = '<c:out value="${board.bno}"/>';
		var replyUL = $(".chat");
		
		showList(1);
		
		function showList(page) {
			replyService.getList({bno:bnoValue, page: page|| 1}, function (list) {
				var str = "";
				
				if(list == null || list.length == 0) {
					replyUL.html("");
					return;
				}
				
				for(var i = 0, len = list.length || 0; i < len; i++) {
					str += "<li class='left clearfix' data-rno='"+list[i].rno+"'>";
					str += "<div><div class='header'><strong class='primary-font'>" + list[i].replyer + "</strong>";
					str += "<small class='pull-right text-muted'>" + replyService.displayTime(list[i].replyDate) + "</small></div>";
					str += "<p>" + list[i].reply + "</p></div></li>";
				}
				
				replyUL.html(str);
			});
		}
		
	});
	
	/*
	console.log("===============");
	console.log("JS TEST");
	
	var bnoValue = '<c:out value="${board.bno}"/>';
	
	replyService.get(10, function(data) {
		console.log(data);
	});
	*/
	
	/*
	replyService.update({
		rno : 22,
		bno : bnoValue,
		reply : "Modified Reply..."
	}, function(result) {
		alert("success modified");
	});
	*/
	
	/*
	replyService.remove(23, function(count) {
		console.log(count);
		if(count === "success") {
			alert("REMOVED");
		}
	}, function(err) {
		alert('ERROR...');
	});
	*/
	
	/*
	replyService.getList({bno:bnoValue, page:1}, function(list) {
		for(var i = 0, len = list.length||0; i < len; i++) {
			console.log(list[i]);
		}
	});
	*/
	
	/* 
	replyService.add(
			{reply:"JS Test", replyer:"tester", bno:bnoValue},
			function(result) {
				alert("RESULT : " + result);
			}
	);
	 */
</script>

<script type="text/javascript">
	$(document).ready(function () {
		var operForm = $("#operForm");
		
		$("button[data-oper='modify']").on("click", function (e) {
			operForm.attr("action", "/board/modify").submit();
		});
		
		$("button[data-oper='list']").on("click", function (e) {
			operForm.find("#bno").remove();
			operForm.attr("action", "/board/list");
			operForm.submit();
		});
	});
</script>














