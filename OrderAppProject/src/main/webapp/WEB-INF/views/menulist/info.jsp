<%@ page  contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<style>			
			body{
			    background:#eee;;
			}
			.title{
			    text-shadow: 2px 2px 0px rgba(0, 0, 0, 0.4) !important;    
			}
			
			.divider-title{
			    border:1px solid #dddddd;
			}
			
			.project {
			    margin-bottom: 30px;
			    vertical-align: top;
			    margin-right: 30px;
			    float: left;
			    cursor: pointer;
			    width:100%;
			}
			
			.project figure {
			    position: relative;
			    display: inline-block;
			    width: 283px;
			    -moz-box-shadow: 0 3px 0 #e2e2e2,transparent 0 0 0;
			    -webkit-box-shadow: 0 3px 0 #e2e2e2,transparent 0 0 0;
			    box-shadow: 0 3px 0 #e2e2e2,transparent 0 0 0;
			    -webkit-box-shadow: 0 3px 0 #e2e2e2;
			    -moz-box-shadow: 0 3px 0 #e2e2e2;
			    box-shadow: 0 3px 0 #e2e2e2;
			}
			
			.project figure figcaption {
			    position: relative;
			    z-index: 10;
			    padding: 8px 18px 11px;
			    background: #fff;
			    -ms-transition: all .2s ease-out;
			    -webkit-transition: all .2s ease-out;
			    -moz-transition: all .2s ease-out;
			    -o-transition: all .2s ease-out;
			    transition: all .2s ease-out;
			    text-align: left;
			    color: #555;
			}
			
			.project figure:hover .actions {
			    opacity: 1;
			}
			
			.project figure .actions {
			    display: block;
			    position: absolute;
			    top: 0;
			    z-index: 1;
			    width: 100%;
			    height: 100%;
			    opacity: 0;
			    background-color: rgba(29,29,29,.7);
			    -ms-transition: all .2s ease-out;
			    -webkit-transition: all .2s ease-out;
			    -moz-transition: all .2s ease-out;
			    -o-transition: all .2s ease-out;
			    transition: all .2s ease-out;
			}
			
			.project figure img {
			    border: 0;
			    width: 100%;
			}
			.btn-warning bnt-action{
			    margin: 0% 0% auto;    
			}
			
			figcaption .project-details {
			    display: block;
			    font-size: 16px;
			    line-height: 33px;
			    color: #0093d0;
			    height: 27px;
			    width: 85%;
			    margin-bottom: 5px;
			    overflow: hidden;
			}
			
			figcaption .project-price {
			    position: absolute;
			    right: 15px;
			    top: 12px;
			    font-size: 22px;
			    text-align: right;
			    margin-top: 8px;
			    letter-spacing: -1px;
			    -webkit-font-smoothing: antialiased;
			}
			
			figcaption .project-creator {
			    font-size: 13px;
			    color: #545454;
			    display: block;
			}
			
			figcaption .project-creator {
			    font-size: 13px;
			    color: #545454;
			    display: block;
			}
			
			.project figure .actions button {
			    padding: 13px 20px;
			    font-size: 16px;
			    top: 32%;
			    position: absolute;
			    left: 50%;
			    width: 90%;
			    margin-left: -45%;
			    line-height: 18px;
			    letter-spacing: 1px;
			}  
			
			       
			body {
			 font-size: 18px;  
			
			}
			.orange-circle-button {
				box-shadow: 2px 4px 0 2px rgba(0,0,0,0.1);
				border: .5em solid #E84D0E;
				font-size: 1em;
				color: #ffffff;
				background-color: #e84d0e;
				
				border-radius: 50%;
				height: 4em;
				width: 4em;
				position: relative;
				float:left;
				margin: 0 20px;
				
			}
			.orange-circle-button:hover {
				color:#ffffff;
			    background-color: #e84d0e;
				text-decoration: none;
				border-color: #ff7536;
				
			}
			.orange-circle-button:visited {
				color:#ffffff;
			    background-color: #e84d0e;
				text-decoration: none;
				
			}
			.orange-circle-link-greater-than {
			    font-size: 1em;
			}     
			
			/* CORE CSS */
			body {
			  -webkit-perspective: 1000px;
			  -moz-perspective: 1000px;
			  perspective: 1000px;
			}
			/* Container box to set the sides relative to */
			.cube {
			  width: 250px;
			  height: 100px;
			  -webkit-transition: all 250ms ease;
			  -moz-transition: all 250ms ease;
			  -o-transition: all 250ms ease;
			  transition: all 250ms ease;
			  -webkit-transform-style: preserve-3d;
			  -moz-transform-style: preserve-3d;
			  -o-transform-style: preserve-3d;
			  -ms-transform-style: preserve-3d;
			  transform-style: preserve-3d;
			}
			/* The two faces of the cube */
			.default-state,
			.active-state {
			  height: 100px;
			}
			/* Position the faces */
			.default-state {
			  -webkit-transform: translateZ(50px);
			  -moz-transform: translateZ(50px);
			  -o-transform: translateZ(50px);
			  -ms-transform: translateZ(50px);
			  transform: translateZ(50px);
			}
			.flip-to-top .active-state {
			  -webkit-transform: rotateX(90deg) translateZ(150px);
			  -moz-transform: rotateX(90deg) translateZ(150px);
			  -o-transform: rotateX(90deg) translateZ(150px);
			  -ms-transform: rotateX(90deg) translateZ(150px);
			  transform: rotateX(90deg) translateZ(150px);
			}
			.flip-to-bottom .active-state {
			  -webkit-transform: rotateX(-90deg) translateZ(-50px);
			  -moz-transform: rotateX(-90deg) translateZ(-50px);
			  -o-transform: rotateX(-90deg) translateZ(-50px);
			  -ms-transform: rotateX(-90deg) translateZ(-50px);
			  transform: rotateX(-90deg) translateZ(-50px);
			}
			
			/* END CORE CSS */
			
			
			
			
			</style>
			
	</head>
	<body>		
		<div class="container">
		    <h1 class="text-center text-primary title" style="text-align:center;">정보</h1>
		    <hr class="divider-title">
		    
		    <div class="col-ms-10 col-md-4" style="width:350px; margin:auto;">
		        <div class="project">
		            <figure class="img-responsive">
		                <img src="http://lorempixel.com/400/300/sports/6/">
		                <figcaption>
		                    <span class="project-details">${menuList.mlname}</span>
		                    <span class="project-price"><strong>${menuList.mlprice}</strong></span>
		                    <span class="project-creator">${menuList.mlinfo}</span>
		                </figcaption>
		            </figure>
		        </div>
		    </div>
		</div>    	
		<div style="width:350px; margin:auto;">	
		<c:if test="${login!=null}">
				<c:if test="${mrank!=0}">
				    <a href="modify?mlresid=${menuList.mlresid}&mlname=${menuList.mlname}">
				   		<div class="text">
							<div class="row">
       							 <div class="col-md-12">
		    						<button class="btn btn-default orange-circle-button">수정</button>
       						     </div>   
							</div>
						</div>
				    </a>
					<a href="delete?mlresid=${menuList.mlresid}">
						<div class="text">
							<div class="row">
       							 <div class="col-md-12">
		    						<button class="btn btn-default orange-circle-button">삭제</button>
	
       						     </div>   
							</div>
						</div>
					</a>
				</c:if>
			</c:if>
			<a href="list">
				<div class="text">
					<div class="row">
       					<div class="col-md-12">
		    				<button class="btn btn-default orange-circle-button">목록</button>
	
       					 </div>   
					</div>
				</div>
			</a>	       
			</div>                           
	</body>
	
	<%-- 메뉴리스트 정보
		<hr/>
		<table style="width:570px text-align=center;">
			 <tr>
				<td style="background-color:blue; width:100px">메뉴 가격</td>	
				<td>${menuList.mlprice}</td>
			 </tr>
			 <tr>
				<td style="background-color:blue; width:100px">정보</td>
				<td>${menuList.mlinfo}</td>	
			 </tr>
			<tr>
				<td style="background-color:blue; width:100px">메뉴 사진</td>
				<td><img src="showPhoto?mlsavedfile=${menuList.mlsavedfile}" width="500px"/></td>
			</tr>
			<tr>
				<td style="background-color:blue; width:100px">핫해하태</td>
				<td>${menuList.mlishot}</td>
			</tr>
		</table>
		 	 <c:if test="${login!=null}">
				<c:if test="${mrank!=0}">
				    <a href="modify?mlresid=${menuList.mlresid}&mlname=${menuList.mlname}">[수정]</a>
					<a href="delete?mlresid=${menuList.mlresid}">[삭제]</a>
				</c:if>
			</c:if>
			<a href="list">[목록]</a> --%>
</html>