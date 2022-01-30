<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/menu.jsp" flush="false"/>
	<jsp:include page="/rightmenu.jsp" flush="false"/>
	<%!
		int a, b;
		int M;
		int i;
		
		String[][][] fk = {
				{ //혼자 먹는 케이스
					{"짜장면", "짬뽕", "볶음밥"}, //증식
					{"돈까스", "라멘", "우동"}, //일식
					{"불고기","삼겹살", "갈비"}, // 고기
					{"떡볶이", "라면", "만두"}, //분식
					{"KFC","맘스터치"}, //치킨
					{"비빔밥", "김치찌게", "된장찌게"}, //한식
					{"아메리카노","바닐라 라떼"} // 카페
					
				},
				{ // 연인
					{"탕수육", "깐풍기", "깐풍새우"}, //증식
					{"초밥", "모듬회"}, //일식
					{"안심","가브리살", "목살"}, // 고기
					{"떡볶이", "닭강정", "닭도리탕"}, //분식
					{"지코바","60계치킨","BHC"}, //치킨
					{"곱창", "불고기", "냉면"}, //한식
					{"마카롱","케이크","와플"} // 카페
				},
				
				{ //가족
					{"짜장면", "짬뽕", "볶음밥"}, //증식
					{"사시미", "모듬초밥", "규동"}, //일식
					{"등갈비","족발", "소고기"}, // 고기
					{"칼국수", "잔치국수", "쌀국수"}, //분식
					{"BBQ","교촌치킨","굽네치킨"}, //치킨 
					{"비빔밥", "김치찌게", "된장찌게"}, //한식
					{"투썸","스타벅스","커피빈"} // 카페
				}
				
		};
		
	%>
	<%!
		public int food_index(String food){
		
		int index = 0;
		
		if(food.equals("chinese")) index = 0;
		if(food.equals("Japanese")) index = 1;
		if(food.equals("meat")) index = 2;
		if(food.equals("snack")) index = 3;
		if(food.equals("chicken")) index = 4;
		if(food.equals("korea")) index = 5;
		if(food.equals("cafe")) index = 6;
		
		return index;

	}
	
		public int kind_index(String kind){		
		int index = 0;
	
		if(kind.equals("sole")) index = 0;
		if(kind.equals("lover")) index = 1;
		if(kind.equals("family")) index = 2;
		return index;

	}
	
	
	
		public String menu(int kind_index, int food_index){
			String result = null;
			 Random random = new Random();
			 M = random.nextInt(fk[kind_index][food_index].length);
			 result = fk[kind_index][food_index][M];
			return result;
	}
	%>
	<%
		request.setCharacterEncoding("utf-8");
		String food = request.getParameter("where");
		String kind = request.getParameter("where2");
		a = kind_index(kind);
		b = food_index(food);
		String menuSelect = menu(a, b);
	%>
	<jsp:forward page="../location/search.jsp">
	<jsp:param value="<%=menuSelect %>" name="searchWord"/>
	</jsp:forward>
	
</body>
</html>