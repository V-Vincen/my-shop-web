<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <title>My-Shop | User ${tbUser.id == null ? "Add New" : "Eidt"}</title>

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
                User Management
                <small>Control panel</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                <li><a href="#">User Management</a></li>
                <li class="active">User ${tbUser.id == null ? "Add New" : "Eidt"}</li>
            </ol>
        </section>

        <!-- Main content -->
        <section class="content">
            <div class="row">
                <div class="col-xs-12">
                    <!-- Horizontal Form -->
                    <div class="box box-info">
                        <div class="box-header with-border text-center">
                            <h3 class="box-title">${tbUser.id == null ? "Add New" : "Eidt"}</h3>
                        </div>
                        <!-- /.box-header -->
                        <!-- form start -->
                        <form id="inputForm" Class="form-horizontal" action="/user/save" method="post" >
                            <input type="hidden" id="id" name="id"/>
                            <div class="box-body">
                                <div class="form-group">
                                    <%--<label for="email" class="col-sm-3 control-label">Email</label>--%>
                                    <label for="email" class="col-sm-3 control-label">Email</label>

                                    <div class="col-sm-6">
                                        <%--<form:input path="email" cssClass="form-control required email" placeholder="Enter email" />--%>
                                        <input type="text" class="form-control" id="email" name="email" placeholder="Enter email">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <%--<label for="password" class="col-sm-3 control-label">Password</label>--%>
                                    <label for="password" class="col-sm-3 control-label">Password</label>

                                    <div class="col-sm-6">
                                        <%--<form:password path="password" cssClass="form-control required" placeholder="Enter password" />--%>
                                        <input type="password" class="form-control" id="password" name="password" placeholder="Enter password">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <%--<label for="username" class="col-sm-3 control-label">Username</label>--%>
                                    <label for="username" class="col-sm-3 control-label">Username</label>

                                    <div class="col-sm-6">
                                        <%--<form:input path="username" cssClass="form-control required" placeholder="Enter username" />--%>
                                        <input type="text" class="form-control" id="username" name="username" placeholder="Enter username">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="phone" class="col-sm-3 control-label">Phone</label>
                                    <%--<label for="inputPhone" class="col-sm-3 control-label">Phone</label>--%>

                                    <div class="col-sm-6">
                                        <%--<form:input path="phone" cssClass="form-control required mobile" placeholder="Enter phone" />--%>
                                        <input type="text" class="form-control" id="phone" name="phone" placeholder="Enter phone">
                                    </div>
                                </div>
                                <c:if test="${baseResult != null}">
                                    <div class="col-sm-6 col-sm-offset-3">
                                        <div class="alert alert-${baseResult.status == 200 ? "success" : "danger"} alert-dismissible">
                                            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                                            <h5>${baseResult.message} !</h5>
                                        </div>
                                    </div>
                                </c:if>
                            </div>
                            <!-- /.box-body -->
                            <div class="box-footer">
                                <button type="button" class="btn btn-default btn-sm" onclick="history.go(-1)">&nbsp; Back &nbsp;</button>
                                <button type="submit" class="btn btn-info btn-sm pull-right">Submit</button>
                            </div>
                            <!-- /.box-footer -->

                        </form>
                    </div>
                    <!-- /.box -->
                </div>
            </div>
        </section>
        <!-- /.context -->
    </div>

    <jsp:include page="/includes/copyright.jsp" />

    <!-- Add the sidebar's background. This div must be placed
         immediately after the control sidebar -->
    <div class="control-sidebar-bg"></div>

</div>

<jsp:include page="/includes/footer.jsp" />

</body>
</html>