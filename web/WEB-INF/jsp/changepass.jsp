<%-- 
    Document   : login
    Created on : Apr 4, 2018, 10:40:25 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>ABC Company</title>
        <!-- Bootstrap core CSS-->
        <link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <!-- Custom fonts for this template-->
        <link href="../vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <!-- Custom styles for this template-->
        <link href="../css/sb-admin.css" rel="stylesheet">
    </head>

    <body class="bg-dark">
        <div class="container">
            <div class="card card-login mx-auto mt-5">
                <div class="card-header">Change Password</div>
                <div class="card-body">
                 
                    <form action="../login/change.htm" method="post">  

                        <div class="form-group">
                            <label for="exampleInputPassword1">Old Password</label>
                            <input class="form-control" type="password" name="password" id="txtOldPass" placeholder="Enter Password">
                            <input class="form-control" type="hidden" value="${USER}" name="username">
                            <input class="form-control" type="hidden" value="${PASS}" id="txtOldPass2">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputPassword1">New Password</label>
                            <input class="form-control" type="password" name="newPassword" id="txtNewPass" placeholder="Enter New Password">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputPassword1">New Password Again</label>
                            <input class="form-control" type="password" name="newPassword2" id="txtNewPass2" placeholder="Enter New Password Again">
                        </div>
                        <button class="btn btn-primary btn-block" onclick="return pass()">Change Password</button>
                    </form>
                </div>
            </div>
        </div>
        <!-- Bootstrap core JavaScript-->
        <script src="../vendor/jquery/jquery.min.js"></script>
        <script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <!-- Core plugin JavaScript-->
        <script src="../vendor/jquery-easing/jquery.easing.min.js"></script> 
        <script>
                            function pass() {
                                if (document.getElementById("txtOldPass").value == "") {
                                    alert("Mật khẩu cũ không được để trống");
                                    return false;
                                }
                                if (document.getElementById("txtOldPass").value !== document.getElementById("txtOldPass2").value) {
                                    alert("Mật khẩu cũ không chính xác");
                                    return false;
                                }
                                if (document.getElementById("txtNewPass").value == "") {
                                    alert("Mật khẩu mới không được để trống");
                                    return false;
                                }
                                if (document.getElementById("txtNewPass2").value == "") {
                                    alert("Nhập lại mật khẩu mới không được để trống");
                                    return false;
                                }
                                if (document.getElementById("txtNewPass").value != document.getElementById("txtNewPass2").value) {
                                    alert("Mật khẩu mới với Nhập lại mật khẩu không trùng khớp");
                                    return false;
                                } else {
                                    return true;
                                }
                            }
        </script>
    </body>

</html>

