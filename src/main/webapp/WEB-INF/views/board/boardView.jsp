<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>boardView</title>
</head>
<script>

	$j(document).ready(function() {
		var formObj = $j("form[name='readForm']");
		
		$j(".delete_btn").on("click", function() {
			formObj.attr("action", "/board/boardDelte.do");
			formObj.attr("method", "post");
			formObj.submit();
		})
	})
	
	
</script>

<body>

	<table align="center">
		<tr>
			<td>
				<table border="1">
					<tr>
						<td width="120" align="center">Title</td>
						<td width="400">${board.boardTitle}</td>
					</tr>
					<tr>
						<td height="300" align="center">Comment</td>
						<td>${board.boardComment}</td>
					</tr>
					<tr>
						<td align="center">Writer</td>
						<td></td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td align="right">
			<a href="/board/boardList.do">List</a>
			<a href = "/board/${board.boardType}/${board.boardNum}/updateView.do?pageNo=${pageNo}">update</a>
			</td>
			<form name="readForm" role="form" method="post">
				<input type="hidden" id="boardNum" name="boardNum"
					value="${board.boardNum}" />
			</form>
			<button type="submit" class="delete_btn">삭제</button>
			
		</tr>
	</table>
</body>
</html>