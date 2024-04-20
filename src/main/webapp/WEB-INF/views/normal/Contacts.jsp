<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="Deshbord.jsp"/>
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
<div class="content">
    <div class="container">
        <div class="d-flex justify-content-center">
            <div class=" col-8 m-3">
                <form action="/user/search-data" method="post" class="input-group ">
                    <input type="text" class="form-control  input-text " name="value" placeholder="Search contact...."
                           aria-label="Recipient's username" aria-describedby="basic-addon2">
                    <button class="btn btn-outline-warning  d-inline" type="submit"><i class="fa fa-search"></i>
                    </button>
                </form>
            </div>
        </div>
        <div class="col-lg-12">
            <div id="errorMessage" class="alert alert-danger animated bounceInRight" style="display: none;">
                <c:if test="${not empty errorMessage}">
                    ${errorMessage}
                </c:if>
            </div>
            <div id="successMessage" class="alert alert-success animated bounceInRight" style="display: none;">
                <c:if test="${not empty successMessage}">
                    ${successMessage}
                </c:if>
            </div>
            <div class="main-box clearfix">
                <div class="table-responsive">
                    <table class="table user-list">
                        <thead>
                        <tr class="text-center">
                            <th><span>Contact</span></th>
                            <th><span>Phone</span></th>
                            <th><span>Description</span></th>
                            <th><span>Email</span></th>
                            <th>&nbsp;</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="con" items="${contacts.content}">
                            <tr>
                                <td>
                                    <img src="/IMAGE/${con.image}" alt="">
                                    <a href="/user/contact-profile/${con.cid}" class="user-link">${con.name}</a>
                                    <span class="user-subhead">${con.work}</span>
                                </td>
                                <td class="text-center">
                                        ${con.phone}
                                </td>
                                <td class="text-center">
                                    <span class="label label-default">${con.description}</span>
                                </td>
                                <td class="text-center">
                                    <a href="/sender/G-mail/${con.cid}">${con.email}</a>
                                </td>
                                <td style="width: 20%;" class="text-center">
                                    <a href="/user/contact-profile/${con.cid}" class="table-link">
									<span class="fa-stack">
										<i class="fa fa-square fa-stack-2x"></i>
										<i class="fa fa-search-plus fa-stack-1x fa-inverse"></i>
									</span>
                                    </a>
                                    <a href="/user/contact-update/${con.cid}" class="table-link">
									<span class="fa-stack">
										<i class="fa fa-square fa-stack-2x"></i>
										<i class="fa fa-pencil fa-stack-1x fa-inverse"></i>
									</span>
                                    </a>
                                    <a class="table-link danger">
									<span class="fa-stack" onclick="removeContact(${con.cid})">
										<i class="fa fa-square fa-stack-2x"></i>
										<i class="fa fa-trash-o fa-stack-1x fa-inverse" aria-hidden="true"></i>
									</span>
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
                <div class="d-flex justify-content-center">
                    <nav aria-label="Page navigation example">
                        <ul class="pagination">
                            <c:forEach begin="0" end="${totalPage}" var="pageNumber">
                                <c:choose>
                                    <c:when test="${pageNumber eq currentPage}">
                                        <li class="page-item active"><a class="page-link rounded-0"
                                                                        href="#">${pageNumber}</a></li>
                                    </c:when>
                                    <c:otherwise>
                                        <li class="page-item"><a class="page-link rounded-0"
                                                                 href="/user/show-contact/${pageNumber}">${pageNumber}</a>
                                        </li>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                        </ul>
                    </nav>
                </div>

            </div>
        </div>
    </div>

    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</div>
