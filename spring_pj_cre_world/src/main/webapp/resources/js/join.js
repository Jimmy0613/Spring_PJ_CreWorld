$(function () {
    $("#form_join_btn").click(function () {
        if ($("#agree").is(":checked") === false) {
            alert('약관에 동의해주세요.');
            return;
        }
        if ($("#email_check").val() === "N") {
            alert('이메일 중복 확인을 해주세요.');
            return;
        }
        if ($("#pw_check").val() === "N") {
            alert('비밀번호가 일치하지 않습니다.');
            return;
        }
        if ($("#nickname").val().length < 2) {
            alert('별명은 한 글자 이상 입력해주세요.');
            return;
        }
        $("#form_join").submit();
    })
})
$(function () {
    $("#email_confirm_btn").click(function () {
        var email = $("#email").val();
        if (email.indexOf("@") === -1) {
            alert('이메일 양식을 확인해주세요.(\'@\' 필요)');
            return;
        }
        var uri = encodeURI(`/user/email_confirm?email=${email}`);
        $.get(uri, function (data) {
            if (data === false) {
                $("#email_confirm").text("사용할 수 있는 이메일입니다.");
                $("#email_confirm").css("color", "blue");
                $("#email_check").val("Y");
                $("#email_confirm_btn").css("opacity", "0.6");
                $("#email_confirm_btn").css("disabled", "true");
            } else {
                $("#email_confirm").text("이미 가입된 이메일입니다.");
                $("#email_confirm").css("color", "red");
                $("#email_check").val("N");
            }
        })

    })
})

$(function () {
    $("#email").change(function () {
        $("#email_confirm_btn").css("opacity", "1");
        $("#email_confirm_btn").css("disabled", "false");
        $("#email_check").val("N");
    })
})
$(function () {
    $("#pwCheck").change(function () {
        var pw = $("#pw").val();
        var pwCheck = $("#pwCheck").val();
        if (pw === pwCheck) {
            $("#pw_confirm").text("비밀번호가 일치합니다.");
            $("#pw_confirm").css("color", "blue");
            $("#pw_check").val("Y");
        } else {
            $("#pw_confirm").text("비밀번호가 일치하지 않습니다.");
            $("#pw_confirm").css("color", "red");
            $("#pw_check").val("N");
        }
    })
})