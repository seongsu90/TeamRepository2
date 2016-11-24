<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>		
	<head>	
		<meta charset="UTF-8">
	</head>
	
	<body>
	 주문 상세정보
	 <hr/>
	 
	 	<h3>${ptableno} 번 테이블</h3>
	 	<table border="1">
			<tr>
				<td style="width:200px;" align="center"><b>메뉴</b></td>
				<td style="width:100px" align="center"><b>수량</b></td>
			</tr>
			
			<c:forEach var="posList" items="${posList}">
				<tr>
					<c:if test="${posList.ptableno == ptableno}">
						<td align="center">${posList.pmlname}</td>
						<td align="center">${posList.pcount}</td>
					</c:if>		
				</tr>
			</c:forEach>
		</table>
		
		<br/>	
	 	
	 	<b>합계 : ${totalPrice}</b><br/>
	  	<b>쿠폰 : ${coupon}</b>
	 	<a href="checkCoupon?cbmid=b&cbnumber=34427389"><input type="submit" value="확인"/></a><br/>
		<b>이벤트 : ${eventPrice}</b><br/>
	 	<b>포인트 : ${point}</b><br/>
	 	<b>---------------------------------------</b><br/>
	 	<%-- <c:if test="${coupon != 1 || 2}">
	 		<h3>결재 금액 : ${totalPrice - coupon}</h3><br/>
	 	</c:if> --%>
	 	<h3>결제 금액 : ${result}</h3><br/>
		
		<a href="delete?presid=${presid}&ptableno=${ptableno}"><input type="submit" value="결제"/></a>		
		<a href="index"><input type="submit" value="뒤로"/></a><br/>	
		
 		<h3>메뉴 리스트</h3>
 		<form method="post" action="/teamapp/pos/add">	
			<table>
				<tr>
					<td style="width:200px;" align="center">메뉴</td>
					<td style="width:100px" align="center">수량</td>
				</tr>
				<c:forEach var="menuList" items="${menuList}">
					<tr>
						<td>
							<input type="hidden" name=presid value="${presid}"/> 							
							<input type="hidden" name=ptableno value="${ptableno}"/>
							<input type="text" name=tempmenu value="${menuList.mlname}" readonly/>							
						</td>
						<td>
							<input style="width:50px" type="number" min="0" max="99" name=tempcount value="0"/> 							
						</td>				
					</tr>					
				</c:forEach>				
			</table>			
			<input type="submit" value="주문"/><br/>			
		</form> 
			
	</body>
</html>
