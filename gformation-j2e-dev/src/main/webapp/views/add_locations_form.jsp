<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib  prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page session="false" %>
<jsp:include page="header.jsp" />

<div id="page-wrapper">
    <div class="container-fluid">
        <div class="row bg-title">
            <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
                <h4 class="page-title">Locations</h4> </div>
            <div class="col-lg-9 col-sm-8 col-md-8 col-xs-12">
                <a href="https://wrappixel.com/templates/ampleadmin/" target="_blank" class="btn btn-danger pull-right m-l-20 hidden-xs hidden-sm waves-effect waves-light">Ajouter</a>
                <ol class="breadcrumb">
                    <li><a href="#">Locations</a></li>
                    <li class="active">Ajouter une location</li>
                </ol>
            </div>
        </div>
        <!-- /.row -->
        <!-- .row -->
        <div class="row">
                <div class="col-md-offset-2 col-md-8 col-xs-12">
                    <div class="white-box">
                    <c:url var="addAction" value="/location/add" ></c:url>
                    <form:form  class="form-horizontal form-material" action="${addAction}" commandName="location">
                        <c:if test="${!empty location.city}">
                            <form:hidden path="id" />
                            <div class="form-group">
                                <label class="col-md-12">Ville</label>
                                <div class="col-md-12">
                                    <form:input path="city" id='city' placeholder="Veuillez saisir une ville" class="form-control form-control-line"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-12">
                                    <button class="btn btn-success">Modifier</button>
                                </div>
                            </div>
                        </c:if>
                        <c:if test="${empty location.city}">
                            <form:hidden path="id" />
                            <div class="form-group">
                                <label class="col-md-12">Ville</label>
                                <div class="col-md-12">
                                    <form:input path="city" id='city' placeholder="Veuillez saisir une ville" class="form-control form-control-line"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-12">
                                    <button class="btn btn-success">Ajouter</button>
                                </div>
                            </div>
                        </c:if>
                    </form:form>
                </div>
            </div>
        </div>
        <!-- /.row -->
    </div>
    <!-- /.container-fluid -->
    <footer class="footer text-center"> 2017 &copy; Ample Admin brought to you by wrappixel.com </footer>
</div>
<!-- /#page-wrapper -->
</div>
<jsp:include page="footer.jsp" />