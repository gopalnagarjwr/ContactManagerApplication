<jsp:include page="Deshbord.jsp"/>
<section class="content section about-section gray-bg" id="about">
    <div class="container">
        <div id="successMessage" class="alert alert-success animated bounceInRight" style="display: none;">
            <c:if test="${not empty successMessage}">
                ${successMessage}
            </c:if>
        </div>
        <div class="row align-items-center flex-row-reverse">
            <div class="col-lg-6">
                <div class="about-text go-to">
                    <h3 class="dark-color">${user.name}</h3>
                    <p>
                        <mark>${user.about}</mark>
                    </p>
                    <div class="row about-list">
                        <div class="col-md-6 ">

                            <div class="media">
                                <label>Role</label>
                                <p>${user.role}</p>
                            </div>
                            <div class="media">
                                <label>Enable</label>
                                <p>Active</p>
                            </div>
                            <div class="media">
                                <label>Password</label>
                                <p>${user.password}</p>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="media">
                                <label>E-mail</label>
                                <p>${user.email}</p>
                            </div>
                            <div class="media">
                                <label>Phone</label>
                                <p>${user.phone}</p>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="about-avatar text-center ">
                    <img src="data:image/jpeg;base64,${base64Image}" title="" alt="profile image" class="img-fluid" width="">
                </div>
            </div>
        </div>
    </div>
</section>