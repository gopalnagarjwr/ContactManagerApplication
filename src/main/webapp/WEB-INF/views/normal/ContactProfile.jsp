<jsp:include page="Deshbord.jsp"/>
<div class="content">
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="alert alert-danger mt-5 alert-dismissible ${contact == null ? 'd-flex' : 'd-none'} align-items-center fade show"
                     role="alert">
                    <i class="bi bi-exclamation-octagon-fill"></i>
                    <strong class="mx-2">Error!</strong> You don't have permission to see this contact...
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
                <div class="contact-profile  p-3 ${contact == null ? 'd-none' : ''}">
                    <div class="profile-img ">
                        <img src="/IMAGE/${contact.image}" alt="Profile Picture">
                    </div>
                    <h5 class="mb-3 contact-info"><i>${contact.name}</i></h5>
                    <div class="description font-monospace">${contact.description}</div>
                    <table class="table mt-3 text-center">
                        <tr>
                            <td class="contact-info">NickName :</td>
                            <td>${contact.nickName}</td>
                        </tr>
                        <tr>
                            <td class="contact-info">Email :</td>
                            <td>${contact.email}</td>
                        </tr>
                        <tr>
                            <td class="contact-info">Phone Number :</td>
                            <td>${contact.phone}</td>
                        </tr>
                        <tr>
                            <td class="contact-info">Work :</td>
                            <td>${contact.work}</td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

