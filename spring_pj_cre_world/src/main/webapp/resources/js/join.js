$(function () {
    $("#form_join_btn").click(function () {
        if ($("#agree").is(":checked") === false) {
            alert('약관에 동의해주세요.');
            return;
        }
        if ($("#id_check").val() === "N") {
            alert('아이디 중복 확인을 해주세요.');
            return;
        }
        if ($("#pw_check").val() === "N") {
            alert('비밀번호가 일치하지 않습니다.');
            return;
        }
        if ($("#user_name").val().length < 2) {
            alert('이름은 한 글자 이상 입력해주세요.');
            return;
        }
        $("#form_join").submit();
    })
})
$(function () {
    $("#id_confirm_btn").click(function () {
        var id = $("#id").val();
        var uri = encodeURI(`/user/id_confirm?user_id=${id}`);
        $.get(uri, function (data) {
            if (data === false) {
                $("#id_confirm").text("사용할 수 있는 아이디입니다.");
                $("#id_confirm").css("color", "blue");
                $("#id_check").val("Y");
                $("#id_confirm_btn").css("opacity", "0.6");
                $("#id_confirm_btn").css("disabled", "true");
            } else {
                $("#id_confirm").text("이미 가입된 아이디입니다.");
                $("#id_confirm").css("color", "red");
                $("#id_check").val("N");
            }
        })

    })
})

$(function () {
    $("#id").change(function () {
        $("#id_confirm_btn").css("opacity", "1");
        $("#id_confirm_btn").css("disabled", "false");
        $("#id_check").val("N");
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