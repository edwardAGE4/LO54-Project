<%-- 
    Document   : login_view
    Created on : Oct 14, 2018, 3:39:31 PM
    Author     : integrale
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib  prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<!DOCTYPE html>
<html lang="fr">

    <head>



        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta http-equiv="x-ua-compatible" content="ie=edge">   

        <title>Gformation Inscription</title>
        <!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.0/css/font-awesome.min.css"> -->


        <!-- Bootstrap core CSS -->

        <link type="text/css" rel="stylesheet" href='<c:url value="/resources/css/mycss/mdb.css"></c:url>' rel="stylesheet">
        <link type="text/css" rel="stylesheet" href='<c:url value="/resources/css/mycss/Contenu.css"></c:url>' rel="stylesheet">        
        <link type="text/css" rel="stylesheet" href='<c:url value="/resources/css/mycss/side_nav.css"></c:url>' rel="stylesheet">

            <link type="text/css" rel="stylesheet" href='<c:url value="/resources/css/mycss/bootstrap.min.css"></c:url>' rel="stylesheet">




            <!-- Template styles -->
            <style>
                /* TEMPLATE STYLES */

                html,
                body,
                .view {
                    height: 100%;
                    background-color: #dadada !important;
                }
                /* Navigation*/

                .bgW{
                    background-color: #fff !important;
                }

                .navbar {
                    background-color: transparent;
                }

                .scrolling-navbar {
                    -webkit-transition: background .5s ease-in-out, padding .5s ease-in-out;
                    -moz-transition: background .5s ease-in-out, padding .5s ease-in-out;
                    transition: background .5s ease-in-out, padding .5s ease-in-out;
                }

                .top-nav-collapse {
                    background-color: rgba(0,0,0, 0.9) !important;
                }

                footer.page-footer {
                    background-color: rgba(0,0,0, 0.9);
                    margin-top: 2rem;
                }

                @media only screen and (max-width: 768px) {
                    .navbar {
                        background-color: rgba(0,0,0, 0.9);
                    }
                }
                /*Call to action*/

                .flex-center {
                    color: #fff;
                }

                .view {

                    //background:  <c:url value="/resources/picture/formation.jpgs"></c:url> no-repeat center center fixed;
                    background: url('/gformation/resources/picture/formation.jpg') no-repeat fixed center  !important;           
                    background-color: dodgerblue;


                    -webkit-background-size: cover;
                    -moz-background-size: cover;
                    -o-background-size: cover;
                    background-size: cover;
                }

                /*Contact section*/

                #contact .fa {
                    font-size: 2.5rem;
                    margin-bottom: 1rem;
                    color: #1C2331;
                }
            </style>

        </head>

        <body>

            <!--Navbar-->
            <nav class="navbar navbar-dark navbar-fixed-top scrolling-navbar">

                <!-- Collapse button-->
                <button class="navbar-toggler hidden-sm-up" type="button" data-toggle="collapse" data-target="#collapseEx">
                    <i class="fa fa-bars"></i>
                </button>

                <div class="container">

                    <!--Collapse content-->
                    <div class="collapse navbar-toggleable-xs" id="collapseEx">
                        <!--Navbar Brand-->
                        <i class="navbar-brand" href="#" target="_blank">GFormation</i>
                        <!--Links-->
                        <ul class="nav navbar-nav smooth-scroll">

                            <li class="nav-item active" >
                                <a class="nav-link" target="_blank" href="<c:url value='/conne_xion' />" id="con" >Connection</span></a>

                        </li>


                    </ul>
                </div>
                <!--/.Collapse content-->

            </div>

        </nav>
        <!--/.Navbar-->

        <!--Mask-->
        <div class="view hm-black-strong">
            <div class="full-bg-img flex-center">
                <ul>
                    <li>
                        <div class="h1-responsive wow fadeInDown contain-lg ml3p  text-center " data-wow-delay="0.2s">
                            <img src="<c:url value="/resources/picture/LO54b.png"></c:url>" alt="edit" style="max-height:550px; height:300px; ">

                            </div><!--image d'acceuil end -->
                        </li>
                        <li>
                            <p class="wow fadeInDown">Bienvennu sur notre plateforme, informez vous sur nos activités et n'hésitez pas à nous contacter.</p>

                        </li>
                        <li>
                            <p><c:if test="${!empty success}">
                            <div class="alert alert-danger alert-dismissable">
                                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button> 
                                Inscription enregistrée avec succès.
                            </div>
                        </c:if></p>
                    </li>

                </ul>
            </div>
        </div>
        <!--/.Mask-->

        <!-- Main container-->
        <div class="container mb2">

            <!--Section: About-->
            <section id="about" class="text-xs-center wow bounceIn" data-wow-delay="0.2s">

                <div class="divider-new">
                    <h2 class="h2-responsive wow bounceIn">Sessions Disponibles</h2>

                </div>

                <div class="row">
                    <c:if test="${!empty listsessions}">
                        <c:forEach items="${listsessions}" var="coursesession">
                            <!--First columnn-->
                            <div class="mt1p col-xs-12 col-md-6 col-lg-4 ">
                                <!--Card-->
                                <div class="bgW borderL2 wow fadeInUp borderRadius">

                                    <!--Card content-->
                                    <div class="card-block text-xs-center">
                                        <!--Title-->
                                        <h3 class="card-title">Cours: ${coursesession.course.code}</h3>
                                        <hr>
                                        <!--Text-->

                                        <div class="col-xs-12 wow slideInUp" delay="0.4s">
                                            <p class="card-text text_justify"><strong>Ville:</strong> ${coursesession.location.city} </p>
                                            <p class="card-text text_justify"><strong>Début:</strong> ${coursesession.start_Date} </p>
                                            <p class="card-text text_justify"><strong>Fin:</strong> ${coursesession.end_Date}</p>
                                            <div class="col-xs-12 m-t-10">
                                                <a class="btn btn-primary bg-marron btn-sm btn-block text-uppercase waves-effect waves-light" href="#myModal" data-toggle="modal" onclick="code('${coursesession.id}', 1)">S'inscrir</a>
                                            </div>

                                            <br/>
                                        </div>
                                    </div>
                                    <!--/.Card content-->

                                </div>
                                <!--/.Card-->

                            </div>
                            <!--First columnn-->
                        </c:forEach>
                    </c:if>

                </div>

            </section>
            <!--Section: About-->


        </div>
        <!--/ Main container-->




        <?php echo $footer; ?>


        <!-- SCRIPTS -->

        <!-- JQuery -->
        <script src='<c:url value="/resources/js/myjs/jquery-2.2.3.min.js"></c:url>'></script>
                            <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCdppEFNeliRCxNUa7D_64GZLXYRWllkVY&libraries=places"></script>

            <!-- Bootstrap tooltips -->
            <script src='<c:url value="/resources/js/myjs/tether.min.js"></c:url>'></script>


            <!-- Bootstrap core JavaScript -->
            <script src='<c:url value="/resources/js/myjs/bootstrap.min.js"></c:url>'></script>

            <!-- MDB core JavaScript -->
            <script src='<c:url value="/resources/js/myjs/mdb.min.js"></c:url>'></script>

            <!--Google Maps-->
            <!-- <script src="http://maps.google.com/maps/api/js"></script> -->



            <!-- Animations init-->
            <script>
                                                    new WOW().init();
            </script>

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
            <script LANGUAGE="JavaScript">
                                                    //        function go(){
                                                    //            document.getElementById("connect").value='go';
                                                    //            alert( document.getElementById("connect").value);
                                                    //        }
                                                    function code(id, opera) {
                                                        document.confirmer_traitement.courseid.value = id;
                                                        //document.getElementById('idS').value = id;
                                                        if (opera == 1) {

//                                                            document.getElementById("info").style.display = 'block';
//                                                            document.getElementById("info2").style.display = 'none';
//                                                            document.getElementById("info3").style.display = 'none';
//
//                                                            document.getElementById("sup").style.display = 'block';
//                                                            document.getElementById("blocker").style.display = 'none';

                                                        }
                                                    }

            </script>
             
    <script>

                                                    function initialize() {

                                                        var input = document.getElementById('ad');

                                                        var autocomplete = new google.maps.places.Autocomplete(input);

                                                        google.maps.event.addListener(autocomplete, 'place_changed', function () {
                                                            var place = autocomplete.getPlace();
                                                            if (!place.geometry) {
                                                                return;
                                                            }

                                                            var geolocation = {
                                                                lat: autocomplete.getPlace().geometry.location.lat(),
                                                                lng: autocomplete.getPlace().geometry.location.lng()
                                                            };

                                                            var circle = new google.maps.Circle({
                                                                center: geolocation,
                                                                radius: 300000
                                                            });
                                                            //autocomplete2.setBounds(circle.getBounds());



                                                        });

                                                    }
    </script>
    <script>
        google.maps.event.addDomListener(window, 'load', initialize);
    </script>
        </body>
        <div class="col-xs-8">
            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" tabindex="-1" >

            <c:url var="addAction" value="/"></c:url>
            <form:form name="confirmer_traitement" id= "confirmer_traitement"  class="form-horizontal form-material" action="${addAction}" commandName="client">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                            <h3 class="modal-title" id="myModalLabel">S'inscrire</h3>
                        </div>
                        <center>
                            <div  class="modal-body">

                                <div class="form-group">
                                    <label class="col-xs-3">Nom</label>
                                    <div class="col-xs-8">
                                        <form:hidden path="id"/>
                                        <form:input path="lastName"  placeholder="Nom" class="form-control form-control-line"/>
                                        <form:errors path="lastName" cssClass="error" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-xs-3">Prenom </label>
                                    <div class="col-xs-8">
                                        <form:input path="firstName"  placeholder="Prenom" required="required"  class="form-control form-control-line"/>
                                        <form:errors path="firstName" cssClass="error" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-xs-3">adrress</label>
                                    <div class="col-xs-8">
                                        <form:input path="adrress" id='ad' autocomplete="off" placeholder="Veuillez saisir votre adresse" class="form-control form-control-line"/>
                                        <form:errors path="adrress" cssClass="error" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-xs-3">Telephone</label>
                                    <div class="col-xs-8">
                                        <form:input path="phone" required="required"  placeholder="Veuillez saisir votre tel" class="form-control form-control-line"/>
                                        <form:errors path="phone" cssClass="error" />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-xs-3">Email</label>
                                    <div class="col-xs-8">
                                        <form:input path="email" type="email" required="required"  placeholder="Veuillez saisir votre mél" class="form-control form-control-line"/>
                                        <form:errors path="email" cssClass="error" />
                                    </div>
                                </div>
                                <div class="form-group hidden hidden-xs">
                                    <label class="col-xs-3">Session</label>

                                    <input type="hidden" name="courseid"  value="">

                                </div> 

                            </div>
                        </center>

                        <div class="modal-footer">

                            <div id="sup">
                                <button class="btn" data-dismiss="modal" aria-hidden="true" ><i class="icon-chevron-left icon-white"></i> Annuler</button>
                                <input type="submit"  class="btn btn-primary" name="supprimer" value="Valider"/>
                            </div>

                        </div>
                    </div>
                </div>
            </form:form>
        </div>
    </div>
 
   
</html>