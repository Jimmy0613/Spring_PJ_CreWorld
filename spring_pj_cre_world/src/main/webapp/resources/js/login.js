//카카오 로그인
$(function () {
    $("#btn_kakao_login").click(function (event) {
        //a태그 기능 실행 멈춤
        event.preventDefault();
        Kakao.init('c5e6c27b669e365c7e65abbc11ed9f30');
        Kakao.Auth.login({
            success: function (auth) {
                Kakao.API.request({
                    url: '/v2/user/me',
                    success: function (response) {
                        //사용자 정보를 가져와서 폼에 추가
                        var account = response.kakao_account;

                        $('#form_kakao_login input[name=nickname]').val(account.profile.nickname);
                        $('#form_kakao_login input[name=email]').val(account.email);
                        $('#form_kakao_login input[name=prof_img]').val(account.profile.profile_image_url);
                        //사용자 정보가 포함된 폼을 서버로 제출
                        document.querySelector('#form_kakao_login').submit();
                    },
                    fail: function (error) {
                        //콘솔창에 에러메시지 표시
                        console.info("카카오 로그인 처리 중 오류가 발생했습니다.");
                    }
                });//api request
            }, //success 결과
            fail: function (error) {
                //콘솔창에 에러메시지 표시
                console.info("카카오 로그인 처리 중 오류가 발생했습니다.");
            }
        }); //로그인 인증
    })//클릭이벤트
}) //카카오로그인 끝

//카카오 로그아웃
$(function () {
    $("#btn_kakao_logout").click(function (event) {
        Kakao.init('c5e6c27b669e365c7e65abbc11ed9f30');
        Kakao.isInitialized();

        if (!Kakao.Auth.getAccessToken()) {
            console.log('Not logged in');
            return;
        }

        Kakao.Auth.logout(function () {
            console.log(Kakao.Auth.getAccessToken());
            location.href = '/user/logout';
        });
    });
});//카카오 로그아웃 끝

//일반 로그인
$(function () {
    $("#norm_login_btn").click(function () {
        var email = $("#email").val();
        var uri = encodeURI(`/user/email_confirm?email=${email}`);
        $.get(uri, function (data) {
            if (data === false) {
                $("#confirm").text("가입 정보가 없는 이메일입니다.");
                $("#confirm").css("color", "red");
                return;
            }
        })
        var pw = $("#pw").val();
        uri = encodeURI(`/user/pw_confirm?email=${email}&pw=${pw}`);
        $.get(uri, function (data) {
            if (data === true) {
                $("#form_norm_login").submit();
            } else {
                $("#confirm").text("비밀번호가 틀렸습니다.");
                $("#confirm").css("color", "red");
                return;
            }
        })

    })
})