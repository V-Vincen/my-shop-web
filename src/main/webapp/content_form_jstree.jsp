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
                        <div id="jstree">

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

<!-- jsTree - v3.3.8 -->
<link rel="stylesheet" href="/static/assets/plugins/jstree/dist/themes/default/style.min.css" />
<script src="/static/assets/plugins/jstree/dist/jstree.min.js"></script>

<script>
    $(function() {
        $("#jstree").jstree({
            "core": {
                "multiple": false,//没有多选
                "themes": {
                    "responsive": false,
                    "name": false,//
                    "icons": true,//显示节点图标
                    "dots": true,//显示连接点
                    "stripes": true,
                    //"variant":true
                },
                // so that create works
                "check_callback": true,
                'data': function (obj, callback) {
                    var jsonstr = "[]";
                    var jsonarray = eval('(' + jsonstr + ')');
                    $.ajax({
                        type: "GET",
                        url: "/content/category/jstree/data",
                        dataType: "json",
                        async: false,
                        success: function (result) {
                            var arrays = result;
                            for (var i = 0; i < arrays.length; i++) {
                                //console.log(arrays[i].id)
                                var arr = {
                                    "id": arrays[i].id,
                                    "parent": arrays[i].parentId == 0 ? "#" : arrays[i].parentId,
                                    "text": arrays[i].name
                                }
                                jsonarray.push(arr);
                            }
                        }

                    });
                    callback.call(this, jsonarray);
                }
            },
            //types:可以为节点添加“类型”，这意味着可以轻松控制节点组的嵌套规则和图标，而不是单独控制。
            "types": {
                "default": {
                    "icon": "/static/assets/plugins/jstree/dist/themes/tree_icon.png"
                },
                "file": {
                    "icon": "glyphicon glyphicon-file"
                },
                "demo" : {
                    "icon" : "glyphicon glyphicon-ok"
                }
            },
            //"state": {"key": "state_demo"},//如果你在同一个域中有多个树，则密钥很重要和"plugins" : ["state"]连用
            //dnd:拖放重新排列
            //state:在用户的浏览器中保存所有打开和选定的节点，因此当返回到同一个树时，将恢复先前的状态。
            //"plugins": ["dnd", "state", "types", "checkbox", "wholerow"]
            "plugins": ["types"/*,"wholerow"*/]
        });
    });

    $("#title").val('');

    var title ;

    $('#jstree').on("select_node.jstree", function (e, data) {
        $('#jstree').jstree();

        if (data.node != undefined) {
            title = data.node.text;
        }
    });
    $("#btn-primary").click(function () {
        if(title != null){
            $("#title").val(title);
            $("#modal-default").modal('hide');
        }else {
            alert("Select Title !!!")
        }
    })

    // $(function() {
    //     $('#jstree').jstree({
    //         'core' : {
    //             "multiple": false,//没有多选
    //             "themes": {
    //                 "responsive": false,
    //                 "name": false,//
    //                 "icons": true,//显示节点图标
    //                 "dots": true,//显示连接点
    //                 "stripes": true,
    //                 //"variant":true
    //             },
    //             'data' : {
    //                 // 'url' : function(node) {
    //                 //     return '/content/category/jstree/data/id?lazy';
    //                 // },
    //                 "url" : "/content/category/jstree/data/id?lazy",
    //                 "data" : function(node) {
    //                     return { "id" : node.id };
    //
    //                 }
    //             },
    //             "types": {
    //                 "default": {
    //                     "icon": "/static/assets/plugins/jstree/dist/themes/tree_icon.png"
    //                 },
    //                 "file": {
    //                     "icon": "glyphicon glyphicon-file"
    //                 }
    //             },
    //             "state": {"key": "demo2"},
    //             //dnd:拖放重新排列
    //             //state:在用户的浏览器中保存所有打开和选定的节点，因此当返回到同一个树时，将恢复先前的状态。
    //             //"plugins": ["dnd", "state", "types", "checkbox", "wholerow"]
    //             "plugins": ["types"/*,"wholerow"*/]
    //         }
    //     });
    // });

</script>



</body>
</html>