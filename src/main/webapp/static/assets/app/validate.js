/**
 * @Method:
 * @Description:    函数对象
 * @Param:
 * @return:
 * @Author:        Mr.Vincent
 * @Date:          2019/5/3
 */
var validate = function () {
    
    var handlerInit = function () {
        $.validator.addMethod("mobile", function(value, element) {
            var length = value.length;
            var mobile =  /^(((13[0-9]{1})|(15[0-9]{1}))+\d{8})$/;
            return this.optional(element) || (length == 11 && mobile.test(value));
        }, "手机号码格式错误");

        $("#inputForm").validate({
            errorElement: 'span',
            errorClass: 'help-block',

            errorPlacement: function (error, element) {
                element.parent().parent().attr("class", "form-group has-error");
                error.insertAfter(element);
            }
        });

    };

    return{
        init:function () {
            handlerInit();
        }
    }

}();


$(document).ready(function () {
   validate.init();
});

