  <%@ page  contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		
		<%-- <script type="text/javascript" src="${pageContext.servletContext.contextPath}/resources/bootstrap-3.3/js/bootstrap.min.js"></script> --%>
	 	
	 	
	 	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootswatch/3.3.6/lumen/bootstrap.min.css">
		<link rel="stylesheet" href="https://daneden.github.io/animate.css/animate.min.css">
	 	
	 	<style>
	 		/*By DjelalEddine@gmail.com*/
			#user .avatar {
			    width:60px;
				}
			#user .avatar > img{
				width:50px;
				height:50px;
				border-radius:10%;
				}
			/*Card*/
			#user .panel-thumb{
			margin:5px auto;
			text-align:center;	
				}
			#user .panel-thumb .avatar-card {
			text-align:center;
			height:200px;
			margin:auto;
			overflow:hidden;
			}	
			#user .panel-thumb .avatar-card > img{
				max-width:200px;
				max-height:200px;
				}
			
			/* table*/
			#user .panel-table{
			  animation-duration:1s;
			}
			
			#user .panel-table .panel-body .table{
			  margin:0px;
			}
			#user .panel-table .panel-body {
			  padding:0px;
			}
			#user .panel-table .panel-body .table-bordered > thead > tr > th{
			  text-align:center;
			}
			#user .panel-table .panel-footer {
			  height:60px;
			  padding:0px;
			}
	 	</style>
	 	<script>
		 	function filter($state){
		 		var x   = document.getElementsByClassName($state);
		 		var btn = document.getElementById($state);
	
		 		if (btn.className == "btn"){
		 		    btn.className = btn.dataset.class;
		 			for (i = 0; i < x.length; i++) {x[i].className = " animated fadeInLeft "+$state;}
		 			}
		 			else{ 
		 			for (i = 0; i < x.length; i++) {x[i].className = " animated fadeOutRight "+$state;}
		 			 btn.className = "btn";
		 			}
	
		 		}
	 	</script>
	</head>	
		<body>
			<div class="container" style="margin-top:20px;">
				<div class="row">
					<div id="user" class="col-md-12" >
					  <div class="panel panel-primary panel-table animated slideInDown">
					   <div class="panel-heading " style="padding:5px; background-color:#34495e;">
					        <div class="row">
					        
					        <div class="col col-xs-5 text-center">
					            <h1 class="panel-title" style="font-size:50px;">CREATE</h1>
					        </div>
					        
					        
					   </div>
				    </div>
				   <div class="panel-body">
				     <div class="tab-content">
				      <div role="tabpanel" class="tab-pane active" id="list">
				      <form method="post" enctype="multipart/form-data">
					       <table class="table table-striped table-bordered table-list">
					         <tbody>
					          <tr class="ok">
					             <td>메뉴이름</td>
					             <td>메뉴가격</td>
					             <td>메뉴정보</td>
					             <td>메뉴사진</td>
					         	 <td>핫메뉴 선택</td> 
					          </tr>
					          <tr class="ban">
					          	 <td><input type="text" name="mlname" value="${menuList.mlname}"/></td>
					             <td><input type="number" name="mlprice" value="${menuList.mlprice}"/></td>
					             <td><input type="text" name="mlinfo" value="${menuList.mlinfo}"/></td>
					             <td><input type="file" name="mlphoto" value="${menuList.mlsavedfile}"/></td>
					              <td>
					             	<input type="radio" name="mlishot" value="true"/>핫메뉴
							  		<input type="radio" name="mlishot" value="false"/>일반메뉴
					             </td>  
					          </tr>
					          <tr class="new" style="text-align:center;">
					             <td colspan="6"><input type="submit" value="추가"/></td>
					            </tr>
					          </tbody>  
					        </table>
				        </form>
				      </div><!-- END id="list" -->
				        
				      <div role="tabpanel" class="tab-pane " id="thumb">
				        <div class="row">
				        <div class="col-md-12">
				        
				        <div class="ok">
				         <div class="col-md-3">
				         <div class="panel panel-default panel-thumb">
				  			<div class="panel-heading">
				    			<h3 class="panel-title">Djelal Eddine</h3>
				  			</div>
				  			<div class="panel-body avatar-card">
				   			 <img src="https://pbs.twimg.com/profile_images/746779035720683521/AyHWtpGY_400x400.jpg">
				 			</div>
				            <div class="panel-footer">
				               <a href="#" class="btn btn-primary" title="Edit"    ><i class="fa fa-pencil"></i></a>
				               <a href="#" class="btn btn-warning" title="ban"	 ><i class="fa fa-ban"   ></i></a>
				               <a href="#" class="btn btn-danger"  title="delete"  ><i class="fa fa-trash" ></i></a>
				            </div>
				         </div>
						 </div>
				       </div>
				      	
				        <div class="ban">
				         <div class="col-md-3">
				         <div class="panel panel-default panel-thumb">
				  			<div class="panel-heading">
				    			<h3 class="panel-title">Moh Aymen</h3>
				  			</div>
				  			<div class="panel-body avatar-card">
				   			 <img src="https://pbs.twimg.com/profile_images/3511252200/f97a40336742d17609e0b0ca17e301b8_400x400.jpeg">
				 			</div>
				           
				         </div>
						 </div>
				       </div>
				        
				        <div class="new">
				         <div class="col-md-3">
				         <div class="panel panel-default panel-thumb">
				  			<div class="panel-heading">
				    			<h3 class="panel-title">Dia ElHak</h3>
				  			</div>
				  			<div class="panel-body avatar-card">
				   			 <img src="https://pbs.twimg.com/profile_images/3023221270/fcb34337f850c1037af9840ebe510d36_400x400.jpeg">
				 			</div>
				            
				         </div>
						 </div>
				       </div>
				       
				       </div>
				      </div>
				      </div><!-- END id="thumb" -->
				       
				     </div><!-- END tab-content --> 
				    </div>
				   
				   
				  </div><!--END panel-table-->
				</div>
				</div>
           </div>
		</body>
</html> 
 <%--
			<form method="post" enctype="multipart/form-data">
			
				메뉴이름 : <input type="text" name="mlname" value="${menuList.mlname}"/><br/>	
				메뉴가격 : <input type="number" name="mlprice" value="${menuList.mlprice}"/><br/>
				식당아이디 : <input type="text" name="mlresid" value="${menuList.mlresid}"/><br/>
				메뉴 정보 : <input type="text" name="mlinfo" value="${menuList.mlinfo}"/><br/>
			     메뉴 사진 : <input type="file" name="mlphoto" value="${menuList.mlsavedfile}"/><br/>
				핫메뉴 선택 : <input type="radio" name="mlishot" value="true"/>핫해하태?
						   <input type="radio" name="mlishot" value="false"/>일반메뉴<br/> 
				
				<input type="submit" value="생성"/>
			</form>
			--%>
 