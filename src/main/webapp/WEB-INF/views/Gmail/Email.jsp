<!DOCTYPE html>
<html lang="en">
<head>
    <title>Email Page</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="/CSS/util.css">
    <link rel="stylesheet" type="text/css" href="/CSS/main.css">
</head>
<body>

<div class="contact1">
    <div id="successAlert" class="alert alert-success animated bounceInRight" style="display: none;">
        ${successAlert}
    </div>

    <div id="errorAlert" class="alert alert-danger animated bounceInRight" style="display: none;">
        ${errorAlert}
    </div>
    <div class="container-contact1">

        <div class="contact1-pic js-tilt" data-tilt>
            <img src="/images/img-01.png" alt="IMG">
        </div>

        <form class="contact1-form validate-form" action="/sender/EmailProcessing" method="post">
				<span class="contact1-form-title">
					Get in touch
				</span>

            <div class="wrap-input1 validate-input" data-validate="Name is required">
                <input class="input1 ${errors.hasFieldErrors('from') ? 'is-invalid' : ''}" type="text" name="from"
                       value="${Uemail}${data.from}" placeholder="From Email" readonly>
                <div class=" text-danger text-center ">${ errors.getFieldError("from").getDefaultMessage()} </div>
            </div>

            <div class="wrap-input1 validate-input" data-validate="Valid email is required: ex@abc.xyz">
                <input class="input1 ${errors.hasFieldErrors('to') ? 'is-invalid' : ''}" type="email" name="to"
                       value="${Cemail}${data.to}" placeholder="To Email" readonly>
                <div class=" text-danger text-center ">${ errors.getFieldError("to").getDefaultMessage()}</div>
            </div>

            <div class="wrap-input1 validate-input" data-validate="Subject is required">
                <input class="input1 ${errors.hasFieldErrors('subject') ? 'is-invalid' : ''}" type="text" name="subject"
                       value="${data.subject}" placeholder="Subject">
                <div class=" text-danger text-center ">${ errors.getFieldError("subject").getDefaultMessage()}</div>
            </div>

            <div class="wrap-input1 validate-input" data-validate="Message is required">
                <textarea class="input1 ${errors.hasFieldErrors('text') ? 'is-invalid' : ''} " name="text"
                          placeholder="Message">${data.text}</textarea>
                <div class=" text-danger text-center ">${ errors.getFieldError("text").getDefaultMessage()}</div>
            </div>

            <div class="container-contact1-form-btn">
                <a class="contact1-form-btn bg-danger" href="/user/show-contact/0" type="submit">
						<span>
							 Back
							<i class="fa fa-long-arrow-right" aria-hidden="true"></i>
						</span>
                </a>
                <button class="contact1-form-btn" type="submit">
						<span>
							Send Email
							<i class="fa fa-long-arrow-right" aria-hidden="true"></i>
						</span>
                </button>
            </div>

        </form>
    </div>
</div>

<script src="/JS/project.js"></script>
<script>
    $('.js-tilt').tilt({
        scale: 1.1
    })
</script>

<script>
    window.dataLayer = window.dataLayer || [];

    function gtag() {
        dataLayer.push(arguments);
    }

    gtag('js', new Date());

    gtag('config', 'UA-23581568-13');
</script>

<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</body>
</html>
