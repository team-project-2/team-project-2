<%-- 
    Document   : header
    Created on : Apr 19, 2018, 3:50:28 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top" id="mainNav">
            <a class="navbar-brand" href="../report/index.htm">ABC Company</a>
            <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarResponsive">
                <ul class="navbar-nav navbar-sidenav" id="exampleAccordion">
                    <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Home">
                        <a class="nav-link" href="../report/index.htm">
                            <i class="fa fa-fw fa-dashboard"></i>
                            <span class="nav-link-text"><s:message code="label.nav.home" text="Home"/></span>
                        </a>
                    </li>
                    <li class="nav-item" data-toggle="tooltip" data-placement="right" title="News">
                        <a class="nav-link" href="#">
                            <i class="fa fa-fw fa-newspaper-o"></i>
                            <span class="nav-link-text"><s:message code="label.nav.news" text="News"/></span>
                        </a>
                    </li>
                    <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Timesheet">
                        <a class="nav-link" href="#">
                            <i class="fa fa-fw fa-clock-o"></i>
                            <span class="nav-link-text"><s:message code="label.nav.timesheet" text="Timesheet"/></span>
                        </a>
                    </li>
                    <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Management">
                        <a class="nav-link nav-link-collapse collapsed" data-toggle="collapse" href="#collapseMulti" data-parent="#exampleAccordion">
                            <i class="fa fa-fw fa-sitemap"></i>
                            <span class="nav-link-text"><s:message code="label.nav.management" text="Management"/></span>
                        </a>
                        <ul class="sidenav-second-level collapse" id="collapseMulti">
                            <li>
                                <a href="../departs/indexDeparts.htm"><s:message code="label.nav.departs" text="Departs"/></a>
                            </li>
                            <li>
                                <a href="../staffs/indexStaffs.htm"><s:message code="label.nav.staffs" text="Staffs"/></a>
                            </li>
                            <li>
                                <a href="../record/indexRecord.htm"><s:message code="label.nav.records" text="Records"/></a>
                            </li>
                            <li>
                                <a href="../users/indexUsers.htm"><s:message code="label.nav.users" text="Users"/></a>
                            </li>                           
                        </ul>
                    </li>
                    <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Statistical income">
                        <a class="nav-link nav-link-collapse collapsed" data-toggle="collapse" href="#collapseMulti2" data-parent="#exampleAccordion">
                            <i class="fa fa-bar-chart"></i>
                            <span class="nav-link-text"><s:message code="label.nav.statisticalincome" text="Statistical income"/></span>
                        </a>
                        <ul class="sidenav-second-level collapse" id="collapseMulti2">
                            <li>
                                <a href="../thongke/thongke.htm"><s:message code='label.nav.statisticalweek' text="Week"/></a>
                                <a href="#"><s:message code='label.nav.statisticalmonth' text="Month"/></a>
                                <a href="#"><s:message code='label.nav.statisticalyear' text="Year"/></a>
                            </li>
                        </ul>
                    </li> 
                    <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Setting">
                        <a class="nav-link nav-link-collapse collapsed" data-toggle="collapse" href="#collapseComponents" data-parent="#exampleAccordion">
                            <i class="fa fa-fw fa-wrench"></i>
                            <span class="nav-link-text"><s:message code="label.nav.setting" text="Setting"/></span>
                        </a>
                        <ul class="sidenav-second-level collapse" id="collapseComponents">
                            <li>
                                <a href="?lang=en"><s:message code="label.nav.en" text="English"/></a>
                                <a href="?lang=vi"><s:message code="label.nav.vi" text="Vietnamese"/></a>
                                <a href="../login/showChangePass.htm"><s:message code="label.nav.changePass" text="Change Password"/></a>
                            </li>
                        </ul>
                    </li>             
                </ul>
                <ul class="navbar-nav sidenav-toggler">
                    <li class="nav-item">
                        <a class="nav-link text-center" id="sidenavToggler">
                            <i class="fa fa-fw fa-angle-left"></i>
                        </a>
                    </li>
                </ul>
                <ul class="navbar-nav ml-auto">                   
                    <li class="nav-item">
                        <a class="nav-link" data-toggle="modal" data-target="#exampleModal">
                            <i class="fa fa-fw fa-sign-out"></i><s:message code="label.nav.logout" text="Logout"/></a>                       
                    </li>
                </ul>
            </div>
        </nav>
    </body>
</html>
