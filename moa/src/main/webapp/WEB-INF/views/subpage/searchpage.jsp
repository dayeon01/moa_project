<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<jsp:include page="../a_nav/head.jsp">
		<jsp:param name="" value="" />
	</jsp:include>
</head>
<body>
<!-- Navigator -->
	<jsp:include page="../a_nav/nav.jsp">
		<jsp:param name="" value="" />
	</jsp:include>
	
<!-- Page Content-->
<section class="py-5">
	<div class="container">
	    <!-- Page Heading/Breadcrumbs-->
        <h1>
            상세 검색
        </h1>
        <ol class="breadcrumb mb-4" style="height:230px;">
        <div class="form-check">
			<input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios1" value="option1" checked>
			<label class="form-check-label" for="exampleRadios1">
			  미술전
			</label>
		</div>
		<div class="form-check">
			<input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios2" value="option2">
			<label class="form-check-label" for="exampleRadios2">
			  사진전
			</label>
		</div>
		<div class="form-check">
			<input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios2" value="option2">
			<label class="form-check-label" for="exampleRadios2">
			  테마전
			</label>
		</div>
		<div class="form-group">
			<label for="exampleSelect1" class="form-label">지역</label>
		      <select class="form-select" id="exampleSelect1">
		        <option>서울</option>
		        <option>경기</option>
		        <option>부산</option>
		        <option>대구</option>
		      </select>
		</div>
		
		<div class="form-mon">
			<div class="form-group month">
				<label for="exampleSelect1" class="form-label">시작하는 달</label>
			      <select class="form-select" id="exampleSelect1">
			        <option>1월</option>
			        <option>2월</option>
			        <option>3월</option>
			        <option>4월</option>
			        <option>5월</option>
			        <option>6월</option>
			        <option>7월</option>
			        <option>8월</option>
			        <option>9월</option>
			        <option>10월</option>
			        <option>11월</option>
			        <option>12월</option>
			      </select>
			</div>
			<div class="form-group month m-left">
				<label for="exampleSelect1" class="form-label">~ 종료하는 달</label>
			      <select class="form-select" id="exampleSelect1">
			        <option>1월</option>
			        <option>2월</option>
			        <option>3월</option>
			        <option>4월</option>
			        <option>5월</option>
			        <option>6월</option>
			        <option>7월</option>
			        <option>8월</option>
			        <option>9월</option>
			        <option>10월</option>
			        <option>11월</option>
			        <option>12월</option>
			      </select>
			</div>
		</div>
		<button type="button" class="btn btn-primary btn-lg s-btn">검색하기</button>
		

        </ol>
        
        <!-- 검색결과 -->
        <div class="row">
            <div class="col-lg-3 col-md-4 col-sm-6 mb-4">
                <div class="card h-100">
                    <a href="#!"><img class="card-img-top" src="https://via.placeholder.com/700x400" alt="..." /></a>
                    <div class="card-body">
                        <h4 class="card-title"><a href="#!">Project One</a></h4>
                        <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet numquam aspernatur eum quasi sapiente nesciunt? Voluptatibus sit, repellat sequi itaque deserunt, dolores in, nesciunt, illum tempora ex quae? Nihil, dolorem!</p>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-4 col-sm-6 mb-4">
                <div class="card h-100">
                    <a href="#!"><img class="card-img-top" src="https://via.placeholder.com/700x400" alt="..." /></a>
                    <div class="card-body">
                        <h4 class="card-title"><a href="#!">Project Two</a></h4>
                        <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra euismod odio, gravida pellentesque urna varius vitae.</p>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-4 col-sm-6 mb-4">
                <div class="card h-100">
                    <a href="#!"><img class="card-img-top" src="https://via.placeholder.com/700x400" alt="..." /></a>
                    <div class="card-body">
                        <h4 class="card-title"><a href="#!">Project Three</a></h4>
                        <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quos quisquam, error quod sed cumque, odio distinctio velit nostrum temporibus necessitatibus et facere atque iure perspiciatis mollitia recusandae vero vel quam!</p>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-4 col-sm-6 mb-4">
                <div class="card h-100">
                    <a href="#!"><img class="card-img-top" src="https://via.placeholder.com/700x400" alt="..." /></a>
                    <div class="card-body">
                        <h4 class="card-title"><a href="#!">Project Four</a></h4>
                        <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra euismod odio, gravida pellentesque urna varius vitae.</p>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-4 col-sm-6 mb-4">
                <div class="card h-100">
                    <a href="#!"><img class="card-img-top" src="https://via.placeholder.com/700x400" alt="..." /></a>
                    <div class="card-body">
                        <h4 class="card-title"><a href="#!">Project Five</a></h4>
                        <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra euismod odio, gravida pellentesque urna varius vitae.</p>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-4 col-sm-6 mb-4">
                <div class="card h-100">
                    <a href="#!"><img class="card-img-top" src="https://via.placeholder.com/700x400" alt="..." /></a>
                    <div class="card-body">
                        <h4 class="card-title"><a href="#!">Project Six</a></h4>
                        <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Itaque earum nostrum suscipit ducimus nihil provident, perferendis rem illo, voluptate atque, sit eius in voluptates, nemo repellat fugiat excepturi! Nemo, esse.</p>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-4 col-sm-6 mb-4">
                <div class="card h-100">
                    <a href="#!"><img class="card-img-top" src="https://via.placeholder.com/700x400" alt="..." /></a>
                    <div class="card-body">
                        <h4 class="card-title"><a href="#!">Project Seven</a></h4>
                        <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra euismod odio, gravida pellentesque urna varius vitae.</p>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-4 col-sm-6 mb-4">
                <div class="card h-100">
                    <a href="#!"><img class="card-img-top" src="https://via.placeholder.com/700x400" alt="..." /></a>
                    <div class="card-body">
                        <h4 class="card-title"><a href="#!">Project Eight</a></h4>
                        <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eius adipisci dicta dignissimos neque animi ea, veritatis, provident hic consequatur ut esse! Commodi ea consequatur accusantium, beatae qui deserunt tenetur ipsa.</p>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- 페이징 -->
        <ul class="pagination justify-content-center">
            <li class="page-item">
                <a class="page-link" href="#" aria-label="Previous">
                    <span aria-hidden="true">«</span>
                    <span class="sr-only">Previous</span>
                </a>
            </li>
            <li class="page-item"><a class="page-link" href="#!">1</a></li>
            <li class="page-item"><a class="page-link" href="#!">2</a></li>
            <li class="page-item"><a class="page-link" href="#!">3</a></li>
            <li class="page-item">
                <a class="page-link" href="#" aria-label="Next">
                    <span aria-hidden="true">»</span>
                    <span class="sr-only">Next</span>
                </a>
            </li>
        </ul>
    </div>
</section>

<!-- Footer-->
<footer class="py-5 bg-blight">
    <jsp:include page="../a_nav/footer.jsp">
		<jsp:param name="" value="" />
	</jsp:include>
</footer>

</body>
</html>