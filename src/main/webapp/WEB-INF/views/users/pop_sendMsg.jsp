<%@ page contentType="text/html;charset=UTF-8" language="java"
pageEncoding="UTF-8" %> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <link
      href="	https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
      rel="stylesheet"
    />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script
      src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.js"
      integrity="sha512-+k1pnlgt4F1H8L7t3z95o3/KO+o78INEcXTbnoJQ/F2VqDVhWoaiVml/OEHv9HsVgxUaVW+IbiZPUJQfF/YxZw=="
      crossorigin="anonymous"
      referrerpolicy="no-referrer"
    ></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500&display=swap" rel="stylesheet">
<style>
  *{font-family: 'Noto Sans KR', sans-serif;}
</style>
  </head>
  <body style="margin: 0 auto;width: 70%;height: 700px;padding: 50px;">
    <form
      method="post"
      action="${pageContext.servletContext.contextPath}/mypage/pop_sendMsgOk"
      onsubmit="return sendMsgOk()"
    >
      <div>
        보내는사람
        <input class="form-control" type="text" value="${LogId}" disabled />
      </div>
      <div style="margin-top: 20px">
        받는사람
        <input
          id="receive_user"
          class="form-control"
          type="text"
          name="receive_user"
          value=""
        />
        <div id="userCheck"></div>
        <input
          type="button"
          class="btn btn-outline-secondary"
          style="margin-top: 10px"
          value="받는사람 확인"
          onclick="checkReceiver()"
        />
      </div>
      <div style="margin-top: 40px">
        보낼 메세지
      <textarea
        class="form-control"
        style="resize: none;"
        rows="5"
        name="content"
        id="content"
        maxlength="80"
      ></textarea>
      </div>
      <input
        type="submit"
        value="전송"
        class="btn btn-outline-secondary"
        style="position: relative; float: right; margin-top: 20px"
      />
    </form>
    <script>
      function sendMsgOk() {
        const receive_user = document.getElementById("receive_user");
        const content = document.getElementById("content");
        if (!receive_user.value) {
          alert("받는사람을 입력하세요");
          return false;
        }
        if (!content.value) {
          alert("내용을 입력하세요");
          return false;
        }
        return true;
      }

      function checkReceiver() {
        const receive_user = document.getElementById("receive_user").value;
        $.ajax({
          type: "POST",
          url: "${pageContext.servletContext.contextPath}/mypage/checkReceiver",
          data: { receive_user: receive_user },
          success: function (response) {
            if (response == 1) {
              $("#userCheck").html("아이디가 존재합니다").css("color", "blue");
            } else {
              //보낼수없음
              $("#userCheck")
                .html("아이디가 존재하지 않습니다")
                .css("color", "red");
            }
          },
          error: function (error) {
            console.error("에러", error);
          },
        });
      }
    </script>
  </body>
</html>
