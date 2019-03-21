<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib  prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page session="false" %>
<jsp:include page="header.jsp" />

<div id="page-wrapper">
    <div class="container-fluid">
        <div class="row bg-title">
            <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
                <h4 class="page-title">Dashboard</h4> </div>
            <div class="col-lg-9 col-sm-8 col-md-8 col-xs-12">
                <a href="<c:url value='/course_session/new' />" target="_blank" class="btn btn-danger pull-right m-l-20 hidden-xs hidden-sm waves-effect waves-light">Ajouter une session</a>
                <ol class="breadcrumb">
                    <li><a href="#">Dashboard</a></li>
                </ol>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->
        <!-- ============================================================== -->
        <!-- Different data widgets -->
        <!-- ============================================================== -->
        <!-- .row -->

        <div class="row">
            <div class="col-md-12 col-lg-12 col-sm-12">
                <div class="white-box">
                    <div class="col-md-3 col-sm-4 col-xs-6 pull-right">
<!--                        <select class="form-control pull-right row b-none">
                            <option>March 2017</option>
                            <option>April 2017</option>
                            <option>May 2017</option>
                            <option>June 2017</option>
                            <option>July 2017</option>
                        </select>-->
                            <div class="progress progress-lg">
                                <div class="progress-bar progress-bar-danger" style="width: ${pourcentage}%;" role="progressbar">${pourcentage}%</div>
                            </div>
                    </div>
                    <h3 class="box-title">Les Clients par sessions</h3>
                    <div class="table-responsive">
                        <table id="example23" class="display nowrap" cellspacing="0" width="100%">
                            <thead>
                                <tr>
                                     <th>ID</th>
                                        <th>Nom</th>
                                        <th>Prenom</th>
                                        <th>Adresse</th>
                                        <th>Telephone</th>
                                        <th>Email</th>
                                        <th>Titre</th>
                                        <th>Date Debut</th>
                                        <th>Date Fin</th>
                                        <th>Ville</th>
                                        
                                </tr>
                            </thead>
                            <tbody>
                              <c:forEach items="${clients}" var="client">

                                        <tr>
                                            <td>${client.id}</td>
                                            <td>${client.lastName}</td>
                                            <td>${client.firstName}</td>
                                            <td>${client.adrress}</td>
                                            <td>${client.phone}</td>
                                            <td>${client.email}</td>
                                            <td>${client.course_Session.course.code}</td>
                                            <td>${client.course_Session.start_Date}</td>
                                            <td>${client.course_Session.end_Date}</td>
                                            <td>${client.course_Session.location.city}</td>

                                           
                                               
                                        </tr>
                                    </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <!-- ============================================================== -->
        <!-- chat-listing & recent comments -->
        <!-- ============================================================== -->
        <div class="row">

        </div>
    </div>
    <!-- /.container-fluid -->
    <footer class="footer text-center"> 2018 &copy; Gformation </footer>
</div>
<!-- ============================================================== -->
<!-- End Page Content -->
<!-- ============================================================== -->
</div>
<jsp:include page="footer.jsp" />