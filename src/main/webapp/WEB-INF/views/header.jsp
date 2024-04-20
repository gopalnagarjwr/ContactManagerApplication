<header>
    <div class="d-flex justify-content-between container">
        <div class="mt-2 "><img src="https://bootdey.com/img/Content/avatar/avatar7.png" title=""  class=" img-fluid" alt=""
                                           width="15%"> <i class="fw-bold fs-2"> My Manager</i></div>
        <nav class="navbar navbar-expand-lg navbar-light">
            <div class="container-fluid">
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                        data-bs-target="#navbarExample01" aria-controls="navbarExample01"
                        aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarExample01">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item active"><a class="nav-link"
                                                       aria-current="page" href="/home"><i>Home</i></a></li>
                        <li class="nav-item"><a class="nav-link" href="/registerHere"><i>SignUp</i></a>
                        </li>
                        <li class="nav-item"><a class="nav-link"
                                                href="${user!=null?'/logout':'/login'}"><i>${user!=null?'Logout':'Login'}</i></a>
                        </li>
                        <li class="nav-item  "><a class="nav-link" href="/user/profileUser"><i>${user.name}</i></a></li>
                    </ul>
                </div>
            </div>
        </nav>
    </div>
</header>


