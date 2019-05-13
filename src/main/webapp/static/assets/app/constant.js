/*常量*/
var CONSTANT = {
    DATA_TABLES: {
        DEFAULT_OPTION: { //DataTables初始化选项
            // language: {
            //     "sProcessing": "处理中...",
            //     "sLengthMenu": "每页 _MENU_ 项",
            //     "sZeroRecords": "没有匹配结果",
            //     "sInfo": "当前显示第 _START_ 至 _END_ 项，共 _TOTAL_ 项。",
            //     "sInfoEmpty": "当前显示第 0 至 0 项，共 0 项",
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
            //         "sLast": "末页",
            //         "sJump": "跳转"
            //     },
            //     "oAria": {
            //         "sSortAscending": ": 以升序排列此列",
            //         "sSortDescending": ": 以降序排列此列"
            //     }
            // },
            autoWidth: true,    //启用自动调整列宽
            info: true,
            lengthChange: true,
            ordering: false,    //取消默认排序查询,否则复选框一列会出现小箭头
            paging: true,
            processing: true,   //显示加载提示,自行处理
            scrollX: false,
            searching: false,   //禁用原生搜索
            serverSide: true,   //启用服务器端分页
            deferRender: true
        },
        COLUMN: {
            CHECKBOX: { //复选框单元格
                //className: "td-checkbox",
                //orderable: false,
                //width: "30px",
                data: null,
                render: function (data, type, row, meta) {
                    return '<input id="' + data.id + '" type="checkbox" class="minimal" />';
                }
            }
        },
        RENDER: {   //常用render可以抽取出来，如日期时间、头像等
            ELLIPSIS: function (data, type, row, meta) {
                //data = data||"";
                if (data) {
                    if (data.length > 50) {
                        return '<span title="' + data + '">' + data.substr(0, 25) + '...</span>';
                    }else{
                        return data;
                    }
                }else {
                    return "";
                }
            }
        }
    }
};