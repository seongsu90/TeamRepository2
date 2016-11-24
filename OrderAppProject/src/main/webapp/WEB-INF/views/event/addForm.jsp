<%@ page  contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
	    <style type="text/css">
			Reset
			body,p,h1,h2,h3,h4,h5,h6,ul,ol,li,dl,dt,dd,table,th,td,form,fieldset,legend,input,textarea,button,select,blockquote,strong,xmp{margin:0; padding:0; font-size:14px; line-height:20px; font-weight:normal; font-family: 'NanumGothic', arial, '돋움', Helvetica, verdana, futura, tahoma, sans-serif; color:#555;}
			legend,caption{display:none;}
			img,fieldset{border:0;}
			ul,ol{list-style:none;}
			a:link,a:visited,a:hover,a:active{text-decoration:none;color:#999;}
			a{display:block;}
			body{}
			div{}
			h2{color:purple; text-align:center; width:100%; font-size:30px;}
			div{}
			ul{width:1000px; margin:auto;}
			ul li{ margin-right:10px; margin-bottom:10px; padding:3px; width:200px; float:left;}
			
		</style> 
	</head> 
	<body>
	
		<h2>이벤트 생성</h2>
		<hr/>
			<form method="post" enctype="multipart/form-data">
			<ul>
				<li>이름 : <input type="text" name="ename" value="${event.ename}"/><br/></li>
				<li>식당아이디 : <input type="number" name="eresid"  value="${event.eresid}"/><br/></li>
				<li>이벤트 사진 : <input type="file" name="ephoto" value="${event.esavedfile}"/><br/></li>
				<li>이벤트 정보 : <input type="text" name="einfo" value="${event.einfo}"/><br/></li>
				<li>이벤트 메뉴 이름 : <input type="text" name="emlname" value="${event.emlname}"/><br/></li>
				<li>이벤트 할인가격 : <input type="number" name="eprice" value="${event.eprice}"/><br/></li>
				<li>이벤트 시작기간 : <input type="date" name="estart" value="${event.estart}"/><br/></li>
				<li>이벤트 종료기간 : <input type="date" name="eend" value="${event.eend}"/><br/></li>
				<li><input type="submit" value="생성"/></li>
			</ul>
			</form>
	</body>
</html>