<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib  prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page session="false" %>
<jsp:include page="header.jsp" />

<div id="page-wrapper">
    <div class="container-fluid">
        <div class="row bg-title">
            <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
                <h4 class="page-title">Clients</h4> </div>
            <div class="col-lg-9 col-sm-8 col-md-8 col-xs-12">
                <a href="<c:url value='/client/new' />" class="btn btn-danger pull-right m-l-20 hidden-xs hidden-sm waves-effect waves-light">Ajouter un client

                </a>
                <ol class="breadcrumb">
                    <li><a href="#">Clients</a></li>
                    <li class="active">Liste des Clients</li>
                </ol>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /row -->
        <div class="row">
            <div class="col-sm-12">
                <div class="white-box">
                    <h3 class="box-title">Clients</h3>

                    <c:if test="${!empty success}">
                        <div class="alert alert-danger alert-dismissable">
                                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button> 
                                opération éffectuée avec succès.
                        </div>
     
                    </c:if>
                    <div class="table-responsive">
                        <c:if test="${!empty clients}">
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
                                        <th>Actions</th>
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

                                            <td>
                                                <div class="btn-group">

                                                    <a href="<c:url value='/client/edit/${client.id}' />"><img src="<c:url value="/resources/icons/modif.png"></c:url>" alt="edit"></a>
<!--                                                    <a href=""><img src="<c:url value="/resources/icons/detail.png"></c:url>" alt="details"></a>-->
                                                    <a class="btn" href="#myModal" data-toggle="modal" onclick="code('${client.id}', 1)"><img src="<c:url value="/resources/icons/suppr.png"></c:url>" alt="supprimer"></a>

                                                    </div>

                                                </td>
                                        </tr>
                                    </c:forEach>



                                </tbody>
                            </table>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
        <!-- /.row -->
    </div>
    <!-- /.container-fluid -->
    <footer class="footer text-center"> 2017 &copy; Ample Admin brought to you by wrappixel.com</footer>
</div>
<!-- /#page-wrapper -->
</div>

<script LANGUAGE="JavaScript">
    function code(id, opera) {
        document.confirmer_traitement.id.value = id;
        if (opera == 1) {

            document.getElementById("info").style.display = 'block';
            document.getElementById("info2").style.display = 'none';
            document.getElementById("info3").style.display = 'none';

            document.getElementById("sup").style.display = 'block';
            document.getElementById("blocker").style.display = 'none';

        }
    }

</script>
<div class="col-xs-6">
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" tabindex="-1" >
        <form  name="confirmer_traitement" id= "confirmer_traitement" action="" method="post">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        <h3 class="modal-title" id="myModalLabel">Supprimer</h3>
                    </div>
                    <center><div  class="modal-body">
                            <input type="hidden" name="id"  value="">
                            <h4 class="modal-title" id="info"><i class="icon-remove-sign"></i> Vous êtes sur le point de supprimer cette ligne.</h4>

                        </div></center>

                    <div class="modal-footer">

                        <div id="sup">
                            <button class="btn" data-dismiss="modal" aria-hidden="true" ><i class="icon-chevron-left icon-white"></i> Annuler</button>
                            <input type="submit"  class="btn btn-primary" name="supprimer" value="Valider"/>
                        </div>

                    </div>
                </div>
            </div>
        </form>
    </div>
</div>
<jsp:include page="footer.jsp" />