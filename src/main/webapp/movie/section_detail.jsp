<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	<c:set var="vo" value="${vo }"/>
	<img class="poster_detail" alt="" src="${fn:substring(vo.getM_poster(), 0, vo.getM_poster().lastIndexOf('?'))}">
	<div class="backDetail">
	</div>
	<div class="graybox"></div>
 	<div class="posterDisc">
		<p class="titleDisc">${vo.getM_title() }</p>
		<p class="subDisc">${vo.getM_rdate() } | ${vo.getM_genre() }</p>
		<p class="subDisc">누적 ${vo.getM_cnt() } 관람</p>
	</div>
	
	<span class="detailDisc">
		<h3>기본 정보</h3>
		<div class="dDfirst">
			<p>${vo.getM_title() }</p>
			<p>${vo.getM_rdate() }    |    ${vo.getM_genre() }</p>
			<p>${vo.getM_time() }    |    예매율 ${vo.getM_rate() }%</p>
		</div>
		<div class="dDsecond">
			<p>${vo.getM_content() }</p>
		</div>
		<div class="dDthird">
			<p>감독 : ${vo.getM_director() }</p>
			<p>배우 : ${vo.getM_cast() }</p>
		</div>
		<div class="crossline1"></div>
	</span> 
	<span class="buttons">
		<img alt="" src="../image/광고.png">
		 <c:if test="${sessionScope.u_id!=null }">
		 <button class="reviewWrite" href="#">
            리뷰 작성하기
         </button>
		  <c:if test="${count==0 }">
        	 <a href="../jjim/jjim_insert.do?no=${vo.m_no }"><button class="JJim">찜하기</button></a>
         </c:if>
         <c:if test="${count!=0 }">
        	<a href="../jjim/jjim_delete.do?no=${vo.m_no }&wno=${wno}"><button class="JJim">찜취소</button></a>
         </c:if>
         <a href="../reservation/movie_reservation.do?no=${vo.m_no }">
			 <button class="reserve">
	            예매하기
	         </button>
         </a>
         </c:if>
	</span>
	<div class="medias">
		<h3 class="gallery">갤러리</h3>
		<div class="G_makeOverflow">
			<c:forTokens var="photo" items="${vo.getM_photo() }" delims="|">
				<a href="${photo }"><img class="photos" src="${photo }" ></a>
			</c:forTokens>
		</div>
		<h3 class="video">동영상</h3>
		<div class="V_position">
		<a href="${vo.getM_preview() }">
			<video autoplay controls loop style="height: 200px;width:300px;">
                  <img src="${vo.getM_preview() }">
            </video>
        </a>
		</div>
	</div>
	<div class="reviews">
	<c:set var="msg" value="${msg }"/>
	<h3>리뷰${msg }</h3>
	<div class="reviewInsert">
	<c:if test="${sessionScope.u_id!=null }">
	<form method="post" action="../movie/insertReview.do" enctype="multi">
		<select name="r_score">
			<option>눌러서 별점을 입력해주세요!  </option>
			<option value="1.0">★점</option>
			<option value="2.0">★★점</option>
			<option value="3.0">★★★점</option>
			<option value="4.0">★★★★점</option>
			<option value="5.0">★★★★★점</option>		
		</select>
		<div class="com_area">
		<textarea id="r_comend" rows="5" cols="100" name="r_comend"></textarea>
		</div>
		<input type="text" name="u_id" size=10 class="imsi">
		<input type="hidden" name="no" value="${vo.getM_no() }">
		<button type="submit"onclick="javascript:history.go(0)">등록하기</button>
	</form>
	</c:if>
		<div class="crossline4"></div>
	<c:if test="${sessionScope.u_id==null }">
		<h1>&nbsp;&nbsp;댓글작성은 로그인하여 이용해주세요</h1>
	</c:if>
	</div>
	<div class="reviewContainer">
	<c:forEach var="list" items="${list }" varStatus="s">
	<c:if test="${s.index<=3 }">
		<div class="reviewRead">
	 	<p class="r_user">${list.getU_id() }</p>
	 	<p class="r_score">★ ${list.getR_score() }</p>
	 	<div class="crossline2"></div>
	 	<div class="r_comend">
	 		<p>${list.getR_comend()}</p>
	 	</div>
	 	<div class="crossline3"></div>
	 	<form method="post"action=""></form>
<%-- 	  <c:set var="rgno" value=${rg_no }/> 
 --%>	 	<a class="like" href="../movie/likePlus.do">좋아요 개</a>
	 
		</div>
	</c:if>
	</c:forEach>
	</div>
</div>
</body>
</html>