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
            	<jsp:include page="../exhibit/exhead.jsp">
					<jsp:param name="" value="" />
				</jsp:include>
                        <!-- map -->
                        
                        <img src="https://www.ngii.go.kr/images/kor/business/img_internet_map.jpg">
                        
                        <!-- map -->
                        <hr/>
<!-- Navigator -->
	<jsp:include page="../exhibit/exsearch.jsp">
		<jsp:param name="" value="" />
	</jsp:include>                        
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