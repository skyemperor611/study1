<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>boardWrite</title>
</head>
<script type="text/javascript">
	$j(document).ready(function() {

		$j("#submit").on("click", function() {
			var $frm = $j('.boardWrite :input');
			var param = $frm.serialize();

			$j.ajax({
				url : "/board/boardWriteAction.do",
				dataType : "json",
				type : "POST",
				data : param,
				success : function(data, textStatus, jqXHR) {
					alert("작성완료");

					alert("메세지:" + data.success);

					location.href = "/board/boardList.do";
				},
				error : function(jqXHR, textStatus, errorThrown) {
					alert("실패");
				}
			});
		});
	});

	$j(document).ready(function() {

		var cloneEle = $j("#cloneBody").clone(); //선택한 요소를 복사.

		$j('#btnAction').on("click", function(e) {
			var c1 = $j('#mytable tr:eq(0)').clone(true);
			var c2 = $j('#mytable tr:eq(1)').clone(true);
			$j("#mytable").append(c1);
			$j("#mytable").append(c2);

		});

	});

</script>
<script type="text/javascript">
$j(document).ready(function() {
$j(document).on("click","button[name=delStaff]",function(){
    
    var trHtml = $j(this).parent().parent();
    var trHtml1 = $j(this).parent().parent().prev();
    trHtml.remove(); //tr 테그 삭제
    trHtml1.remove();
    
});
});
</script>
<body>
	<form class="boardWrite">
		<table align="center">
			<tr>
				<td align="right"><input id="submit" type="button" value="작성">
				</td>
			</tr>
			<tr>
				<td>
					<table id="mytable" border="1">
						<tbody id="cloneBody">
							<tr>
								<td width="120" align="center">Title</td>
								<td width="400"><input name="boardTitle" type="text"
									size="50" value="${board.boardTitle}"></td>
									
							</tr>
							<tr class="commenttr">

								
								<td height="300" align="center" class="commenttd">Comment</td>
								<td valign="top"><textarea name="boardComment" rows="20"
										cols="55">${board.boardComment}</textarea></td>
										<td>	
								<button class="btn btn-default" name="delStaff">삭제</button>
								</td>
								
							</tr>
						</tbody>
						<tr>
							<td align="center">Writer</td>
							<td></td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td align="right"><a href="/board/boardList.do">List</a></td>
			</tr>
		</table>
	</form>

	<input type="button" value="행추가" id="btnAction">




	<button id='btn-add-row'>행 추가하기</button>
</body>
</html>