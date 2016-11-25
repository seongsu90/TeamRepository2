<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page  contentType="text/html;charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<title>Home</title>
	<meta charset="UTF-8">
</head>
<body>
	[membercontroller]<br/>
	<c:if test="${login==null}">
	※<a href="/teamapp/member/login">로그인하기</a><br/>
	</c:if> 	
	<c:if test="${login!=null}">
	※ <a href="/teamapp/member/logout">로그아웃</a><br/>
	</c:if> 
	※<a href="/teamapp/member/findMid">아이디찾기</a><br/>
	※<a href="/teamapp/member/findMpassword">비밀번호찾기</a><br/>
    ※<a href="/teamapp/member/join">회원가입</a><br/>
    ※<a href="/teamapp/member/list">회원목록</a><br/>
    <c:if test="${login != null}">
    ※<a href="/teamapp/member/info?mid=${login}">회원정보</a>
    </c:if><br/>
    ------------------------------------------------------<br/>
    [couponcontroller]<br/>
    <c:if test="${login==null}">
    로그인을 해야 쿠폰기능을 이용할 수 있습니다.<br/>
    </c:if> 
    <c:if test="${login!=null}">
     ※<a href="/teamapp/coupon/index?mid=${login}">쿠폰 기능</a><br/>
     </c:if>
     ------------------------------------------------------<br/>
     <b>[poscontroller-King of Analog]</b><br/>
    ※<a href="/teamapp/pos/index">pos 기능</a><br/>
  <!--   ※<a href="/teamapp/pos/modify">pos 수정</a><br/>
    ※<a href="/teamapp/pos/delete">pos 삭제</a><br/>
    ※<a href="/teamapp/pos/info">pos 정보보기</a><br/>
    ※<a href="/teamapp/pos/calcsum">총가격</a><br/> -->
    -------------------------------------------------------<br/>
     <b>[reviewcontroller-King of Analog]</b><br/>
     ※<a href="/teamapp/review/write">리뷰쓰기</a><br/>
     ※<a href="/teamapp/review/delete">리뷰삭제</a><br/>
     ※<a href="/teamapp/review/info">리뷰보기</a><br/>
     ※<a href="/teamapp/review/list">리뷰리스트</a><br/>
    -------------------------------------------------------<br/>
     [restaurant]<br/>  
     <c:if test="${login==null}">
     ※<a href="/teamapp/restaurant/list">음식점 리스트보기</a><br/>
    로그인을 해야 추가 식당기능을 이용할 수 있습니다.<br/>
    </c:if> 
    <c:if test="${login!=null}">
     ※<a href="/teamapp/restaurant/index?mid=${login}">음식점 기능</a><br/>
     </c:if>
     -------------------------------------------------------<br/>
     [Event] <br/>
     ※<a href="/teamapp/event/index">이벤트 기능</a><br/>
     -------------------------------------------------------<br/>
     [MenuList] <br/>
     ※<a href="/teamapp/menulist/index">메뉴리스트</a><br/>
     -------------------------------------------------------<br/>
     [Reservation]<br/>
     <c:if test="${login==null}">
    로그인을 해야 예약기능을 이용할 수 있습니다.<br/>
    </c:if> 
    <c:if test="${login!=null}">
     ※<a href="/teamapp/reservation/index">예약기능</a><br/>
    </c:if>
     -------------------------------------------------------<br/>
     [Favorite]<br/>
     ※<a href="/teamapp/favorite/add">즐겨찾기 추가폼</a><br/>
     ※<a href="/teamapp/favorite/list">즐겨찾기 리스트</a><br/>
     
      -------------------------------------------------------<br/>
      ※<a href="${pageContext.servletContext.contextPath}/">New Home page</a><br/>
</body>
	<!--  -->

</html>
