<%@page import="java.util.Arrays"%>
<%@ page contentType="text/html;charset=UTF-8"%>

<%
String selCity = request.getParameter("selCity");
String selProvince = request.getParameter("selProvince");
String[] kangwon = {"강릉시", "고성군", "동해시", "삼척시", "속초시", "양구군", "양양군", "영월군", "원주시", "인제군", "정선군", "철원군", "춘천시", "태백시", "평창군", "홍천군", "화천군", "횡성군"};
String[] gyeonggi = {"가평군", "고양시 덕양구", "고양시 일산동구", "고양시 일산서구", "과천시", "광명시", "광주시", "구리시", "군포시", "김포시", "남양주시", "동두천시", "부천시", "성남시 분당구", "성남시 수정구", "성남시 중원구", "수원시 권선구", "수원시 영통구", "수원시 장안구", "수원시 팔달구", "시흥시", "안산시 단원구", "안산시 상록구", "안성시", "안양시 동안구", "안양시 만안구", "양주시", "양평군", "여주시", "연천군", "오산시", "용인시 기흥구", "용인시 수지구", "용인시 처인구", "의왕시", "의정부시", "이천시", "파주시", "평택시", "포천시", "하남시", "화성시"};
String[] seoul = {"강남구", "강동구", "강북구", "강서구", "관악구", "광진구", "구로구", "금천구", "노원구", "도봉구", "동대문구", "동작구", "마포구", "서대문구", "서초구", "성동구", "성북구", "송파구", "양천구", "영등포구", "용산구", "은평구", "종로구", "중구", "중랑구"};
String[] city = null;

if ( selCity.equals("선택") ) {
	city = Arrays.copyOf(new String[]{"선택"}, 1);
} else if ( selCity.equals("강원도") ) {
	city = Arrays.copyOf(kangwon, kangwon.length);
} else if ( selCity.equals("경기도") ) {
	city = Arrays.copyOf(gyeonggi, gyeonggi.length);
} else {
	city = Arrays.copyOf(seoul, seoul.length);
}

for ( int i = 0 ; i < city.length ; i++ ) {
	if ( selProvince.equals(city[i]) ) {
%>
		<option value="<%=city[i]%>" selected><%=city[i]%></option>
<% 
	} else {
%>
		<option value="<%=city[i]%>"><%=city[i]%></option>
<%
	}
}
%>


