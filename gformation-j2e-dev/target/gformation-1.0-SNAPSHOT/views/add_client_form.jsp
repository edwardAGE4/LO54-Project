<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib  prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page session="false" %>
<jsp:include page="header.jsp" />

<div id="page-wrapper">
    <div class="container-fluid">
        <div class="row bg-title">
            <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
                <h4 class="page-title">Courses</h4> </div>
            <div class="col-lg-9 col-sm-8 col-md-8 col-xs-12">
                <a href="https://wrappixel.com/templates/ampleadmin/" target="_blank" class="btn btn-danger pull-right m-l-20 hidden-xs hidden-sm waves-effect waves-light">Ajouter</a>
                <ol class="breadcrumb">
                    <li><a href="#">Courses</a></li>
                    <li class="active">Ajouter une session</li>
                </ol>
            </div>
        </div>
        <!-- /.row -->
        <!-- .row -->
        <div class="row">
                <div class="col-md-offset-2 col-md-8 col-xs-12">
                    <div class="white-box">
                    <c:url var="addAction" value="/client/create"></c:url>
                    <form:form  class="form-horizontal form-material" action="${addAction}" commandName="client">
                        <c:if test="${!empty client.lastName}">
                            <div class="form-group">
                                <label class="col-md-12">Nom</label>
                                <div class="col-md-12">
                                    <form:hidden path="id"/>
                                    <form:input path="lastName"  placeholder="Nom" class="form-control form-control-line"/>
                                    <form:errors path="lastName" cssClass="error" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-12">Prenom </label>
                                <div class="col-md-12">
                                    <form:input path="firstName"  placeholder="Prenom" required="required"  class="form-control form-control-line"/>
                                    <form:errors path="firstName" cssClass="error" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-12">adrress</label>
                                <div class="col-md-12">
                                    <form:input path="adrress" placeholder="Veuillez saisir votre adresse" class="form-control form-control-line"/>
                                    <form:errors path="adrress" cssClass="error" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-12">Telephone</label>
                                <div class="col-md-12">
                                    <form:input path="phone" required="required"  placeholder="Veuillez saisir votre tel" class="form-control form-control-line"/>
                                    <form:errors path="phone" cssClass="error" />
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-md-12">Email</label>
                                <div class="col-md-12">
                                    <form:input path="email" type="email" required="required"  placeholder="Veuillez saisir votre mél" class="form-control form-control-line"/>
                                    <form:errors path="email" cssClass="error" />
                                </div>
                            </div>


                            <div class="form-group">
                                <label class="col-md-12">Session</label>
                                <div class="col-md-12">
                                    <form:select path="course_Session.id" class="form-control form-control-line" >
                                        <form:option value="-1"  label="Veuillez selectioner une session"/>
                                        <c:forEach items="${sessioncourse}" var="s" varStatus="status">
                                            <c:choose>
                                                <c:when test="${s.id eq course_Session.id}">
                                                    <form:option  value="${s.id}" selected="true"  label="${s.start_Date}-${s.end_Date}"/>
                                                </c:when>
                                                <c:otherwise>
                                                    <form:option  value="${s.id}"  label="${s.start_Date}-${s.end_Date}"/>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:forEach>
                                        <form:errors path="course_Session.id" cssClass="error" />
                                    </form:select>
                                </div>
                            </div>



                            <div class="form-group">
                                <div class="col-sm-12">
                                    <button class="btn btn-success">Modifier</button>
                                </div>
                            </div>
                        </c:if>
                        <c:if test="${empty client.lastName}">
                            <div class="form-group">
                                <label class="col-md-12">Nom</label>
                                <div class="col-md-12">
                                    <form:hidden path="id"/>
                                    <form:input path="lastName"  placeholder="Nom" class="form-control form-control-line"/>
                                    <form:errors path="lastName" cssClass="error" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-12">Prenom </label>
                                <div class="col-md-12">
                                    <form:input path="firstName"  placeholder="Prenom" required="required"  class="form-control form-control-line"/>
                                    <form:errors path="firstName" cssClass="error" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-12">adrress</label>
                                <div class="col-md-12">
                                    <form:input path="adrress" placeholder="Veuillez saisir votre adresse" class="form-control form-control-line"/>
                                    <form:errors path="adrress" cssClass="error" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-12">Telephone</label>
                                <div class="col-md-12">
                                    <form:input path="phone" required="required"  placeholder="Veuillez saisir votre tel" class="form-control form-control-line"/>
                                    <form:errors path="phone" cssClass="error" />
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-md-12">Email</label>
                                <div class="col-md-12">
                                    <form:input path="email" type="email" required="required"  placeholder="Veuillez saisir votre mél" class="form-control form-control-line"/>
                                    <form:errors path="email" cssClass="error" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-12">Session</label>
                                <div class="col-md-12">
                                    <form:select path="course_Session.id" class="form-control form-control-line">
                                        <form:option value="-1"  label="veuillez selectionner une session"/>
                                        <form:options items="${sessioncourse}" itemLabel="start_Date"   itemValue="id"/>
                                        <form:errors path="course_Session.id" cssClass="error" />
                                    </form:select>
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