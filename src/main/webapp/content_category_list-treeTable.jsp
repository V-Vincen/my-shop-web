<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html>
<head>
    <title>My-Shop | Context List</title>

    <jsp:include page="/includes/header.jsp" />
    <!-- jquery-treeTable-1.4.2 -->
    <link rel="stylesheet" href="/static/assets/plugins/jquery-treeTable/themes/vsStyle/treeTable.min.css" />


    <style>
        th {
            text-align: center;
        }
        label.col-xs-3.control-label {
            margin: 3px;
        }
    </style>

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
                <li class="active">Content List</li>
            </ol>
        </section>


        <!-- Main content -->
        <section class="content">
            <c:if test="${baseResult != null}">
                <div class="alert alert-${baseResult.status == 200 ? "success" : "danger"} alert-dismissible">
                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                    <h5>${baseResult.message} !</h5>
                </div>
            </c:if>
            <!-- /.row -->

            <div class="box box-info">
                <div class="box-header with-border text-center">
                    <h3 class="box-title">Content List</h3>
                </div>
                <%--<div class="box-tools">
                    <div class="row" style="padding: 10px">
                        <div class="col-xs-6">
                            <button type="button" class="btn bg-purple-active color-palette btn-sm pull-right" id="expandAll" style="width: 120px;"><i class="fa fa-expand"></i>&nbsp; Expand All</button>
                        </div>
                        <div class="col-xs-6">
                            <button type="button" class="btn bg-purple-active color-palette btn-sm" id="collapseAll" style="width: 120px;"><i class="fa fa-compress"></i>&nbsp; Collapse All</button>
                        </div>
                    </div>
                </div>--%>

                <div class="box-body table-responsive " style="overflow-x:hidden">
                    <div class="row">
                        <div class="col-sm-12">
                            <!-- /.box-header -->
                            <table class="table table-hover" id="treeTable">
                                <thead>
                                <tr>
                                    <%--<th><input type="checkbox" class="minimal icheck_master"/></th>--%>
                                    <th>ID</th>
                                    <th>Name</th>
                                    <th>SotrOrder</th>
                                    <th>Operation</th>
                                </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${tbContentCategories}" var="tbContentCategory">
                                        <tr id="${tbContentCategory.id}" pId="${tbContentCategory.parentId}">
                                            <td class="text-center">${tbContentCategory.id}</td>
                                            <td style="padding-left: 180px;">${tbContentCategory.name}</td>
                                            <td class="text-center">${tbContentCategory.sortOrder}</td>
                                            <td class="text-center">
                                                <a href="#" class="btn btn-primary btn-sm" style="width: 100px;">
                                                    <i class="fa fa-edit"></i>&nbsp; Edit
                                                </a>
                                                <button type="button" class="btn btn-danger btn-sm" style="width: 100px;">
                                                    <i class="fa fa-trash-o"></i>&nbsp; Delete
                                                </button>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                        <!-- /.box-body -->
                    </div>
                </div>
            </div>
            <!-- /.box -->
            <%--  </div>
          </div>--%>
        </section>
        <!-- /.context -->
    </div>

    <jsp:include page="/includes/copyright.jsp" />

    <div class="modal modal-info fade" id="modal-info-showDetail">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">Info</h4>
                </div>
                <div class="modal-body" id="modalShowDetail">
                    <div class="form-horizontal">
                        <div class="form-group">
                            <label for="modalUsernamre" class="col-sm-offset-2 col-sm-2 control-label">Usernamre</label>

                            <div class="col-sm-6">
                                <input type="text" class="form-control" id="modalUsernamre" placeholder="usernamre" readonly>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="modalEmail" class="col-sm-offset-2 col-sm-2 control-label">Email:</label>

                            <div class="col-sm-6">
                                <input type="text" class="form-control" id="modalEmail" placeholder="Email" readonly>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="modalPhone" class="col-sm-offset-2 col-sm-2 control-label">Phone:</label>

                            <div class="col-sm-6">
                                <input type="text" class="form-control" id="modalPhone" placeholder="Phone" readonly>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="modalUpdated" class="col-sm-offset-2 col-sm-2 control-label">Updated:</label>

                            <div class="col-sm-6">
                                <input type="text" class="form-control" id="modalUpdated" placeholder="Updated" readonly>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="modalCreated" class="col-sm-offset-2 col-sm-2 control-label">Created:</label>

                            <div class="col-sm-6">
                                <input type="text" class="form-control" id="modalCreated" placeholder="Created" readonly>
                            </div>
                        </div>
                    </div>


                </div>
                <div class="modal-footer">
                    <%--<button type="button" class="btn btn-outline pull-left" data-dismiss="modal">Close</button>--%>
                    <button type="button" class="btn btn-outline" data-dismiss="modal">OK</button>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <!-- /.modal -->

</div>

<jsp:include page="/includes/footer.jsp" />

<!-- jquery-treeTable-1.4.2 -->
<script src="/static/assets/plugins/jquery-treeTable/jquery.treeTable.min.js"></script>


<script type="text/javascript">

$(function () {

    $("#treeTable").treeTable({
        expandLevel: 2,
        column: 1
    });

    /**
     * @Method:
     * @Description:   查看详情
     * @Param:
     * @return:
     * @Author:        Mr.Vincent
     * @Date:          2019/5/7
     */
    // $("#treeTable").on("click","#showDetail",function () {
    //     var param = $(this).val();
    //     $.ajax({
    //         url: "/user/showDetail",
    //         type: "post",
    //         data: {id: param},
    //         dataType: "json",
    //         success: function (data) {
    //             $("#modalUsernamre").val(data.username);
    //             $("#modalEmail").val(data.email);
    //             $("#modalPhone").val(data.phone);
    //             $("#modalUpdated").val(App.getFormatDateTime(new Date(data.updated)));
    //             $("#modalCreated").val(App.getFormatDateTime(new Date(data.created)));
    //             $("#modal-info-showDetail").modal("show");
    //         }
    //     })
    // });

});
</script>

</body>
</html>