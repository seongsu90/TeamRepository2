<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>		
	<head>	
		<meta charset="UTF-8">
		
		<style type="text/css">
 			a {	
				text-decoration: none;
				color: black;
			}
			a:HOVER {				
				color: green;
			} 
						
		</style>
		
	</head>
	
	<body>
		Pos 메인화면
		<hr/>	

		<c:if test="${presid != 0}">
			<table width="400" border="1">
				<tr>
					<td style="width:200px; height:200px">
						<a href="info?presid=${presid}&ptableno=1">1							
							<c:forEach  var="pos" items="${posList}">
								<c:if test="${pos.ptableno == 1}">	
									<br/>${pos.pmlname}		${pos.pcount}<br/>
								</c:if>	
							</c:forEach>									
						</a>										
					</td>
					<td style="width:200px; height:200px">
						<a href="info?presid=${presid}&ptableno=2">2
							<c:forEach  var="pos" items="${posList}">
								<c:if test="${pos.ptableno == 2}">	
									<br/>${pos.pmlname}		${pos.pcount}<br/>
								</c:if>	
							</c:forEach>
						</a>					
					</td>
				</tr> 
				<tr>
					<td style="width:200px; height:200px">
						<a href="info?presid=${presid}&ptableno=3">3
							<c:forEach  var="pos" items="${posList}">
								<c:if test="${pos.ptableno == 3}">	
									<br/>${pos.pmlname}		${pos.pcount}<br/>
								</c:if>	
							</c:forEach>
						</a>					
					</td>
					<td style="width:200px; height:200px">
						<a href="info?presid=${presid}&ptableno=4">4
							<c:forEach  var="pos" items="${posList}">
								<c:if test="${pos.ptableno == 4}">	
									<br/>${pos.pmlname}		${pos.pcount}<br/>
								</c:if>	
							</c:forEach>
						</a>					
					</td>
				</tr>
			</table>
			<br/><br/>
		
			<table width="400" border="1">			
				<tr>
					<td>예약시간</td>
					<td>인원수</td>
					<td>예약자</td>
					<td>확인</td>
				</tr>
				<c:forEach  var="reservList" items="${reservList}">
					<tr>
						<td>${reservList.rvtime}</td>
						<td>${reservList.rvperson}</td>
						<td>${reservList.rvmid}</td>
						<td>
							<form method="post" action="/teamapp/reservation/delete">
								<input type="hidden" name="rvmid" value="${reservList.rvmid}"/>
								<input type="hidden" name="rvresid" value="${reservList.rvresid}"/>
								<input type="submit" value="확인"/>													
							</form>							
							<a href="index?rvmid=${reservList.rvmid}"><input type="submit" value="삭제"/></a>
						</td>							
					</tr>
				</c:forEach>
			</table>		
		</c:if>
		<c:if test="${presid == 0}">돌아가</c:if>

		
		<%-- <c:forEach var="i" begin="0" end="${totalTable/4}">
			<table>
				<tr>
					<td>
						${presid}
					</td>
					<td>
						${presid}
					</td>
					<td>
						${presid}
					</td>
					<td>
						${presid}
					</td>
				</tr>
			</table>
		</c:forEach> --%>
		
	 	<%-- <c:if test="${presid != 0}">
			<table width="400" border="1">
				<c:forEach  var="i" begin="0" end="${totalTable/2}">
					<c:if test="${i%2 != 0}">
						<tr>
							<td style="width:200px; height:200px">
								<a href="info?presid=${presid}&ptableno=${i+2}">${i+2}							
									<c:forEach  var="pos" items="${posList}">
										<c:if test="${pos.ptableno == i+2}">	
											<br/>${pos.pmlname}		${pos.pcount}<br/>
										</c:if>	
									</c:forEach>									
								</a>							
							</td>	
							<td style="width:200px; height:200px">
								<a href="info?presid=${presid}&ptableno=${i+3}">${i+3}							
									<c:forEach  var="pos" items="${posList}">
										<c:if test="${pos.ptableno == i+3}">	
											<br/>${pos.pmlname}		${pos.pcount}<br/>
										</c:if>	
									</c:forEach>									
								</a>
							</td>	
						</tr>
					</c:if>
					<c:if test="${i%2 == 0}">
						<tr>
							<td style="width:200px; height:200px">
								<a href="info?presid=${presid}&ptableno=${i+1}">${i+1}							
									<c:forEach  var="pos" items="${posList}">
										<c:if test="${pos.ptableno == i+1}">	
											<br/>${pos.pmlname}		${pos.pcount}<br/>
										</c:if>	
									</c:forEach>									
								</a>						
							</td>	
							<td style="width:200px; height:200px">
								<a href="info?presid=${presid}&ptableno=${i+2}">${i+2}							
									<c:forEach  var="pos" items="${posList}">
										<c:if test="${pos.ptableno == i+2}">	
											<br/>${pos.pmlname}		${pos.pcount}<br/>
										</c:if>	
									</c:forEach>									
								</a>
							</td>	
						</tr>
					</c:if>
				</c:forEach>		
			</table>
		</c:if>	  --%>	
		
		

	</body>
</html>
