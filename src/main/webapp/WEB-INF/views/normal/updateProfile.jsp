<jsp:include page="Deshbord.jsp" />
<section class="content">
	<div class="bg-image-vertical "
		style="background-color: #EFD3E4; background-image: url(https://mdbootstrap.com/img/Photos/new-templates/search-box/img1.jpg);">
		<div class="mask d-flex align-items-center ">
			<div class="container">
				<div id="errorMessage"
					class="alert alert-danger animated bounceInRight"
					style="display: none;">
					<c:if test="${not empty errorMessage}">
                        ${errorMessage}
                    </c:if>

				</div>
				<div class="row justify-content-center ">
					<div class="col-12 col-lg-10 m-4">
						<div class=" bg-white" style="border-radius: 1rem;">
							<div class="p-3">
								<h1 class="mb-3 text-center">Profile Setting</h1>
								<form action="/user/update-process" method="post"
									enctype="multipart/form-data">

									<div class="form-outline mb-2">
										<label class="form-label" for="name">Full Name</label> <input
											type="text"
											class="form-control ${errors.hasFieldErrors('name') ? 'is-invalid' : ''}"
											id="name" name="name" value="${user1.name}">
										<div class="invalid-feedback">${ errors.getFieldError("name").getDefaultMessage()}
										</div>
									</div>

									<div class="form-outline mb-2">
										<label class="form-label" for="email">Email</label> <input
											type="email"
											class="form-control ${errors.hasFieldErrors('Email') ? 'is-invalid' : ''}"
											id="email" name="Email" value="${user1.email}" readonly>
										<div class="invalid-feedback">${ errors.getFieldError("Email").getDefaultMessage()}
										</div>
									</div>

									<div class="form-outline mb-2">
										<label class="form-label" for="password">Password</label> <input
											type="password"
											class="form-control ${errors.hasFieldErrors('Password') ? 'is-invalid' : ''}"
											id="password" name="Password" value="${user1.password}">
										<div class="invalid-feedback">${ errors.getFieldError("Password").getDefaultMessage()}
										</div>
									</div>

									<div class="form-outline mb-2">
										<label class="form-label" for="phone">Phone</label> <input
											type="tel" class="form-control" id="phone" name="Phone"
											value="${user1.phone}" required>
									</div>

									<div class="form-outline mb-2">
										<label class="form-label" for="about">About</label>
										<textarea
											class="form-control  ${errors.hasFieldErrors('About') ? 'is-invalid' : ''}"
											id="About" name="About" rows="3">${user1.about}</textarea>
										<div class="invalid-feedback">${ errors.getFieldError("About").getDefaultMessage()}
										</div>
									</div>
									<div class="form-outline mb-2">
										<label class="form-label" for="image">Profile Image</label> <input
											type="file" class="form-control-file" id="image"
											name="profileImage"> <small class="text-danger">Choose
											only jpg </small>
									</div>

									<div class="form-check d-flex justify-content-center mb-2">
										<label class="form-check-label" for="form6Example8">
											Enable Account </label> <input class="form-check-input ms-3"
											type="checkbox" name="agreement" value="true"
											id="form6Example8" checked />

									</div>
									<button type="submit"
										class="btn btn-secondary btn-rounded btn-block">Save
										Profile</button>
								</form>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>