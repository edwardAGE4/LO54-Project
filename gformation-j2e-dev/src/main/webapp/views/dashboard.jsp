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
            <div class="col-lg-4 col-sm-6 col-xs-12">
                <div class="white-box analytics-info">
                    <h3 class="box-title">Total Cours</h3>
                    <ul class="list-inline two-part">
                        <li>
                            <div id="sparklinedash"></div>
                        </li>
                        <li class="text-right"><i class="fa fa-book fa-fw"></i> <span class="counter text-success">${fn:length(listcours)}</span></li>
                    </ul>
                </div>
            </div>
            <div class="col-lg-4 col-sm-6 col-xs-12">
                <div class="white-box analytics-info">
                    <h3 class="box-title">Total sessions</h3>
                    <ul class="list-inline two-part">
                        <li>
                            <div id="sparklinedash2"></div>
                        </li>
                        <li class="text-right"><i class="fa fa-table fa-fw"></i> <span class="counter text-purple">${fn:length(listsessions)}</span></li>
                    </ul>
                </div>
            </div>
            <div class="col-lg-4 col-sm-6 col-xs-12">
                <div class="white-box analytics-info">
                    <h3 class="box-title">Total clients</h3>
                    <ul class="list-inline two-part">
                        <li>
                            <div id="sparklinedash3"></div>
                        </li>
                        <li class="text-right"><i class="fa fa-user fa-fw"></i> <span class="counter text-info">${fn:length(listclients)}</span></li>
                    </ul>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-12 col-lg-12 col-sm-12">
                <div class="white-box">
                    <div class="col-md-3 col-sm-4 col-xs-6 pull-right">
                        <select class="form-control pull-right row b-none">
                            <option>March 2017</option>
                            <option>April 2017</option>
                            <option>May 2017</option>
                            <option>June 2017</option>
                            <option>July 2017</option>
                        </select>
                    </div>
                    <h3 class="box-title">Les Sessions</h3>
                    <div class="table-responsive">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Date debut</th>
                                    <th>Date Fin</th>
                                    <th>Max</th>
                                    <th>Cours</th>
                                    <th>Ville</th>
<!--                                    <th>Progression</th>-->

                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${listsessions}" var="coursesession">

                                    <tr>
                                        <td>${coursesession.id}</td>
                                        <td>${coursesession.start_Date}</td>
                                        <td>${coursesession.end_Date}</td>
                                        <td>${coursesession.max_register}</td>
                                        <td>${coursesession.course.code}</td>
                                        <td>${coursesession.location.city}</td>
<!--                                        <td>
                                            <div class="progress progress-lg">
                                                <div class="progress-bar progress-bar-success" style="width: 75%;" role="progressbar">75%</div>
                                            </div>
                                        </td>-->

                                        <td>
                                            <div class="btn-group">

                                                <a href="<c:url value='/sessions/clients/${coursesession.id}' />"><img src="<c:url value="/resources/icons/detail.png"></c:url>" alt="edit"></a>


                                                </div>

                                            </td>
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