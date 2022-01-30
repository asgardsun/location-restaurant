<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	@import url("/resources/style/random.css");
</style>
<style type="text/css">
	.test{
		width: 10%;
		height: 100px;
		margin: 0 auto;
		padding: 0;
		border: none;
		float: left;
		position: relative;
		top: 10%
	}
	footer {
    position:absolute;
    bottom:0;
    width:100%;
    height:110px;   
    background:#ccc;

}
</style>

    
</head>
<body>
	<table border="0" style="width:100%;">
		<form action="result.jsp" method="post"></form>
	<thead>
	<tr>
		<td colspan="2" align="center" class = "menu"><jsp:include page="/menu.jsp" flush="false"/></td>
	</tr>
	</thead>
	
	<tbody>
	<form action="result.jsp" method="post">


	<tr>
	<td colspan="2">
	<div class="container">
	<jsp:include page="slider.jsp" flush="false"/>
	</div>
	</td>
	</tr>
	<tr height="100px;" style="width: 100%" align="center">
	
	<td style="font-size: 30px; width: 300px">음식 종류 선택</td>
	
	<td align="center">        
		<div class="test" style="margin-left: 3%;">
            <input type="radio" id="input6"  name="where" value="korea" style="display: none;">
            <label for="input6">
                <p>한식</p>
            </label>                 
        </div>
		<div class="test" style="margin-left: 5%;"> 
            <input type="radio" id="input1"  name="where" value="chinese" style="display: none;">
            <label for="input1">
                <p>중식</p>
            </label>                 
  		</div>      
  			<div class="test" style="margin-left: 3%;">	
            <input type="radio" id="input2"  name="where" value="Japanese" style="display: none;">
            <label for="input2">
                <p>일식</p>
            </label>                 
		</div>
		<div class="test" style="margin-left: 3%;">
            <input type="radio" id="input4"  name="where" value="snack" style="display: none;">
            <label for="input4">
                <p>분식</p>
            </label>                 
  		</div>
		<div class="test" style="margin-left: 3%;">
            <input type="radio" id="input3"  name="where" value="meat" style="display: none;">
            <label for="input3">
                <p>고기</p>
            </label>                 
        </div>
    	<div class="test" style="margin-left: 3%;">
            <input type="radio" id="input5"  name="where" value="chicken" style="display: none;">
            <label for="input5">
                <p>치킨</p>
            </label>                 
        </div>
       <div class="test" style="margin-left: 3%;">
            <input type="radio" id="input7"  name="where" value="cafe" style="display: none;">
            <label for="input7">
                <p>카페</p>
            </label>                 
       	</div>
   	</td>
	</tr>
	
	
<tr height="100px;" align="center">
	
	<td style="font-size: 30px; width: 300px">음식 유형 선택</td>

	<td align="center">        
	<div class="test" style="margin-left: 505px; margin-top: 20px"> 
            <input type="radio" id="input8"  name="where2" value="sole" style="display: none;">
            <label for="input8">
                <p>SOLO</p>
            </label>                 
  	</div>      
  			<div class="test" style="margin-left: 3%; margin-top: 20px;">	
            <input type="radio" id="input9"  name="where2" value="lover" style="display: none;">
            <label for="input9">
                <p>연인</p>
            </label>                 
	</div>
			<div class="test" style="margin-left: 3%; margin-top: 20px;">
            <input type="radio" id="input10"  name="where2" value="family" style="display: none;">
            <label for="input10">
                <p>가족</p>
            </label>                 
            </div>
   	</td>
	</tr>
	<td colspan="2" align="center" style="padding-top: 30px; padding-left: 15%">
	<button class="btn btn-dark" type="submit" style="font-size: 40px; width: 400px">확인</button>
	</td>
	</tr>
	</form>
	</tbody>
	

	<tfoot>
		<tr>
	<td colspan="2">
		<footer style="background-color: #000000; color: #ffffff">
		<div class="container">
			<br>
			<div class="row">
				<div class="col-sm-2" style="text-align: center; font-size: 15px;">
					<h5>Copyringht &copy; 2017</h5>
				</div>
				<div class="col-sm-3" style="font-size: 15px">
					<h4>팀원 소개</h4>
					<p>김승겸 배예진 한재근</p>
				</div>
				<div class="col-sm-2">
					<h4 style="text-align: center; font-size: 15px">내비게이션</h4>
					<div class="list-group">
						<a href="#" class="list-group-item" style="font-size: 15px;">소개</a>
					</div>
				</div>

			</div>
	</footer>
	</td>
	</tr>
	</tfoot>
	</table>
		<jsp:include page="/rightmenu.jsp" flush="false"/>
</body>
</html>