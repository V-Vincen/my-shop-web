<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <title>My-Shop | Content ${tbContent.id == null ? "Add New" : "Eidt"}</title>

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
                Content Management
                <small>Control panel</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                <li><a href="#">Content Management</a></li>
                <li class="active">Content ${tbContent.id == null ? "Add New" : "Eidt"}</li>
            </ol>
        </section>

        <!-- Main content -->
        <section class="content">
            <div class="row">
                <div class="col-xs-12">
                    <!-- Horizontal Form -->
                    <div class="box box-info">
                        <div class="box-header with-border text-center">
                            <h3 class="box-title">${tbContent.id == null ? "Add New" : "Eidt"}</h3>
                        </div>
                        <!-- /.box-header -->
                        <!-- form start -->
                        <form:form id="inputForm" cssClass="form-horizontal" action="/Content/save" method="post" modelAttribute="tbContent">
                            <form:hidden path="id"/>
                            <div class="box-body">
                                <div class="form-group">
                                    <label for="title" class="col-sm-3 control-label">Title</label>

                                    <div class="col-sm-6">
                                        <input type="text" class="form-control required"  id="title" name="title" placeholder="Select Title" readonly="true" data-toggle="modal" data-target="#modal-default"/>
                                        <%--<form:input path="title" cssClass="form-control required" placeholder="Select Title" readonly="true" data-toggle="modal" data-target="#modal-default"/>--%>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="" class="col-sm-3 control-label">Password</label>
                                    <%--<label for="inputPassword3" class="col-sm-3 control-label">Password</label>--%>

                                    <div class="col-sm-6">
                                        <form:password path="" cssClass="form-control required" placeholder="Enter password" />
                                        <%--<input type="password" class="form-control" id="inputPassword3" name="password" placeholder="Enter password">--%>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="" class="col-sm-3 control-label">Contentname</label>
                                    <%--<label for="inputContentname" class="col-sm-3 control-label">Contentname</label>--%>

                                    <div class="col-sm-6">
                                        <form:input path="" cssClass="form-control required" placeholder="Enter Contentname" />
                                        <%--<input type="text" class="form-control" id="inputContentname" name="Contentname" placeholder="Enter Contentname">--%>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="" class="col-sm-3 control-label">Phone</label>
                                    <%--<label for="inputPhone" class="col-sm-3 control-label">Phone</label>--%>

                                    <div class="col-sm-6">
                                        <form:input path="" cssClass="form-control required mobile" placeholder="Enter phone" />
                                        <%--<input type="text" class="form-control" id="inputPhone" name="phone" placeholder="Enter phone">--%>
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

                        </form:form>
                    </div>
                    <!-- /.box -->
                </div>
            </div>
        </section>
        <!-- /.context -->
    </div>

    <jsp:include page="/includes/copyright.jsp" />

        <div class="modal fade" id="modal-default">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">×</span></button>
                        <h4 class="modal-title">Default Modal</h4>
                    </div>
                    <div class="modal-body">
                        <div>
                            <ul id="zTree" class="ztree"></ul>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Close</button>
                            <button type="button" class="btn btn-primary" id="btn-primary">Save changes</button>
                        </div>
                    </div>
                    <!-- /.modal-content -->
                </div>
                <!-- /.modal-dialog -->
            </div>

</div>

<jsp:include page="/includes/footer.jsp" />

<!-- JQuery zTree core v3.5.40 -->
<link rel="stylesheet" href="/static/assets/plugins/zTree_v3-3.5.40/css/zTreeStyle/zTreeStyle.css" />
<script src="/static/assets/plugins/zTree_v3-3.5.40/js/jquery.ztree.core.min.js"></script>

<script>

$(function (){
    var setting = {
        view: {
            // 禁止多选
            selectedMulti: false
        },
        async: {
            // 开启异步加载功能
            enable: true,
            // 远程访问地址
            url: "/content/category/ztree/data",
            // 选择父节点时会自动将节点中的参数传回服务器再重新取结果
            autoParam: ["id"]
        }
    };

    // 初始化 zTree 控件
    $.fn.zTree.init($("#zTree"), setting);
    // 绑定事件
    $("#btn-primary").bind("click", function () {
        // 获取 zTree 控件
        var zTree = $.fn.zTree.getZTreeObj("zTree");
        // 获取已选中的节点
        var nodes = zTree.getSelectedNodes();
        if (nodes.length == 0) {
            alert("Select Title !!!");
        }

        else {
            var node = nodes[0];

            $("#title").val(node.id);
            $("#modal-default").modal('hide');
        }
    });

})

</script>


</body>
</html>