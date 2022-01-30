<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

<style>
	.carousel-inner > .carousel-item > img{
</style>
</head>
<body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

<script type="text/javascript">
$('.carousel').carousel({
	interval: 5
})
</script>

<div class="container"></div>
	<div id="demo" class="carousel slide" data-ride="carousel">
 		<div class="carousel-inner">
 		<!-- 슬라이드 쇼 -->
  		<div class="carousel-item active">
  		
  		<img class="d-block w-100" src="../resources/image/음식사진1.jpg"  width="50px" height="300px"  style="padding: 30px" alt="First slide">
		<div class="carousel-caption d-none d-md-block">
		<h5>랜덤기능~~</h5>
		</div>
	</div>
	<div class="carousel-item">
	<img class="d-block w-100" src="../resources/image/음식사진2.jpg"  width="100px" height="300px" alt="Second slide" style="padding: 30px">
	</div>
	
	<div class="carousel-item">
	<img class="d-block w-100" src="../resources/image/음식사진3.jpg" width="100px" height="300px"  style="padding: 30px" alt="Third slide">
	</div>
	
	
	<a class="carousel-control-prev" href="#demo" data-slide="prev">
		<span class="carousel-control-prev-icon" aria-hidden="true"></span>
	</a>
	<a class="carousel-control-next" href="#demo" data-slide="next">
		<span class="carousel-control-next-icon" aria-hidden="true"></span>
	</a>
	<ul class="carousel-indicators">
		<li data-target="#demo" data-slide-to="0" class="active"></li>
		<li data-target="#demo" data-slide-to="1"></li>
		<li data-target="#demo" data-slide-to="2"></li>
 	</ul>
 	</div>
	
</body>
</html>