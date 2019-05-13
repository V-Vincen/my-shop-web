var App = function () {

    var _masterCheckbox;
    var _checkbox;
    var _dataTable;

    /**
     * @Method:
     * @Description:    私有方法，初始化 iCheck
     * @Param:
     * @return:
     * @Author:        Mr.Vincent
     * @Date:          2019/5/3
     */
    var handlerInitCheckbox = function () {
        $('input[type="checkbox"].minimal, input[type="radio"].minimal').iCheck({
            checkboxClass: 'icheckbox_minimal-blue',
            radioClass: 'iradio_minimal-blue'
        });

        //获取控制的 Checkbox
        _masterCheckbox = $('input[type="checkbox"].minimal.icheck_master');
        //获取全部 Checkbox 集合 
        _checkbox = $('input[type="checkbox"].minimal');
    };

    /**
     * @Method:
     * @Description:    Checkbox的全选功能
     * @Param:
     * @return:
     * @Author:        Mr.Vincent
     * @Date:          2019/5/3
     */
    var handlerCheckboxAll = function () {
        _masterCheckbox.on("ifClicked", function (event) {
            //返回 true 表示未选择
            if (event.target.checked) {
                _checkbox.iCheck("uncheck");
            }
            //选中状态
            else {
                _checkbox.iCheck("check");
            }
        })
    };

    /**
     * @Method:
     * @Description:   初始化DataTables
     * @Param:
     * @return:
     * @Author:        Mr.Vincent
     * @Date:          2019/5/6
     */
    var handlerInitDataTables = function (url, columns) {
        <!-- 初始化Datatables-->
        _dataTable = $('#table_id_example').DataTable({
            "autoWidth": true,
            "info": true,
            "lengthChange": true,
            "ordering": false,
            "paging": true,
            "processing": true,
            "scrollX": false,
            "searching": false,
            "serverSide": true,
            "deferRender": true,
            "ajax": {
                "url": url
            },
            "columns": columns,
            // "language": {
            //     "sProcessing": "处理中...",
            //     "sLengthMenu": "显示 _MENU_ 项结果",
            //     "sZeroRecords": "没有匹配结果",
            //     "sInfo": "显示第 _START_ 至 _END_ 项结果，共 _TOTAL_ 项",
            //     "sInfoEmpty": "显示第 0 至 0 项结果，共 0 项",
            //     "sInfoFiltered": "(由 _MAX_ 项结果过滤)",
            //     "sInfoPostFix": "",
            //     "sSearch": "搜索:",
            //     "sUrl": "",
            //     "sEmptyTable": "表中数据为空",
            //     "sLoadingRecords": "载入中...",
            //     "sInfoThousands": ",",
            //     "oPaginate": {
            //         "sFirst": "首页",
            //         "sPrevious": "上页",
            //         "sNext": "下页",
            //         "sLast": "末页"
            //     },
            //     "oAria": {
            //         "sSortAscending": ": 以升序排列此列",
            //         "sSortDescending": ": 以降序排列此列"
            //     }
            // },
            "drawCallback": function (settings, json) {
                handlerInitCheckbox();
                handlerCheckboxAll();
            }
        });

        return _dataTable;

    }

    /**
     * @Method:
     * @Description:  批量查询
     * @Param:
     * @return:
     * @Author:        Mr.Vincent
     * @Date:          2019/5/7
     */
    var handlerDeleteMulti = function (url) {

        //定义一个存放 id 的数组
        var _idArray = new Array();

        //将选中的元素 id 放入数组中
        //var _checkbox = App.getCheckbox();
        _checkbox.each(function () {
            var _id = $(this).attr("id")
            if (_id != null && _id != "undefine" && $(this).is(":checked")) {
                // 判断是否选中
                _idArray.push(_id);
            }
        });

        if (_idArray.length === 0) {

            swal("First select the checkbox !");

        } else {
            swal({
                title: "Are you sure ?",
                text: "Once deleted, you will not be able to recover these data !",
                icon: "warning",
                buttons: ["Cancel", "Yes, delete it !"],
                dangerMode: true,
            })
                .then((willDelete) => {
                    if (willDelete) {
                        $.post(url, {ids: _idArray.toString()}, function (data) {
                            if (data.status == 200) {
                                swal("Deleted !",
                                    "Your " + data.message + " data have been deleted !", {
                                        icon: "success",
                                    });

                            } else {
                                swal("Deleted " + data.message + " !", "Something went wrong !", "error", {
                                    buttons: false,
                                    timer: 2000,
                                });
                            }
                            _dataTable.ajax.reload();
                        });
                    }
                });
        }

    };

    /**
     * @Method:
     * @Description:    根据id删除
     * @Param:
     * @return:
     * @Author:        Mr.Vincent
     * @Date:          2019/5/7
     */
    var handlerDeleteById = function (url, param) {
        swal({
            title: "Are you sure ?",
            text: "Once deleted, you will not be able to recover this data !",
            icon: "warning",
            buttons: ["Cancel", "Yes, delete it !"],
            dangerMode: true,
        })
            .then((willDelete) => {
                if (willDelete) {
                    $.post(url, {id: param}, function (data) {
                        if (data.status == 200) {
                            swal("Deleted !",
                                "Your data have been deleted !", {
                                    icon: "success",
                                });

                        } else {
                            swal("Deleted fail !", "Something went wrong !", "error", {
                                buttons: false,
                                timer: 2000,
                            });
                        }
                        _dataTable.ajax.reload();
                    });
                }
            });
    }

    return {
        init: function () {
            handlerInitCheckbox();
            handlerCheckboxAll();
        },

        deleteMulti: function (url) {
            handlerDeleteMulti(url);
        },

        deleteById: function (url, param) {
            handlerDeleteById(url, param)
        },

        initDataTables: function (url, columns) {
            return handlerInitDataTables(url, columns);
        }

    }


}();

$(document).ready(function () {
    App.init();

});