<jsp:include page="Deshbord.jsp"/>
<div class="content">
    <div class="container">
        <div class="col-md-12">
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
            
            <div class="form-container">
                <h2 class="text-center"> ${title}</h2>
                <form action="/user/add-Contact" method="post" enctype="multipart/form-data">
                    <input type="hidden" name="cid" value="${contact.cid}">
                    <div class="form-group">
                        <label>Name:</label>
                        <input type="text" class="form-control ${errors.hasFieldErrors('name') ? 'is-invalid' : ''}"
                               name="name" value="${contact.name}" placeholder="Enter your name">
                    </div>
                    <div class=" text-danger text-center ">${ errors.getFieldError("name").getDefaultMessage()}</div>
                    <div class="form-group ">
                        <label>Nickname:</label>
                        <input type="text" class="form-control" value="${contact.nickName}" name="nickName"
                               placeholder="Enter your nickname">
                    </div>
                    <div class="form-group">
                        <label>Work:</label>
                        <input type="text" class="form-control" value="${contact.work}" name="work"
                               placeholder="Enter your work">
                    </div>
                    <div class="form-group">
                        <label>Email:</label>
                        <input type="email"
                               class="form-control ${errors.hasFieldErrors('email') ? 'is-invalid' : ''}"
                               value="${contact.email}" name="email"
                               placeholder="Enter your email">
                    </div>
                    <div class="text-danger text-center ">${ errors.getFieldError("email").getDefaultMessage()}</div>

                    <div class="form-group">
                        <label>Phone:</label>
                        <input type="number"
                               class="form-control ${errors.hasFieldErrors('phone') ? 'is-invalid' : ''}"
                               value="${contact.phone}" name="phone"
                               placeholder="Enter your phone number">
                    </div>
                    <div class="text-danger text-center ">${ errors.getFieldError("phone").getDefaultMessage()}</div>

                    <div class="form-group">
                        <label for="description">Description:</label>
                        <textarea class="form-control  border-0" id="description" name="description"
                                  placeholder="Enter a brief description about yourself"> ${contact.description}</textarea>
                    </div>
                    <div class=" form-group">
                        <input type="file" class="form-control ${emptyfile? 'is-invalid' : ''}" name="profileImage"
                               accept="profileImage/*">
                        <img src="data:image/jpeg;base64,${contact.base64Image}">
                    </div>
                    <div class="d-flex justify-content-end">
                        <button type="submit" class="btn btn-primary btn-block">Save Contact</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</div>


