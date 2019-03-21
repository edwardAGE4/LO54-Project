    <%-- 
    Document   : login_view
    Created on : Oct 14, 2018, 3:39:31 PM
    Author     : integrale
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib  prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>  
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Connexion</title>
        <!-- Bootstrap Core CSS -->
        <link href='<c:url value="/resources/bootstrap/dist/css/bootstrap.min.css"></c:url>' rel="stylesheet">
        <!-- animation CSS -->
        <link href='<c:url value="/resources/css/animate.css"></c:url>' rel="stylesheet">
    <!-- Custom CSS -->
    <link href='<c:url value="/resources/css/style.css"></c:url>' rel="stylesheet">
<!-- color CSS -->
<link href='<c:url value="/resources/css/colors/default.css"></c:url>' id="theme" rel="stylesheet">
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->

</head>
<body>
    <!-- Preloader -->
    <div class="preloader">
        <div class="cssload-speeding-wheel"></div>
    </div>
    <section id="wrapper" class="new-login-register" style="background: url('/gformation/resources/picture/formation.jpg') no-repeat fixed center !important;  ">
        <div class="lg-info-panel" style="background: url('/gformation/resources/picture/confrm.jpg') repeat fixed  !important;  ">
            <div class="inner-panel" style="background-image: <c:url value="/resources/plugins/images/login-register.jpg"></c:url>">
                
                <div class="lg-content">
                    <h2>GFORMATION</h2>
                    <p class="text-muted">L'autre façon d'apprendre</p>
                   
                </div>
            </div>
        </div>
        <div class="borderRadius new-login-box ">
            <div class="white-box borderRadius">
                <h3 class="box-title m-b-0">Connectez-vous</h3>
                <small>Entrez vos details de connexion</small>
                <c:if test="${!empty success}">
                        <div class="alert alert-danger alert-dismissable">
                                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button> 
                               Login ou mot de passe incorrect.
                        </div>
                    </c:if>
                <c:url var="addAction" value="/login"></c:url>
                <form class="form-horizontal new-lg-form" id="loginform" method='post' action="${addAction}">

                    <div class="form-group  m-t-20">
                        <div class="col-xs-12">
                            <label>Email </label>
                            <input class="form-control" name="username" type="text" required="" placeholder="Enail">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-xs-12">
                            <label>Mot de passe</label>
                            <input class="form-control" name="password" type="password" required="" placeholder="Mot de passe">
                        </div>
                    </div>

                    <div class="form-group text-center m-t-20">
                        <div class="col-xs-12">
                            <button class="btn btn-info btn-lg btn-block btn-rounded text-uppercase waves-effect waves-light" type="submit">Connexion</button>
                        </div>
                    </div>

                </form>
                <form class="form-horizontal" id="recoverform" action="index.html">
                    <div class="form-group ">
                        <div class="col-xs-12">
                            <h3>Recover Password</h3>
                            <p class="text-muted">Enter your Email and instructions will be sent to you! </p>
                        </div>
                    </div>
                    <div class="form-group ">
                        <div class="col-xs-12">
                            <input class="form-control" type="text" required="" placeholder="Email">
                        </div>
                    </div>
                    <div class="form-group text-center m-t-20">
                        <div class="col-xs-12">
                            <button class="btn btn-primary btn-lg btn-block text-uppercase waves-effect waves-light" type="submit">Reset</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>            


    </section>
   <script src='<c:url value="/resources/plugins/bower_components/jquery/dist/jquery.min.js"></c:url>'></script>
    <!-- Bootstrap Core JavaScript -->
    <script src='<c:url value="/resources/bootstrap/dist/js/bootstrap.min.js"></c:url>'></script>
    <!-- Menu Plugin JavaScript -->
    <script src='<c:url value="/resources/plugins/bower_components/sidebar-nav/dist/sidebar-nav.min.js"></c:url>'></script>
    <!--slimscroll JavaScript -->
    <script src='<c:url value="/resources/js/jquery.slimscroll.js"></c:url>'></script>

    <!--Wave Effects -->
    <script src='<c:url value="/resources/js/waves.js"></c:url>'></script>
    <!-- Custom Theme JavaScript -->
     <script src='<c:url value="/resources/js/custom.min.js"></c:url>'></script>
    <!--Style Switcher -->
    <script src='<c:url value="/resources/plugins/bower_components/styleswitcher/jQuery.style.switcher.js"></c:url>'></script>
    
</body>
</html>

