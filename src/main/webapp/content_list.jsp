<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <title>My-Shop | Content List</title>

    <jsp:include page="/includes/header.jsp" />

    <style>
        th {
            text-align: center;
        }
        .box-tools {
            padding: 10px;
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
            <%--<div class="row">
                <div class="col-xs-12">--%>
                    <div class="box box-info">
                        <div class="box-header with-border text-center">
                            <h3 class="box-title">Content List</h3>
                        </div>
                        <div class="box-tools">
                            <div class="row" style="padding: 10px">
                                <div class="col-xs-2">
                                    <a href="/content/form" type="button" class="btn btn-success btn-sm" style="width: 120px;"><i class="fa fa-plus"></i>&nbsp Add New</a>
                                </div>
                                <div class="col-xs-2">
                                    <button type="button" class="btn btn-danger btn-sm" id ="deleteMulti" onclick="App.deleteMulti('/user/deleteMulti');" style="width: 120px;"><i class="fa fa-remove"></i>&nbsp Delete All</button>
                                </div>
                                <div class="col-xs-2">
                                    <a type="button" class="btn btn-warning btn-sm" style="width: 120px;"><i class="fa fa-download"></i>&nbsp Import</a>
                                </div>
                                <div class="col-xs-2">
                                    <a type="button" class="btn bg-teal-active color-palette btn-sm" style="width: 120px;"><i class="fa fa-upload"></i>&nbsp Export</a>
                                </div>
                                <div class="col-xs-4">
                                        <div class="input-group input-group-sm pull-right" style="width: 200px;">
                                            <input type="text" name="keyword" class="form-control " placeholder="Search" id="fuzzy-search">
                                            <div class="input-group-btn">
                                                <button type="button" class="btn btn-default btn-sm" id="btn-simple-search" ><i class="fa fa-search"></i></button>
                                                <button type="button" class="btn btn-default btn-sm" title="Advanced-Search" id="toggle-advanced-search">
                                                    <i class="fa fa-angle-double-down"></i>
                                                </button>
                                            </div>
                                        </div>
                                </div>
                            </div>

                            <div class="row" style="display:none;margin: 10px" id="div-advanced-search">
                                <div class="form-inline well no-margin">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label for="title-search" class="col-xs-3 control-label">Title</label>

                                            <div class="col-xs-8">
                                                <input id="title-search" cssClass="form-control" placeholder=" Enter Title" />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="subTitle-search" class="col-xs-3 control-label">SubTitle</label>

                                            <div class="col-xs-8">
                                                <input id="subTitle-search" cssClass="form-control" placeholder=" Enter SubTitle" />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="titleDesc-search" class="col-xs-3 control-label">TitleDesc</label>

                                            <div class="col-xs-8">
                                                <input id="titleDesc-search" cssClass="form-control" placeholder=" Enter TitleDesc" />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-sm-6 col-sm-offset-6">
                                                <button type="button" class="btn btn-default btn-sm" id="btn-advanced-search" ><i class="fa fa-search"></i> Search</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <div class="box-body table-responsive " style="overflow-x:hidden"  >
                        <div class="row">
                            <div class="col-sm-12">
                        <!-- /.box-header -->
                            <table class="table table-hover text-center" id="table_content">
                                <thead>
                                    <tr>
                                        <th><input type="checkbox" class="minimal icheck_master" /></th>
                                        <th>ID</th>
                                        <th>Title</th>
                                        <th>SubTitle</th>
                                        <th>TitleDesc</th>
                                        <th>Url</th>
                                        <th>Pic</th>
                                        <th>Pic2</th>
                                        <th>Updated</th>
                                        <th>Content</th>
                                        <th>Operation</th>
                                    </tr>
                                </thead>
                                <tbody>

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

<script src="/static/assets/app/constant.js"></script>
<script src="/static/assets/app/content.js"></script>

<script type="text/javascript">

$(function () {

    /**
     * @Method:
     * @Description:    模糊查询
     * @Param:
     * @return:
     * @Author:        Mr.Vincent
     * @Date:          2019/5/7
     */
    $("#simple-search").click(function () {
        var likeSearch = $("#likeSearch").val();
        var param = {
            "likeSearch": likeSearch
        }
        _dataTable.settings()[0].ajax.data = param;
        _dataTable.ajax.reload();
    });

    /**
     * @Method:
     * @Description:    高级查询
     * @Param:
     * @return:
     * @Author:        Mr.Vincent
     * @Date:          2019/5/7
     */
    $("#advanced-search").click(function () {
        debugger
        var username = $("#username").val();
        var phone = $("#phone").val();
        var email = $("#email").val();
        var param = {
            "username": username,
            "phone": phone,
            "email": email
        }
        _dataTable.settings()[0].ajax.data = param;
        _dataTable.ajax.reload();
    });

    /**
     * @Method:
     * @Description:   查看详情
     * @Param:
     * @return:
     * @Author:        Mr.Vincent
     * @Date:          2019/5/7
     */
    $("#table_id_example").on("click","#showDetail",function () {
        var param = $(this).val();
        $.ajax({
            url: "/user/showDetail",
            type: "post",
            data: {id: param},
            dataType: "json",
            success: function (data) {
                $("#modalUsernamre").val(data.username);
                $("#modalEmail").val(data.email);
                $("#modalPhone").val(data.phone);
                $("#modalUpdated").val(App.getFormatDateTime(new Date(data.updated)));
                $("#modalCreated").val(App.getFormatDateTime(new Date(data.created)));
                $("#modal-info-showDetail").modal("show");
            }
        })
    });

});



function searchBtn3(id) {
    alert(id);
}

</script>

</body>
</html>