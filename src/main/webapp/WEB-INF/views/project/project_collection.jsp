<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<title>PFD Project Collection</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<jsp:include page="../main/navbar.jsp" />
		<link rel="stylesheet" href="resources/css/project_collection.css" />
	</head>
	<body>
	
		<div class="project-container">
			<div class="project-list">
				<div class="project-list-item">
					<div class="img-wrapper">
						<img src="resources/Image/sample.jpg">
					</div>
					<div class="info">
						<div class="info-detail">
							<div class="title">제목 들어갈 자리</div>
							<div class="user-profile">
								<img class="pic icon-round" src="">이름 들어갈 자리
							</div>
						</div>
					</div>
					<div class="bottom">
						<table class="social-info">
							<tbody>
								<tr>
									<td class="view-cnt">
										<img class="view-icon" src="resources/Image/icon/view-gray.png" style="width:20%;">
										3125
									</td>
									<td class="like-cnt">
										<img class="like-icon" src="resources/Image/icon/like-gray.png" style="width:20%;">
										63
									</td>
									<td class="comment-cnt">
										<img class="comment-icon" src="resources/Image/icon/comment-gray.png" style="width:20%;">
										11
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>