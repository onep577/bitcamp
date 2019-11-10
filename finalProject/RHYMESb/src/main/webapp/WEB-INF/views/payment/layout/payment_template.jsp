<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>



<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>RHYMESb</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- payment.css -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/payment/coupon_popup.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/payment/payment.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/payment/paymentAf.css">


</head>
<body>

	<tiles:insertAttribute name="header" />
	<!--  /WEB-INF/views/common/layout/header.jsp -->

	<div id="body_wrap">
		<div id="middle_wrap">
			<div id="content_wrap">
				<tiles:insertAttribute name="body" />
				<!-- body -->
			</div>
		</div>
		<div id="footer_wrap">
			<tiles:insertAttribute name="footer" />
			<!-- /WEB-INF/views/common/layout/footer.jsp -->
		</div>

	</div>


</body>
</html>