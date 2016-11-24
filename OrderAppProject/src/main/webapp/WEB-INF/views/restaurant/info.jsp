<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html> 
	<head> 
		<meta charset="UTF-8">
	</head>
	<body> 
	식당 정보 보기
	<hr/>

		<table style="width:800px">
	
		<tr>
		<td style="background-color:pink; width:100px">식당 이름</td>
		<td>${restaurant.resname}</td>
		</tr>
		
		<tr>
		<td style="background-color:pink; width:100px">식당 위치</td>
		<td><pre>${restaurant.reslocation}</pre></td>
		</tr>
		
		<tr>
		<td style="background-color:pink; width:100px">식당 전화번호</td>
		<td><pre>${restaurant.restel}</pre></td>
		</tr>
		
		<tr>
		<td style="background-color:pink; width:100px">식당 전체 테이블 수</td>
		<td><pre>${restaurant.restotaltable}</pre></td>
		</tr>
		
		<tr>
		<td style="background-color:pink; width:100px">식당 정보</td>
		<td><pre>${restaurant.resinfo}</pre></td>
		</tr>
		
		<tr>
		<td style="background-color:pink; width:100px">식당 오픈타임</td>
		<td><pre>${restaurant.resopen}</pre></td>
		</tr>
		
		<tr>
		<td style="background-color:pink; width:100px">식당 클로즈타임</td>
		<td><pre>${restaurant.resclose}</pre></td>
		</tr>
		
		<tr>
		<td style="background-color:pink; width:150px">식당 휴일</td>
		<td><pre>${restaurant.rescloseday}</pre></td>
		</tr>
		
		<tr>
		<td style="background-color:pink; width:150px">식당 사진</td>
		<td><img src="showPhoto?ressavedfile=${restaurant.ressavedfile}" width="120px"/></td>
		</tr>
		
		</table>
		
		
		
		<div>
			<c:if test="${mrank==1}">
				<c:if test="${resid==mresid }">
					<a href="modify?mresid=${mresid}">[수정]</a>
				</c:if>
			</c:if>
			<c:if test="${mrank==2}">
				
					<a href="modify?mresid=${resid}">[수정]</a>
				
			</c:if>
			
			
			
			<c:if test="${mrank==2}">
				<a href="delete?resid=${resid}">[삭제]</a>
			</c:if>
			
			<a href="list">[목록]</a>
			
			<c:if test="${mrank==0}"> 
				<a href="/teamapp/reservation/add?rvresid=${resid}">[예약하러 가기]</a>
				<a href="/teamapp/reservation/list?mid=${login}">[나의 예약 목록]</a>
				
			</c:if>
		</div>
	</body>
</html>