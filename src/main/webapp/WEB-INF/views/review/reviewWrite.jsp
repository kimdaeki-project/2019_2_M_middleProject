<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../resources/css/review/review.css">


</head>
<body>


<div class="comments-area col-lg-7 col-md-7" style="margin: 0 auto">

	<div class="comment-list">
		<form action="../review/reviewWrite" method="post" id="frm">
		<input type="hidden" id="member_num" name="member_num" value="${member.member_num}">
		<input type="hidden" id="rest_num" name="rest_num" value="${vo.rest_num}">

			<c:if test="${ not empty member  }">
				<input type="text" id="writer" name="writer" value="${member.name}" readonly="readonly">
				<select name="score" id="score">
					<option value="1">★☆☆☆☆</option>
					<option value="2">★★☆☆☆</option>
					<option value="3">★★★☆☆</option>
					<option value="4">★★★★☆</option>
					<option value="5">★★★★★</option>
				</select>
			</c:if>
			<div class="single-comment justify-content-between d-flex">
				<br>
				<textarea id="contents" name="contents"
					placeholder="리뷰 작성"
					style="width: 100%; max-height: 100px; min-height: 100px; margin: 5px 0; background-color: white;"
					onfocus="this.placeholder = ''" onblur="this.placeholder = '리뷰 작성'"
					required class="single-input"></textarea>


				<!-- session member, memberVO -->
				<div class="reply-btn">
					<%-- <c:if test="${ not empty member  }"> --%>
					<button type="submit" class="btn-reply text-uppercase">REPLY</button>
					<%-- </c:if> --%>
				</div>
			</div>
		</form>
	</div>

</div>

<div id="review_write_form">
<!-- <div class="starRev">
  <span class="starR on">별1</span>
  <span class="starR">별2</span>
  <span class="starR">별3</span>
  <span class="starR">별4</span>
  <span class="starR">별5</span>
  </div> -->

<!--  	<ul id = "review_write_score">
 	
		<li class="reviewpicker_item">
			<button class="review_score_button" id ="good_btn">
				<i class = "reviewpicker_image" id = "good"></i>
				<span class = "reviewpicker_label">맛있다</span>
			</button>
		</li>
		
		<li class="reviewpicker_item">
			<button class="review_score_button" id = "soso_btn">
				<i class = "reviewpicker_image" id= "soso"></i>
				<span class = "reviewpicker_label">괜찮다</span>
			</button>
		</li>
		
		<li class="reviewpicker_item">
			<button class="review_score_button" id = "bad_btn">
				<i class = "reviewpicker_image" id= "bad"></i>
				<span class = "reviewpicker_label">별로</span>
			</button>
		</li>
		
	</ul>  -->
<div id = "good_button">
	<div id="good_button_img"></div>
	<label id="good_button_label">
	<input type="radio" name="score" id = "good" value="5" checked="checked">
	<span>좋아요</span>
	</label>
</div>	


<textarea id="review_editor" 
	placeholder="주문하신 메뉴는 어떠셨나요? 식당의 분위기와 서비스도 궁금해요!"
	maxlength="10000" 
	required class="single-input"></textarea>
<button class ="genric-btn primary" id= "review_btn">리뷰쓰기</button>


</div>





<script type="text/javascript">

$('#good_btn').click(function() {
	
	
});	


</script>


</body>
</html>


