<%-- 
    Document   : index
    Created on : Oct 5, 2018, 1:22:39 PM
    Author     : integrale
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib  prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">
        <link rel="icon" type="image/png" sizes="16x16" href="<c:url value="/resources/plugins/images/favicon.png"></c:url>">
            <title>Gestion Formation</title>
            <!-- Bootstrap Core CSS -->
            <link href='<c:url value="/resources/bootstrap/dist/css/bootstrap.min.css"></c:url>' rel="stylesheet">
            <!-- Menu CSS -->
            <link href="<c:url value="/resources/plugins/bower_components/sidebar-nav/dist/sidebar-nav.min.css"></c:url>" rel="stylesheet">
            <!-- toast CSS -->
            <link href="<c:url value="/resources/plugins/bower_components/toast-master/css/jquery.toast.css"></c:url>" rel="stylesheet">
            <!-- morris CSS -->
            <link href="<c:url value="/resources/plugins/bower_components/morrisjs/morris.css"></c:url>" rel="stylesheet">
            <!-- chartist CSS -->
            <link href="<c:url value="/resources/plugins/bower_components/chartist-js/dist/chartist.min.css"></c:url>" rel="stylesheet">
        <link href="<c:url value="/resources/plugins/bower_components/chartist-plugin-tooltip-master/dist/chartist-plugin-tooltip.css"></c:url>" rel="stylesheet">
            <!-- animation CSS -->
            <link href="<c:url value="/resources/css/animate.css"></c:url>" rel="stylesheet">
            <!-- Custom CSS -->
            <link href="<c:url value="/resources/css/style.css"></c:url>" rel="stylesheet">
            <!-- color CSS -->
            <link href="<c:url value="/resources/css/colors/default.css"></c:url>" id="theme" rel="stylesheet">
            <link href="https://cdn.datatables.net/buttons/1.2.2/css/buttons.dataTables.min.css" rel="stylesheet" type="text/css" />
            <link href="<c:url value="/resources/plugins/datatables/jquery.dataTables.min.css"></c:url>" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css"/>
        </head>

        <body class="fix-header">
            <!-- ============================================================== -->
            <!-- Preloader -->
            <!-- ============================================================== -->
            <div class="preloader">
                <svg class="circular" viewBox="25 25 50 50">
                    <circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="2" stroke-miterlimit="10" />
                </svg>
            </div>
            <!-- ============================================================== -->
            <!-- Wrapper -->
            <!-- ============================================================== -->
            <div id="wrapper">
                <!-- ============================================================== -->
                <!-- Topbar header - style you can find in pages.scss -->
                <!-- ============================================================== -->
                <nav class="navbar navbar-default navbar-static-top m-b-0">
                    <div class="navbar-header">
                        <div class="top-left-part">
                            <!-- Logo -->
                            <a class="logo" href="#">
                                <!-- Logo icon image, you can use font-icon also -->
                                <b>
                                    <!--This is dark logo icon--><img src="<c:url value="/resources/picture/lo54b.png"></c:url>" alt="home" class="dark-logo" />
                                <!--This is light logo icon--><img src="<c:url value="/resources/plugins/images/admin-logo-dark.png"></c:url>" alt="home" class="light-logo" />
                                </b>
                                <!-- Logo text image you can use text also -->
                                <span class="hidden-xs">
                                        <!--This is dark logo text--><img src="<c:url value="/resources/plugins/images/admin-text.png"></c:url>" alt="home" class="dark-logo" />
                                <!--This is light logo text--><img src="<c:url value="/resources/plugins/images/admin-text-dark.png"></c:url>" alt="home" class="light-logo" />
                                </span> 
                            </a>
                        </div>
                        <!-- /Logo -->
                        <ul class="nav navbar-top-links navbar-right pull-right">
                            <li>
<!--                                <form role="search" class="app-search hidden-sm hidden-xs m-r-10">
                                    <input type="text" placeholder="Search..." class="form-control"> <a href=""><i class="fa fa-search"></i></a> </form>-->
                            </li>
                            <li>
                                    <a class="profile-pic" href="#"> <img src="<c:url value="/resources/plugins/images/users/gio.jpg"></c:url>" alt="user-img" width="36" class="img-circle"><b class="hidden-xs">${sessionScope.username }</b></a>
                            </li>
                        </ul>
                    </div>
                    <!-- /.navbar-header -->
                    <!-- /.navbar-top-links -->
                    <!-- /.navbar-static-side -->
                </nav>
                <!-- End Top Navigation -->
                <!-- ============================================================== -->
                <!-- Left Sidebar - style you can find in sidebar.scss  -->
                <!-- ============================================================== -->
                <div class="navbar-default sidebar" role="navigation">
                    <div class="sidebar-nav slimscrollsidebar">
                        <div class="sidebar-head">
                            <h3><span class="fa-fw open-close"><i class="fa fa-list fa-fw"></i></span> <span class="hide-menu">Navigation</span></h3>
                        </div>
                        <ul class="nav" id="side-menu">
                            <li style="padding: 70px 0 0;">
                                <a href="<c:url value='/dashboard' />" class="waves-effect"><i class="fa fa-clock-o fa-fw" aria-hidden="true"></i>Dashboard</a>
                        </li>
                        <!--                            <li>
                                                        <a href="profile.html" class="waves-effect"><i class="fa fa-user fa-fw" aria-hidden="true"></i>Profile</a>
                                                    </li>-->
                        <li>
                            <a href="<c:url value='/show_courses' />" class="waves-effect"><i class="fa fa-table fa-fw" aria-hidden="true"></i>Cours</a>
                        </li>
                        <li>
                            <a href="<c:url value='/show_locations' />" class="waves-effect"><i class="fa fa-font fa-fw" aria-hidden="true"></i>Villes</a>
                        </li>
                        <li>
                            <a href="<c:url value='/show_sessions' />" class="waves-effect"><i class="fa fa-globe fa-fw" aria-hidden="true"></i>Sessions</a>
                        </li>
                        <li>
                            <a href="<c:url value='/show_clients' />" class="waves-effect"><i class="fa fa-columns fa-fw" aria-hidden="true"></i>Clients</a>
                        </li>
                        <!--                        <li>
                                                    <a href="404.html" class="waves-effect"><i class="fa fa-info-circle fa-fw" aria-hidden="true"></i>Settings</a>
                                                </li>-->

                    </ul>
                    <!--                    <div class="center p-20">
                                            <a href="https://wrappixel.com/templates/ampleadmin/" target="_blank" class="btn btn-danger btn-block waves-effect waves-light">Upgrade to Pro</a>
                                        </div>-->
                </div>

            </div>