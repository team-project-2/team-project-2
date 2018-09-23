<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="DAO.ReportDAO"%>
<%@page import="model.ReportPersonal"%>
<%@page import="model.ReportDepart"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

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
    <jsp:include page="nav.jsp"/>

    <div class="content-wrapper">
        <div class="container-fluid">
            <!-- Breadcrumbs-->
            <ol class="breadcrumb">
                <li class="breadcrumb-item">
                    <a href="../report/index.htm"><s:message code="label.nav.home" text="Home"/></a>
                </li>
                <li class="breadcrumb-item active"><s:message code="label.nav.home" text="Home"/></li>
            </ol>
            <!-- Icon Cards-->
            <div class="row">
                <div class="col-xl-3 col-sm-6 mb-3">
                    <div class="card text-white bg-primary o-hidden h-100">
                        <div class="card-body">
                            <div class="card-body-icon">
                                <i class="fa fa-fw fa-comments"></i>
                            </div>
                            <div class="mr-5">${countDeparts} <s:message code="label.nav.departs" text="Departs"/></div>
                        </div>
                        <a class="card-footer text-white clearfix small z-1" href="../departs/indexDeparts.htm">
                            <span class="float-left"><s:message code="label.home.viewDetails" text="View Details"/></span>
                            <span class="float-right">
                                <i class="fa fa-angle-right"></i>
                            </span>
                        </a>
                    </div>
                </div>
                <div class="col-xl-3 col-sm-6 mb-3">
                    <div class="card text-white bg-warning o-hidden h-100">
                        <div class="card-body">
                            <div class="card-body-icon">
                                <i class="fa fa-fw fa-list"></i>
                            </div>
                            <div class="mr-5">${countStaff} <s:message code="label.nav.staffs" text="Staffs"/></div>
                        </div>
                        <a class="card-footer text-white clearfix small z-1" href="../staffs/indexStaffs.htm">
                            <span class="float-left"><s:message code="label.home.viewDetails" text="View Details"/></span>
                            <span class="float-right">
                                <i class="fa fa-angle-right"></i>
                            </span>
                        </a>
                    </div>
                </div>
                <div class="col-xl-3 col-sm-6 mb-3">
                    <div class="card text-white bg-success o-hidden h-100">
                        <div class="card-body">
                            <div class="card-body-icon">
                                <i class="fa fa-fw fa-shopping-cart"></i>
                            </div>
                            <div class="mr-5">${countRecord} <s:message code="label.nav.records" text="Records"/></div>
                        </div>
                        <a class="card-footer text-white clearfix small z-1" href="../record/indexRecord.htm">
                            <span class="float-left"><s:message code="label.home.viewDetails" text="View Details"/></span>
                            <span class="float-right">
                                <i class="fa fa-angle-right"></i>
                            </span>
                        </a>
                    </div>
                </div>
                <div class="col-xl-3 col-sm-6 mb-3">
                    <div class="card text-white bg-danger o-hidden h-100">
                        <div class="card-body">
                            <div class="card-body-icon">
                                <i class="fa fa-fw fa-support"></i>
                            </div>
                            <div class="mr-5">${countUsers} <s:message code="label.nav.users" text="Users"/></div>
                        </div>
                        <a class="card-footer text-white clearfix small z-1" href="../users/indexUsers.htm">
                            <span class="float-left"><s:message code="label.home.viewDetails" text="View Details"/></span>
                            <span class="float-right">
                                <i class="fa fa-angle-right"></i>
                            </span>
                        </a>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-lg-8">
                    <form action="../report/show.htm"> 
                        <button class="btn btn-primary" value="1" name="btnShowStaff"><s:message code="label.home.showStaffsData" text="Show Staffs Data"/></button>
                        <button class="btn btn-primary" value="0" name="btnShowStaff"><s:message code="label.home.showDepartsData" text="Show Departs Data"/></button>
                    </form>
                    <br>
                    <c:if  test = "${value == 1}">
                        <div class="card-header">
                            <i class="fa fa-table"></i> <s:message code="label.home.staffsDataStatisticalTable" text="Staffs Data Statistical Table"/></div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>ID</th>
                                            <th>Name</th>
                                            <th>Depart</th>
                                            <th>Good</th>
                                            <th>Bad</th>
                                            <th>Total</th>
                                            <th>Rank</th>
                                        </tr>
                                    </thead>                                
                                    <tbody>                                                                        
                                        <c:forEach var="rows" items="${listReportPersonal}">
                                            <tr>
                                                <td>${rows.staffid}</td>
                                                <td>${rows.name}</td>
                                                <td>${rows.departid}</td>
                                                <td>${rows.good}</td>
                                                <td>${rows.bad}</td>
                                                <td>${rows.total}</td>
                                                <td style="text-align: center">
                                                    <c:if test="${rows.rank == 1}">                                                  
                                                        <img src="../images/first.png" style="width:35px;height:35px; border-radius:50%" />  

                                                    </c:if> 
                                                    <c:if test="${rows.rank == 2}">                                                                                                      
                                                        <img src="../images/second.png" style="width:35px;height:35px; border-radius:50%"/>
                                                        <!--                                                        <p style="opacity: 0">2</p>-->
                                                    </c:if>
                                                    <c:if test="${rows.rank == 3}">                                                                                                      
                                                        <img src="../images/third.png" style="width:35px;height:35px; border-radius:50%"/>
                                                        <!--                                                        <p style="opacity: 0">3</p>-->
                                                    </c:if>
                                                    <c:if test="${rows.rank != 1 and rows.rank != 2 and rows.rank != 3}">                                                                                                      
                                                        ${rows.rank}
                                                    </c:if>                                              
                                                </td>  
                                            </tr>
                                        </c:forEach>  
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </c:if>

                    <c:if  test = "${value == 0}">
                        <div class="card-header">
                            <i class="fa fa-table"></i> Departs Data Statistical Table</div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>ID</th>
                                            <th>Name</th>
                                            <th>Good</th>
                                            <th>Bad</th>
                                            <th>Total</th>
                                            <th>Rank</th>
                                        </tr>
                                    </thead>                                
                                    <tbody>   
                                        <c:forEach var="rows" items="${listReportDepart}">
                                            <tr>
                                                <td>${rows.id}</td>
                                                <td>${rows.name}</td>
                                                <td>${rows.good}</td>
                                                <td>${rows.bad}</td>
                                                <td>${rows.total}</td>
                                                <td style="text-align: center">
                                                    <c:if test="${rows.rank == 1}">                                                  
                                                        <img src="../images/first.png" style="width:35px;height:35px; border-radius:50%" />  

                                                    </c:if> 
                                                    <c:if test="${rows.rank == 2}">                                                                                                      
                                                        <img src="../images/second.png" style="width:35px;height:35px; border-radius:50%"/>
                                                        <!--                                                        <p style="opacity: 0">2</p>-->
                                                    </c:if>
                                                    <c:if test="${rows.rank == 3}">                                                                                                      
                                                        <img src="../images/third.png" style="width:35px;height:35px; border-radius:50%"/>
                                                        <!--                                                        <p style="opacity: 0">3</p>-->
                                                    </c:if>
                                                    <c:if test="${rows.rank != 1 and rows.rank != 2 and rows.rank != 3}">                                                                                                      
                                                        ${rows.rank}
                                                    </c:if>                                              
                                                </td>  
                                            </tr>
                                        </c:forEach>  
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </c:if>
                </div>

                <div class="col-lg-4">                   
                    <!-- Ranks award of Staff Card-->
                    <div class="card mb-3">
                        <div class="card-header">
                            <i class="fa fa-bell-o"></i> <s:message code="label.home.ranksAwardOfStaff" text="Ranks Award Of Staff"/></div>
                        <div class="list-group list-group-flush small">
                            <%
                                ReportDAO rp = new ReportDAO();
                                List<ReportPersonal> dsTop3Staffs = new ArrayList<ReportPersonal>();
                                dsTop3Staffs = rp.showTop3Staff("");
                                for (int i = 0; i < dsTop3Staffs.size(); i++) {
                            %>
                            <a class="list-group-item list-group-item-action" href="#">
                                <div class="media">
                                    <%
                                        if (dsTop3Staffs.get(i).getRank() == 1) {
                                    %>
                                    <img style="width:55px;height:55px;" class="d-flex mr-3 rounded-circle" src="../images/first.png" alt="" />
                                    <%
                                    } else if (dsTop3Staffs.get(i).getRank() == 2) {
                                    %>
                                    <img style="width:55px;height:55px;" class="d-flex mr-3 rounded-circle" src="../images/second.png" alt=""/>
                                    <%
                                    } else if (dsTop3Staffs.get(i).getRank() == 3) {
                                    %>
                                    <img style="width:55px;height:55px;" class="d-flex mr-3 rounded-circle" src="../images/third.png" alt=""/>
                                    <%
                                        }
                                    %>
                                    <div class="media-body">   
                                        <s:message code="label.home.staffId" text="Staff ID"/>: <strong>
                                            <%
                                                out.print(dsTop3Staffs.get(i).getStaffid());
                                            %>  
                                        </strong><br>
                                        <s:message code="label.home.staffName" text="Staff Name"/>: <strong>
                                            <%
                                                out.print(dsTop3Staffs.get(i).getName());
                                            %> 
                                        </strong>
                                        <div class="text-muted smaller"><s:message code="label.home.totalScore" text="Total Score"/>: 
                                            <%
                                                out.print(dsTop3Staffs.get(i).getTotal());
                                            %> 
                                        </div>
                                    </div>
                                </div>
                            </a>
                            <%
                                }
                            %>                           
                        </div>
                    </div>

                    <!-- Ranks award of Depart Card-->
                    <div class="card mb-3">
                        <div class="card-header">
                            <i class="fa fa-bell-o"></i> <s:message code="label.home.ranksAwardOfDepart" text="Ranks Award Of Depart"/></div>
                        <div class="list-group list-group-flush small">
                            <%
                                List<ReportDepart> dsTop3Departs = new ArrayList<ReportDepart>();
                                dsTop3Departs = rp.showTop3Depart("");
                                for (int i = 0; i < dsTop3Departs.size(); i++) {
                            %>
                            <a class="list-group-item list-group-item-action" href="#">
                                <div class="media">
                                    <%
                                        if (dsTop3Departs.get(i).getRank() == 1) {
                                    %>
                                    <img style="width:55px;height:55px;" class="d-flex mr-3 rounded-circle" src="../images/first.png" alt="" />
                                    <%
                                    } else if (dsTop3Departs.get(i).getRank() == 2) {
                                    %>
                                    <img style="width:55px;height:55px;" class="d-flex mr-3 rounded-circle" src="../images/second.png" alt=""/>
                                    <%
                                    } else if (dsTop3Departs.get(i).getRank() == 3) {
                                    %>
                                    <img style="width:55px;height:55px;" class="d-flex mr-3 rounded-circle" src="../images/third.png" alt=""/>
                                    <%
                                        }
                                    %>
                                    <div class="media-body">   
                                        <s:message code="label.home.departId" text="Depart ID"/>: <strong>
                                            <%
                                                out.print(dsTop3Departs.get(i).getId());
                                            %>  
                                        </strong><br>
                                        <s:message code="label.home.departName" text="Depart Name"/>: <strong>
                                            <%
                                                out.print(dsTop3Departs.get(i).getName());
                                            %> 
                                        </strong>
                                        <div class="text-muted smaller"><s:message code="label.home.totalScore" text="Total Score"/>: 
                                            <%
                                                out.print(dsTop3Departs.get(i).getTotal());
                                            %> 
                                        </div>
                                    </div>
                                </div>
                            </a>
                            <%
                                }
                            %>                           
                        </div>
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
                        <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                        <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">×</span>
                        </button>
                    </div>
                    <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                    <div class="modal-footer">
                        <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                        <a class="btn btn-primary" href="../login/showLogin.htm">Logout</a>
                    </div>
                </div>
            </div>
        </div>
        <!-- Bootstrap core JavaScript-->
        <script src="../vendor/jquery/jquery.min.js"></script>
        <script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <!-- Core plugin JavaScript-->
        <script src="../vendor/jquery-easing/jquery.easing.min.js"></script>
        <!-- Page level plugin JavaScript-->
        <script src="../vendor/chart.js/Chart.min.js"></script>
        <script src="../vendor/datatables/jquery.dataTables.js"></script>
        <script src="../vendor/datatables/dataTables.bootstrap4.js"></script>
        <!-- Custom scripts for all pages-->
        <script src="../js/sb-admin.min.js"></script>
        <!-- Custom scripts for this page-->
        <script src="../js/sb-admin-datatables.min.js"></script>
        <script src="../js/sb-admin-charts.min.js"></script>
    </div>
</body>

</html>

