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
                    <c:url var="addAction" value="/course_session/create"></c:url>
                    <form:form  class="form-horizontal form-material" action="${addAction}" commandName="coursesession">
                        <c:if test="${!empty coursesession.start_Date}">
                            <div class="form-group">
                                <label class="col-md-12">Date debut </label>
                                <div class="col-md-12">
                                     <form:hidden path="id"/>
                                    <form:input path="start_Date" id="start_Date"  placeholder="Date debut" class="form-control form-control-line"/>
                                        <form:errors path="start_Date" cssClass="error" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-12">Date fin</label>
                                <div class="col-md-12">
                                    <form:input path="end_Date" id="end_Date"  placeholder="Date Fin"  class="form-control form-control-line"/>
                                    <form:errors path="end_Date" cssClass="error" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-12">Max</label>
                                <div class="col-md-12">
                                    <form:input path="max_register" placeholder="Veuillez saisir un nombre max" class="form-control form-control-line"/>
                                      <form:errors path="max_register" cssClass="error" />
                                </div>
                            </div>
                                
                             <div class="form-group">
                                <label class="col-md-12">Cours</label>
                                <div class="col-md-12">
                                    <form:select path="course.code" class="form-control form-control-line" >
                                        <form:option value="-1"  label="Veuillez selectioner un cours"/>
                                       <c:forEach items="${listecourses}" var="s" varStatus="status">
                                            <c:choose>
                                                <c:when test="${s.code eq course.code}">
                                                    <form:option  value="${s.code}" selected="true"  label="${s.code}"/>
                                                </c:when>
                                                <c:otherwise>
                                                     <form:option  value="${s.code}"  label="${s.code}"/>
                                                </c:otherwise>
                                            </c:choose> 
                                        </c:forEach>
                                        <form:errors path="course.code" cssClass="error" />
                                    </form:select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-md-12">Ville</label>
                                <div class="col-md-12">
                                    <form:select path="location.id" class="form-control form-control-line">
                                        <form:option value="-1"  label="veuillez selectionner une ville"/>
                                        <c:forEach items="${listelocations}" var="s" varStatus="status">
                                            <c:choose>
                                                <c:when test="${s.id eq location.id}">
                                                    <form:option  selected="true" value="${s.id}"  label="${s.city}"/>
                                                </c:when>
                                                <c:otherwise>
                                                    <form:option  value="${s.id}"  label="${s.city}"/>
                                                </c:otherwise>
                                            </c:choose> 
                                        </c:forEach>
                                        <form:errors path="location.id" cssClass="error" />
                                    </form:select>
                                </div>
                            </div>

                       <div class="form-group">
                                <div class="col-sm-12">
                                    <button class="btn btn-success">Modifier</button>
                                </div>
                            </div>   
                        </c:if>
                        <c:if test="${empty coursesession.start_Date}">
                            <div class="form-group">
                                <label class="col-md-12">Date debut </label>
                                <div class="col-md-12">
                                     <form:hidden path="id"/>
                                    <form:input path="start_Date" id="start_Date" autocomplete="off"    placeholder="Date debut" class="form-control form-control-line"/>
                                        <form:errors path="start_Date" cssClass="error" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-12">Date fin</label>
                                <div class="col-md-12">
                                    <form:input path="end_Date" id="end_Date"  placeholder="Date Fin" autocomplete="off"  class="form-control form-control-line"/>
                                    <form:errors path="end_Date" cssClass="error" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-12">Max</label>
                                <div class="col-md-12">
                                    <form:input path="max_register" placeholder="Veuillez saisir un nombre max" class="form-control form-control-line"/>
                                      <form:errors path="max_register" cssClass="error" />
                                </div>
                            </div>
                                
                             <div class="form-group">
                                <label class="col-md-12">Cours</label>
                                <div class="col-md-12">
                                    <form:select path="course.code" class="form-control form-control-line" >
                                        <form:option value="-1"  label="Veuillez selectioner un cours"/>
                                        <form:options items="${listecourses}" itemLabel="code"  itemValue="code"  />
                                        <form:errors path="course.code" cssClass="error" />
                                    </form:select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-md-12">Ville</label>
                                <div class="col-md-12">
                                    <form:select path="location.id" class="form-control form-control-line">
                                        <form:option value="-1"  label="veuillez selectionner une ville"/>
                                        <form:options items="${listelocations}" itemLabel="city"   itemValue="id"/>
                                        <form:errors path="location.id" cssClass="error" />
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