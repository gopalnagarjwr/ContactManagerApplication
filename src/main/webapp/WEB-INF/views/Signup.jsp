<%@page import="org.aspectj.bridge.Message" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="stylesheet" href="/CSS/style.css">
<link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.15.4/css/all.css'>
<link
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
        rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
        crossorigin="anonymous">



<jsp:include page="header.jsp"/>
<div class="container">
    <div class="form-container">
        <%
            Object message = session.getAttribute("message");
            if (message != null && message instanceof Message) {
                String errorMessage = ((Message) message).getMessage().toString();
                boolean isError = ((Message) message).getKind() == Message.ERROR;
                session.setAttribute("message", null);
        %>
        <%
            if (isError) {
        %>
        <div id="errorMessage" class="alert alert-danger" role="alert"><%=errorMessage%>
        </div>
        <%
        } else {
        %>
        <div id="successMessage" class="alert alert-success text-center"
             role="alert"><%=errorMessage%>
        </div>
        <%
            }
        %>
        <script>
            setTimeout(function () {
                document.getElementById('<%= isError ? "errorMessage" : "successMessage" %>').style.display = 'none';
            }, 5000);
        </script>
        <%
            }
        %>


        <h3 class="h3 mb-5 text-center">Registration Here !!</h3>
        <form action="/registerHere" method="post">
            <div class="mb-3">
                <label class="form-label">Your Name</label> *<input
                    type="text"
                    class="form-control ${errors.hasFieldErrors('name') ? 'is-invalid' : ''}"
                    name="name" value="${user1.name}" placeholder="Enter Name">
                <div class="invalid-feedback">${ errors.getFieldError("name").getDefaultMessage()}
                </div>
            </div>
            <div class="mb-3">
                <label class="form-label">Your Email</label> *<input
                    type="email"
                    class="form-control ${errors.hasFieldErrors('Email') ? 'is-invalid' : ''}"
                    name="Email" value="${user1.email}" placeholder="Enter Email">
                <div class="invalid-feedback">${ errors.getFieldError("Email").getDefaultMessage()}
                </div>
            </div>
            <div class="mb-3">
                <label class="form-label">Your password</label> *<input
                    type="password"
                    class="form-control ${errors.hasFieldErrors('Password') ? 'is-invalid' : ''}"
                    name="Password" value="${user1.password}"
                    placeholder="Enter password">
                <div class="invalid-feedback">${ errors.getFieldError("Password").getDefaultMessage()}
                </div>
            </div>
            <div class="mb-3">
                <label class="form-label">About:</label>
                *<textarea
                    class="form-control ${errors.hasFieldErrors('About') ? 'is-invalid' : ''}"
                    name="About" id="About" placeholder="Enter something about yourself">${user1.about}</textarea>
                <div class="invalid-feedback">${ errors.getFieldError("About").getDefaultMessage()}
                </div>

                <div class="mb-3">
                    <input type="checkbox" name="agreement"> <label
                        class="form-label">Accept Terms and Conditions : </label>

                </div>
                <button type="submit" class="btn btn-primary ">Submit</button>
                <button type="reset" class="btn btn-warning">reset</button>
            </div>
        </form>
    </div>
</div>

<script src="https://cdn.tiny.cloud/1/126s68r91ilb8gdwbpa30fi53oa7qfdan0s9jsxfk22rxxi5/tinymce/7/tinymce.min.js"
        referrerpolicy="origin"></script>
<script>
    tinymce.init({
        selector: '#About'
    });
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
