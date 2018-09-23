<%-- 
    Document   : aaaa
    Created on : Apr 18, 2018, 10:46:12 AM
    Author     : Admin
--%>

<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>
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
        <!-- Page level plugin CSS-->
        <link href="../vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">
        <!-- Custom styles for this template-->
        <link href="../css/sb-admin.css" rel="stylesheet">
    </head>

    <body class="fixed-nav sticky-footer bg-dark" id="page-top">

        <!-- Navigation-->
        <jsp:include page="/WEB-INF/jsp/nav.jsp"/>

        <div class="content-wrapper">
            <div class="container-fluid">
                <!-- Breadcrumbs-->
                <ol class="breadcrumb">
                    <li class="breadcrumb-item">
                        <a href="../report/index.htm"><s:message code="label.nav.home" text="Home"/></a>
                    </li>
                    <li class="breadcrumb-item active"><s:message code="label.nav.staffs" text="Staffs"/></li>
                </ol>
                <!-- Example DataTables Card-->
                <div class="col-xl-3 col-sm-6 mb-3">
                    <div class="card text-white bg-warning o-hidden h-100">
                        <div class="card-body">
                            <div class="card-body-icon">
                                <i class="fa fa-fw fa-list"></i>
                            </div>
                            <div class="mr-5"> ${countStaff} <s:message code="label.nav.staffs" text="Staffs"/></div>
                        </div>
                        <a class="card-footer text-white clearfix small z-1" href="#" id="insert" data-toggle="modal" data-target="#insertDepartModal">
                            <span class="float-left"><s:message code="label.btn.new" text="New"/></span>
                            <span class="float-right">
                                <i class="fa fa-angle-right"></i>
                            </span>
                        </a>
                    </div>
                </div>



                <div class="card mb-3">
                    <div class="card-header">
                        <i class="fa fa-table"></i> <s:message code="label.staff.dataStaffsTable" text="Data Staffs Table"/> </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                <thead>
                                    <tr>
                                        <td>ID</td>
                                        <td style="padding-right:100px"><s:message code="label.staff.name" text="Name"/> </td>
                                        <td><s:message code="label.staff.gender" text="Gender"/></td>
                                        <td ><s:message code="label.staff.birthday" text="Birthday"/></td>
                                        <td><s:message code="label.staff.photo" text="Photo"/></td>
                                        <td><s:message code="label.staff.email" text="Email"/></td>
                                        <td><s:message code="label.staff.phone" text="Phone"/></td>
                                        <td><s:message code="label.staff.salary" text="Salary"/></td>
                                        <td><s:message code="label.staff.depart" text="Depart"/></td>                                  
                                        <td><s:message code="label.btn.edit" text="Edit"/></td>
                                        <td><s:message code="label.btn.delete" text="Delete"/></td>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="rows" items="${listStaffs}">

                                        <tr>
                                            <td >${rows.id}</td>
                                            <td>${rows.name}</td>
                                            <td>${(rows.gender==1? "Nam" : "Nữ")}</td>
                                            <td>${rows.birthday}</td>
                                            <td><img src="../images/${rows.photo}" style="width:50px;height:50px; border-radius:50%"/></td>
                                            <td>${rows.email}</td>
                                            <td>${rows.phone}</td>                        
                                            <td>${rows.salary}</td> 

                                            <td>${rows.departid}</td>     
                                            <c:url var="edit" value="../staffs/btnEdit.htm">
                                                <c:param name="txtId" value="${rows.id}"/>
                                                <c:param name="txtName" value="${rows.name}"/>
                                                <c:param name="txtGender" value="${rows.gender}"/>
                                                <c:param name="txtBirthday" value="${rows.birthday}"/>
                                                <c:param name="txtPhoto" value="${rows.photo}"/>
                                                <c:param name="txtEmail" value="${rows.email}"/>
                                                <c:param name="txtPhone" value="${rows.phone}"/>
                                                <c:param name="txtSalary" value="${rows.salary}"/>
                                                <c:param name="txtNotes" value="${rows.notes}"/>
                                                <c:param name="txtDepardId" value="${rows.departid}"/>
                                            </c:url>                                                                                    
                                            <td>
                                                <a href="${edit}" id="edit" data-toggle="modal" data-target="#staffsModal"><s:message code="label.btn.edit" text="Edit"/></a>
                                            </td>                                            
                                            <c:url var="delete" value="../staffs/btnDelete.htm">
                                                <c:param name="txtId" value="${rows.id}"/>                                            
                                            </c:url>
                                            <td>
                                                <a href="${delete}" id="delete" data-toggle="modal" data-target="#deleteStaffModal"> <s:message code="label.btn.delete" text="Delete"/></a> 
                                            </td>
                                        </tr>
                                    </c:forEach>  
                                </tbody>
                            </table>
                        </div>
                    </div>           
                </div>
            </div>
            <!-- /.container-fluid-->
            <!-- /.content-wrapper-->
            <footer class="sticky-footer">
                <div class="container">
                    <div class="text-center">
                        <small>Copyright © Your Website 2017</small>
                    </div>
                </div>
            </footer>
            <!-- Scroll to Top Button-->
            <a class="scroll-to-top rounded" href="#page-top">
                <i class="fa fa-angle-up"></i>
            </a>  
            <!-- Logout Modal-->
            <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel"><s:message code="label.btn.ready" text="Ready to Leave?"/></h5>
                            <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">×</span>
                            </button>
                        </div>
                        <div class="modal-body"><s:message code="label.btn.logout" text="Select Logout below if you are ready to end your current session."/></div>
                        <div class="modal-footer">
                            <button class="btn btn-secondary" type="button" data-dismiss="modal"><s:message code="label.btn.cancel" text="Cancel"/></button>
                            <a class="btn btn-primary" href="../login/showLogin.htm"><s:message code="label.nav.logout" text="Logout"/></a>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Detail Modal-->
            <div class="modal fade" id="staffsModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <form:form action="update.htm" class="pure-form" modelAttribute="staff">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel"><s:message code="label.staff.staffDetail" text="Staff Detail"/></h5>
                                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">×</span>
                                </button>
                            </div>
                            <div class="modal-body">

                                <div class="small text-muted">ID</div>
                                <form:input class="form-control" path="id" disabled="true" />
                                <form:input class="form-control" path="id" type="hidden" />
                                <br>
                                <div class="small text-muted"><s:message code="label.staff.name" text="Name"/></div>
                                <form:input class="form-control" path="name" id="txtName" />  
                                <form:errors path="name" />
                                <br>
                                <div class="small text-muted"><s:message code="label.staff.gender" text="Gender"/></div>
                                <form:radiobutton path="gender" value = "1" label="Nam"/>
                                <form:radiobutton path="gender" value = "0" label="Nữ"/>
                                <br>
                                <div class="small text-muted"><s:message code="label.staff.birthday" text="Birthday"/></div>
                                <form:input class="form-control" path="birthday" type="date"/> 
                                <br>
                                <div class="small text-muted"><s:message code="label.staff.photo" text="Photo"/></div>
                                <form:input class="form-control" path="photo" type="file"/>
                                <br>
                                <div class="small text-muted"><s:message code="label.staff.email" text="Email"/></div>
                                <form:input class="form-control" path="email" id="txtEmail"/>
                                <br>
                                <div class="small text-muted"><s:message code="label.staff.phone" text="Phone"/></div>
                                <form:input class="form-control" path="phone" id="txtPhone"/>
                                <br>
                                <div class="small text-muted"><s:message code="label.staff.salary" text="Salary"/></div>
                                <form:input class="form-control" path="salary" id="txtSalary"/>
                                <br>
                                <div class="small text-muted"><s:message code="label.staff.notes" text="Notes"/></div>
                                <form:input class="form-control" path="notes" id="txtNote"/>
                                <br>
                                <div class="small text-muted"><s:message code="label.staff.depart" text="Depart"/></div>
                                <form:select class="form-control" path="departid" items="${departs}" itemLabel="name" itemValue="id"/>
                            </div>
                            <div class="modal-footer">
                                <button class="btn btn-secondary" type="button"  data-dismiss="modal"><s:message code="label.btn.cancel" text="Cancel"/></button>
                                <button class="btn btn-primary" onclick="return val()"><s:message code="label.btn.update" text="Update" /></button>
                            </div>
                        </form:form>
                    </div>
                </div>
            </div>
            <!-- Insert Detail Modal-->
            <div class="modal fade" id="insertDepartModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <form:form action="insert.htm" class="pure-form" modelAttribute="staff">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel"> <s:message code="label.staff.insertNewStaff" text="Insert New Staff"/></h5>
                                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">×</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <div class="small text-muted"><s:message code="label.staff.name" text="Name"/></div>
                                <form:input class="form-control" path="name" id="txtName1"  />  
                                <br>
                                <div class="small text-muted"><s:message code="label.staff.gender" text="Gender"/></div>
                                <form:radiobutton path="gender" value = "1" label="Nam"/>
                                <form:radiobutton path="gender" value = "0" label="Nữ"/>
                                <br>
                                <div class="small text-muted"><s:message code="label.staff.birthday" text="Birthday"/></div>
                                <form:input class="form-control" path="birthday" type="date"/> 
                                <br>
                                <div class="small text-muted"><s:message code="label.staff.photo" text="Photo"/></div>
                                <form:input class="form-control" path="photo" type="file"/>
                                <br>
                                <div class="small text-muted"><s:message code="label.staff.email" text="Email"/></div>
                                <form:input class="form-control" path="email" id="txtEmail1"/>
                                <br>
                                <div class="small text-muted"><s:message code="label.staff.phone" text="Phone"/></div>
                                <form:input class="form-control" path="phone" id="txtPhone1"/>
                                <br>
                                <div class="small text-muted"><s:message code="label.staff.salary" text="Salary"/></div>
                                <form:input class="form-control" path="salary" id="txtSalary1"/>
                                <br>
                                <div class="small text-muted"><s:message code="label.staff.notes" text="Notes"/></div>
                                <form:input class="form-control" path="notes" id="txtNote1"/>
                                <br>
                                <div class="small text-muted"><s:message code="label.staff.depart" text="Depart"/></div>
                                <form:select class="form-control" path="departid" items="${departs}" itemLabel="name" itemValue="id"/>
                            </div>
                            <div class="modal-footer">
                                <button class="btn btn-secondary" type="button" data-dismiss="modal"><s:message code="label.btn.cancel" text="Cancel"/></button>
                                <button class="btn btn-primary" name="action" onclick="return val1()"><s:message code="label.btn.insert" text="Insert"/></button>
                            </div>
                        </form:form>
                    </div>
                </div>
            </div>
            <!-- Delete Detail Modal-->
            <div class="modal fade" id="deleteStaffModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <form:form action="btnDelete.htm" class="pure-form" modelAttribute="staff">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel"> <s:message code="label.staff.deleteStaff" text="Delete Staff"/></h5>
                                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">×</span>
                                </button>
                            </div>
                            <div class="modal-body"><s:message code="label.btn.areYouSure" text="Are You Sure want to delete this?"/></div>
                            <div class="modal-footer">
                                <button class="btn btn-secondary" type="button" data-dismiss="modal"><s:message code="label.btn.cancel" text="Cancel"/></button>
                                <button class="btn btn-primary"><s:message code="label.btn.delete" text="Delete"/></button>
                            </div>
                        </form:form>
                    </div>
                </div>
            </div>
            <!-- Bootstrap core JavaScript-->
            <script src="../vendor/jquery/jquery.min.js"></script>
            <script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
            <!-- Core plugin JavaScript-->
            <script src="../vendor/jquery-easing/jquery.easing.min.js"></script>
            <!-- Page level plugin JavaScript-->
            <script src="../vendor/datatables/jquery.dataTables.js"></script>
            <script src="../vendor/datatables/dataTables.bootstrap4.js"></script>
            <!-- Custom scripts for all pages-->
            <script src="../js/sb-admin.min.js"></script>
            <!-- Custom scripts for this page-->
            <script src="../js/sb-admin-datatables.min.js"></script>
            <script>
                                    $(document).ready(function () {
                                        $('table tbody td #edit').click(function () {
                                            var link = $(this).attr("href");
                                            $.get(link, function (data) {
                                                var result = $('<div/>').append(data).find("#staffsModal").html();
                                                $('#staffsModal').html(result);
                                            });
                                        });
                                    });

                                    $(document).ready(function () {
                                        $('table tbody td #insert').click(function () {
                                            var link = $(this).attr("href");
                                            $.get(link, function (data) {
                                                var result = $('<div/>').append(data).find("#insertDepartModal").html();
                                                $('#insertDepartModal').html(result);
                                            });
                                        });
                                    });

                                    $(document).ready(function () {
                                        $('table tbody td #delete').click(function () {
                                            var link = $(this).attr("href");
                                            $.get(link, function (data) {
                                                var result = $('<div/>').append(data).find("#deleteStaffModal").html();
                                                $('#deleteStaffModal').html(result);
                                            });
                                        });
                                    });

                                    function val() {
                                        if (document.getElementById("txtName").value == "") {
                                            alert("Tên không được để trống");
                                            return false;
                                        }
                                        if (document.getElementById("txtEmail").value == "") {
                                            alert("Email không được để trống");
                                            return false;
                                        }
                                        if (document.getElementById("txtPhone").value == "") {
                                            alert("Số điện thoại không được để trống");
                                            return false;
                                        }
                                        if (document.getElementById("txtPhone").value == "") {
                                            alert("Số điện thoại không được để trống");
                                            return false;
                                        }
                                        if (document.getElementById("txtSalary").value == "") {
                                            alert("Lương không được để trống");
                                            return false;
                                        }
                                        if (document.getElementById("txtNote").value == "") {
                                            alert("Ghi chú không được để trống");
                                            return false;
                                        } else {
                                            return true;
                                        }
                                    }
                                    
                                    function val1() {
                                        if (document.getElementById("txtName1").value == "") {
                                            alert("Tên không được để trống");
                                            return false;
                                        }
                                        if (document.getElementById("txtEmail1").value == "") {
                                            alert("Email không được để trống");
                                            return false;
                                        }
                                       
                                        if (document.getElementById("txtPhone1").value == "") {
                                            alert("Số điện thoại không được để trống");
                                            return false;
                                        }
                                        if (document.getElementById("txtSalary1").value == "") {
                                            alert("Lương không được để trống");
                                            return false;
                                        }
                                        if (document.getElementById("txtNote1").value == "") {
                                            alert("Ghi chú không được để trống");
                                            return false;
                                        } else {
                                            return true;
                                        }
                                    }


            </script>

        </div>
    </body>
</html>

