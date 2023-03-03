$(function(){

    $("#btn_kakao_login").click(function(event){
        //a태그 기능 실행 멈춤
        event.preventDefault();
        //카카오 로그인 실행시 오류메시지를 표시하는 경고창을 화면에 안보이게
        // $("alert_kakao_login").addClass("d_none");
        Kakao.init('c5e6c27b669e365c7e65abbc11ed9f30');
        Kakao.Auth.login({
            success:function(auth){
                Kakao.API.request({
                    url: '/v2/user/me',
                    success: function(response){
                        //사용자 정보를 가져와서 폼에 추가
                        var account = response.kakao_account;

                        $('#form_kakao_login input[name=nickname]').val(account.profile.nickname);
                        $('#form_kakao_login input[name=email]').val(account.email);
                        $('#form_kakao_login input[name=prof_img]').val(account.profile.img);
                        //사용자 정보가 포함된 폼을 서버로 제출
                        document.querySelector('#form_kakao_login').submit();
                    },
                    fail: function(error){
                        //경고창에 에러메시지 표시
                        $('alert_kakao_login').text("카카오 로그인 처리 중 오류가 발생했습니다.");
                    }
                });//api request
            }, //success 결과
            fail:function(error){
                //경고창에 에러메시지 표시
                $('alert_kakao_login').text("카카오 로그인 처리 중 오류가 발생했습니다.");
            }
        }); //로그인 인증
    })//클릭이벤트
}) //카카오로그인 끝

// Kakao.init('c5e6c27b669e365c7e65abbc11ed9f30');
// console.log(Kakao.isInitialized());
// function kakaoLogin() {
//     Kakao.Auth.login({
//         success: function (response) {
//             Kakao.API.request({
//                 url: '/v2/user/me',
//                 success: function (response) {
//                     console.log(response)
//                 },
//                 fail: function (error) {
//                     console.log(error)
//                 },
//             })
//         },
//         fail: function (error) {
//             console.log(error)
//         },
//     })
// }

// function kakaoLogout(){
//     if(Kakao.Auth.getAccessToken()){
//         Kakao.API.request({
//             url: '/v1/user/unlink',
//             success: function(response){
//                 console.log(response)
//             },
//             fail: function(error){
//                 console.log(error)
//             },
//         })
//         Kakao.Auth.setAccessToken(undefined)
//     }
// }

