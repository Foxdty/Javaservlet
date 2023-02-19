<%--
  Created by IntelliJ IDEA.
  User: HạoThiên

  To change this template use File | Settings | File Templates.
--%>
<%@include file="/common/taglib.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Danh sách bài viết</title>
</head>
<body>
<div class="main-content">
    <form action="<c:url value="/admin-new"/>" id="formSubmit" method="get">

        <div class="main-content-inner">
            <div class="breadcrumbs ace-save-state" id="breadcrumbs">
                <ul class="breadcrumb">
                    <li>
                        <i class="ace-icon fa fa-home home-icon"></i>
                        <a href="#">Trang chủ</a>
                    </li>
                </ul><!-- /.breadcrumb -->
            </div>
            <div class="page-content">
                <div class="row">
                    <div class="col-xs-12">
                        <%--                    <c:if test="${not empty messageResponse}">--%>
                        <%--                        <div class="alert alert-${alert}">--%>
                        <%--                                ${messageResponse}--%>
                        <%--                        </div>--%>
                        <%--                    </c:if>--%>
                        <div class="widget-box table-filter">
                            <div class="table-btn-controls">
                                <div class="pull-right tableTools-container">
                                    <div class="dt-buttons btn-overlap btn-group">
                                        <a flag="info"
                                           class="dt-button buttons-colvis btn btn-white btn-primary btn-bold"
                                           data-toggle="tooltip"
                                           title='Thêm bài viết' href='<c:url value="/admin-new?type=edit"/>'>
															<span>
																<i class="fa fa-plus-circle bigger-110 purple"></i>
															</span>
                                        </a>
                                        <button id="btnDelete" type="button"
                                                class="dt-button buttons-html5 btn btn-white btn-primary btn-bold"
                                                data-toggle="tooltip" title='Xóa bài viết'>
																<span>
																	<i class="fa fa-trash-o bigger-110 pink"></i>
																</span>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <div class="table-responsive">
                                    <table class="table">
                                        <thead>
                                        <tr>
                                            <th>ID</th>
                                            <th>Tên bài viết</th>
                                            <th>Mô tả ngắn</th>
                                            <th>Ngày tạo</th>
                                            <th>Ngày sửa</th>
                                            <th>Người tạo</th>
                                            <th>Người sửa</th>
                                            <th>Thao tác</th>

                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach var="item" items="${model.listResult}">
                                            <tr>
                                                <td>${item.id}</td>
                                                <td>${item.title}</td>
                                                <td>${item.shortDescription}</td>
                                                <td>${item.createdDate}</td>
                                                <td>${item.modifiedDate}</td>
                                                <td>${item.createdBy}</td>
                                                <td>${item.modifiedBy}</td>
                                                <td>
                                                    <c:url var="editURL" value="/admin-new">
                                                        <c:param name="type" value="edit"/>
                                                        <c:param name="id" value="${item.id}"/>
                                                    </c:url>
                                                    <a class="btn btn-sm btn-primary btn-edit" data-toggle="tooltip"
                                                       title="Cập nhật bài viết" href='${editURL}'><i class="fa fa-pencil-square-o" aria-hidden="true"></i>
                                                    </a>
                                                </td>

                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                    <div class="center">
                                        <ul class="pagination" id="pagination"></ul>
                                        <input type="hidden" id="page" name="page"/>
                                        <input type="hidden" id="maxPageItem" name="maxPageItem"/>
                                        <input type="hidden" id="sortName" name="sortName"/>
                                        <input type="hidden" id="sortBy" name="sortBy"/>
                                        <input type="hidden" id="type" name="type" value="list"/>
                                    </div>

                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
        <div>

        </div>
    </form><!-- /.main-content -->
</div>
<script type="text/javascript">
    var totalPage = ${model.totalPage};
    <%--var maxPageItem = ${model.maxPageItem};--%>
    var currentPage = ${model.page};
    var limit = 2;
    let sortName = "${model.sortName}";
    let sortBy = "${model.sortBy}";

    console.log(sortName);
    console.log(sortBy);


    $(function () {
        window.pagObj = $('#pagination').twbsPagination({
            totalPages: totalPage,
            visiblePages: 3,
            startPage: currentPage,
            onPageClick: function (event, page) {
                if (currentPage != page) {
                    $('#maxPageItem').val(limit);
                    $('#page').val(page);
                    $('#sortName').val(sortName);
                    $('#sortBy').val(sortBy);
                    $('#formSubmit').submit();
                }

            }
        }).on('page', function (event, page) {
            console.info(page + ' (from event listening)');
        });
    });
</script>
</body>
</html>
