<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <title>My-Shop | Control Panel</title>

    <jsp:include page="/includes/header.jsp" />

</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

    <jsp:include page="/includes/nav.jsp" />
    <jsp:include page="/includes/menu.jsp" />

    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
                Control panel
                <small></small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                <li class="active">User Management</li>
            </ol>
        </section>

        <!-- Main content -->
        <section class="content">

        </section>
        <!-- /.context -->
    </div>

    <jsp:include page="/includes/copyright.jsp" />

</div>

<jsp:include page="/includes/footer.jsp" />

</body>
</html>