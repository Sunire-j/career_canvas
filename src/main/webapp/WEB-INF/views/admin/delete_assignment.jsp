<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500&display=swap" rel="stylesheet">

    <script>
        $(function () {
            $("#accept").on('click', function () {
                var del_target = $(this).attr("title");
                location.href = "${pageContext.servletContext.contextPath}/subject/delete?subjectid=" + del_target;
            });

            $("#dismiss").on('click', function () {
                var target = $(this).attr("title");
                location.href = "${pageContext.servletContext.contextPath}/subject/dismiss?subjectid=" + target;
            });

            $(".table").on('click', "#reason", function () {
                var reason = $(this).parent().find('input[type="hidden"]').val();
                alert(reason);
            });

            var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
            var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
                return new bootstrap.Tooltip(tooltipTriggerEl)
            })
        });
    </script>
    <style>
        *{font-family: 'Noto Sans KR', sans-serif;}
        #sideBar {
            width: 250px;
            position: fixed;
            height: 100%;
            background-color: #ddd;
            padding: 20px;
        }

        #sideBar h3 {
            margin: 15px 0px;
        }

        #sideBar a {
            width: 100%;
            display: flex;
            height: 30px;
            align-items: center;
        }

        .table {
            width: 100%;
            text-align: center;
            margin-top: 35px;
        }

        td {
            vertical-align: middle;
        }

        .pagination-container {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-top: 20px;
            text-align: center;
        }

        .pagination {
            display: inline-block;
        }

        .pagination a {
            color: black;
            float: left;
            padding: 6px 12px;
            text-decoration: none;
        }

        .pagination a.active {
            background-color: #4CAF50;
            color: white;
        }

        .pagination a:hover:not(.active) {
            background-color: #ddd;
        }

        .btn {
            color: white;
        }

        #sideBar a,
        #sideBar a:visited,
        #sideBar a:link {
            color: black;
            text-decoration: none;
        }
    </style>
</head>
<body>
<div style="display:flex;">
    <div id="sideBar">
        <div style="text-align: center;">
            <h4>관리자 ${name}</h4>
            <a href="${pageContext.servletContext.contextPath}/logout" style="color: red; text-align: center; display: block; margin: 0 auto;">로그아웃</a>
        </div>
        <hr/>
        <h3><a href="${pageContext.servletContext.contextPath}/admin/home">관리자 홈</a></h3>
        <h3>회원관리</h3>
        <a href="${pageContext.servletContext.contextPath}/admin/member"> 일반회원관리 </a>
        <a href="${pageContext.servletContext.contextPath}/admin/company"> 기업회원관리 </a>
        <h3>게시글관리</h3>
        <a href="${pageContext.servletContext.contextPath}/admin/board"> 게시판 모니터링 </a>
        <a href="${pageContext.servletContext.contextPath}/admin/report"> 신고 게시글 관리 </a>
        <a href="${pageContext.servletContext.contextPath}/admin/delete"> 과제 삭제 신청 목록 </a>
        <h3>배너관리</h3>
        <a href="${pageContext.servletContext.contextPath}/admin/banner"> 배너 관리 </a>
        <h3>통계</h3>
        <a href="${pageContext.servletContext.contextPath}/admin/user/stats"> 유저 현황 </a>
        <a href="${pageContext.servletContext.contextPath}/admin/board/stats"> 게시판 현황 </a>
        <a href="${pageContext.servletContext.contextPath}/" style="position: absolute; bottom: 90px;">메인 페이지 이동</a>
        <p style="position: absolute; bottom: 50px;">당일 접속 유저 : ${today}명</p>
        <p style="position: absolute; bottom: 20px;">누적 접속 유저 : ${all}명</p>
    </div>
    <!-- 관리자 페이지 만드실 때 margin-left 여기 참고하시면 됩니다 -->
    <div style="margin-left: 250px; width: 100%; height: 100%; padding: 20px;">
        <h1 style="padding: 15px;">게시판관리-삭제 신청 과제 목록</h1>
        <table class="table table-hover">
            <tr>
                <th>번호</th>
                <th>기업ID</th>
                <th>과제글제목</th>
                <th>신청일자</th>
                <th>승인여부</th>
                <th>처분</th>
            </tr>
            <c:forEach var="svo" items="${sVO}">
                <tr>
                    <td>${svo.subjectid}</td>
                    <td>${svo.user_userid}</td>
                    <td>${svo.subjecttitle}</td>
                    <td>${svo.date}</td>
                    <td>
                        대기중
                        <button type="button" class="btn btn-dark btn-sm" data-bs-toggle="tooltip" title="${svo.reason}" data-bs-placement="right"
                                id="reason">사유
                        </button>
                        <input type="hidden" value="${svo.reason}"/>
                    </td>
                    <td>
                        <button type="button" class="btn btn-primary btn-sm" id="accept" title="${svo.subjectid}">승인</button>
                        <button type="button" class="btn btn-danger btn-sm" id="dismiss" title="${svo.subjectid}">거절</button>
                    </td>
                </tr>
            </c:forEach>
        </table>
        <div class="pagination-container" style="margin: 0 auto; margin-top: 20px; width: fit-content">
            <div class="pagination">
                <c:if test="${pVO.page==1}">
                    <button class="btn btn-secondary"><</button>
                </c:if>
                <c:if test="${pVO.page>1}">
                    <a href="${pageContext.servletContext.contextPath}/admin/delete?page=${pVO.page-1}"><</a>
                </c:if>
                <c:forEach var="pvo" begin="${pVO.startPage}" end="${pVO.startPage + pVO.onePageCount - 1}">
                    <c:if test="${pvo <= pVO.totalPage}">
                        <button class="btn btn-secondary"
                                onclick="location.href='${pageContext.servletContext.contextPath}/admin/delete?page=${pvo}'">${pvo}</button>
                    </c:if>
                </c:forEach>
                <c:if test="${pVO.totalPage==pVO.page}">
                    <button class="btn btn-secondary">></button>
                </c:if>
                <c:if test="${pVO.totalPage>pVO.page}">
                    <button class="btn btn-secondary"
                            onclick="location.href='${pageContext.servletContext.contextPath}/admin/delete?page=${pVO.page+1}'">>
                    </button>
                </c:if>
            </div>
        </div>
    </div>
</div>
</body>
</html>