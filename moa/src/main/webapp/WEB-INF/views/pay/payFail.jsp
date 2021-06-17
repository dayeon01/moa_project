<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html lang="ko"><head>
	<jsp:include page="../a_nav/head.jsp">
		<jsp:param name="" value="" />
		</jsp:include>
</head>	
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/moa/css/w3.css">
<link rel="stylesheet" type="text/css" href="/moa/css/user2.css">
<script type="text/javascript" src="/moa/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/moa/js/w3color.js"></script>

<style type="text/css">
 #modal.modal-overlay {
            width: 100%;
            height: 100%;
            left: 0;
            top: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            background: rgba(255, 255, 255, 0.25);
            backdrop-filter: blur(1.5px);
            -webkit-backdrop-filter: blur(1.5px);
            border-radius: 10px;
            border: 1px solid rgba(255, 255, 255, 0.18);
        }
        #modal .modal-window {
            background: rgba( 69, 139, 197, 0.70 );
            box-shadow: 0 8px 32px 0 rgba( 31, 38, 135, 0.37 );
            backdrop-filter: blur( 13.5px );
            -webkit-backdrop-filter: blur( 13.5px );
            border-radius: 10px;
            border: 1px solid rgba( 255, 255, 255, 0.18 );
            width: 400px;
            height: 500px;
            top: -100px;
            padding: 10px;
        }
        #modal .title {
            padding-left: 10px;
            display: inline;
            text-shadow: 1px 1px 2px gray;
            color: white;
            
        }
        #modal .title h2 {
            display: inline;
        }
        #modal .close-area {
            display: inline;
            text-shadow: 1px 1px 2px gray;
            color: white;
        }
        
        #modal .content {
            margin-top: 60px;
            padding: 0px 10px;
            text-shadow: 1px 1px 2px gray;
            color: white;
        }
.mgb40 {
	margin-bottom: 40px;
}

.countDown {
	font-size: 50px;
	text-align: center;
	}


</style>
<script type="text/javascript">
		$(document).ready(function(){
		       
			var n = 3;            
		    function countDown(){   
		        n--;                 
		        $('.countDown').text(n); 
			}
		    setInterval(countDown,1000);
		    
		    
		    var move = function() {
		    	 location.href="/moa/main.moa";  
		    }

		    setTimeout(move, 3000);	    
			
		});
</script>
</head>
<body>
	<div class="w3-content mxw900 ">
		<div class="w3-content mxw900 ">
	   	</div>	 
   		<div class="w3-content w3-margin w3-center modal-overlay " id="modal">
		<div class="w3-content modal-window ">
			<div class="title ">
				<h2 class="w3-col w3-margin-bottom">결제실패</h2>
			</div>
			<div class="close-area" >
				<div class="w3-col pdAll30 content">
					결제가 취소되었습니다.</br>
					<small>메인화면으로 이동합니다.</small>
				</div>
				<p class="countDown">3</p> 
			</div>
		</div>	
		</div>
	</div>	

	
	
</body>
</html>