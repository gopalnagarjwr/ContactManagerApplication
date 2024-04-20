function toggleSidebar() {
    var sidebar = document.getElementById("sidebar");
    sidebar.classList.toggle("open");
    var hamburger = document.querySelector(".hamburger");
    hamburger.classList.toggle("open");
}

function showAlerts() {
    var errorMessage = document.getElementById('errorMessage');
    var successMessage = document.getElementById('successMessage');

    var errorAlert = document.getElementById('errorAlert');
    var successAlert = document.getElementById('successAlert');


    if (errorAlert && errorAlert.innerText.trim() !== '') {
        swal("Oops", "Something went wrong!", "error")

    }
    if (successAlert && successAlert.innerText.trim() !== '') {
        swal("Good job!", successAlert.innerText, "success");
    }


    if (errorMessage && errorMessage.innerText.trim() !== '') {
        errorMessage.style.display = 'block';
        setTimeout(function () {
            errorMessage.style.display = 'none';
        }, 6000);
    }
    if (successMessage && successMessage.innerText.trim() !== '') {
        successMessage.style.display = 'block';
        setTimeout(function () {
            successMessage.style.display = 'none';
        }, 6000);
    }
}


window.onload = showAlerts;


function removeContact(cid) {
    swal({
        title: "Are you sure?",
        text: "Once deleted, you will not be able to recover this Contact!",
        icon: "warning",
        buttons: true,
        dangerMode: true,
    }).then((willDelete) => {
        if (willDelete) {

            window.location = "/user/remove-contact/" + cid;
        } else {

            swal("Your Contact is safe!");
        }
    });


}