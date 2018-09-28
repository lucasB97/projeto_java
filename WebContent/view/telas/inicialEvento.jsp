<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
  
<!DOCTYPE html>
<html>
<head>
   <title>HOME</title>
   <c:import url="/view/linkcss.jsp" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="/view/bootstrap/css/bootstrap.min.css">
    <script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
    <script src="/view/bootstrap/js/bootstrap.min.js"></script>
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
     <meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="http://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet">
    
<c:import url="../comum/navbarUsuario.jsp" />

<div class="container">   
    <div class="row">
        <div class="col-md-6 col-md-offset-3 p-t-30">
            <!-- Nav tabs category -->
            <div class="center"><h1>Bem vindo, ${usuarioLogado.nome}!</h1></div>
            <!-- Teste de alerta, qualquer coisa é só tirar Ass: Ed -->
					<c:if test="${msg != null }">
						<div class="alert alert-success">
					      <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
					      <span><strong> Parabéns:</strong> ${msg} </span>
					    </div>
					</c:if>
            <ul class="nav nav-tabs faq-cat-tabs">
                <li class="active"><a href="#faq-cat-1" data-toggle="tab">Eventos</a></li>
                <li><a href="#faq-catative-2" data-toggle="tab">Atividades</a></li>
            </ul>
    
            <!-- Tab panes / começo -->
            <div class="tab-content faq-cat-content">
                <div class="tab-pane active" id="faq-cat-1">
                    <div class="panel-group" id="accordion-cat-1">
                      <!-- Painel a ser impresso -->
                       <c:forEach var="evento" items="${listaEventos}" varStatus="id">
                        <div class="panel panel-default panel-faq">
                            <div class="panel-heading">
                                <a data-toggle="collapse" data-parent="#accordion-cat-1" href="#faq-cat-${id.count}-sub-1">
                                    <h4 class="panel-title">
                                        ${evento.nome }
                                        <span class="pull-right"><i class="glyphicon glyphicon-plus"></i></span>
                                    </h4>
                                </a>
                            </div>
                            <div id="faq-cat-${id.count}-sub-1" class="panel-collapse collapse">
                                <div class="panel-body">
                                    <div  id="Eventos" style="display: block;">
                                      <div id="eventdi">
                                      <div id="eventdiv">
                                          <c:choose>
                                            <c:when test="${not empty evento.foto }">
                                                <img src="view/img/eventos/${evento.foto}" height="50" width="50">
                                            </c:when>
                                            <c:otherwise>
                                                <img src="view/img/123.png" height="70" width="70">
                                            </c:otherwise>
                                          </c:choose>
                                             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                <b>${evento.nome}</b><br><hr>
                                                <p style="color:black;">${evento.descricao}</p>
                                      </div>
                                                <hr id="q"> 
                                       <table class="table table-striped custab">
                                            <thead>
                                                <tr>
                                                    <th>Atividades</th>
                                                    <th>Data</th>
                                                    <th>Hora</th>
                                                    <th></th>
                                                </tr>
                                            </thead>
                                            <c:forEach var="atividade" items="${listaAtividades}">
                                                <c:if test="${evento.id == atividade.id_evento }">
                                                    <tr>
                                                        <td>${atividade.nome}</td>
                                                        <td><fmt:formatDate value="${atividade.data}" pattern="dd/MM/yyyy"/></td>
                                                        <td>${atividade.horaInicio}</td>
                                                        <c:if test="${usuarioLogado.idTipoUsuario != 3}">
                                                         <c:choose>
                                                         	<c:when test="${atividade.matriculado != 1 }">
                                                        		<td><a href="participarAtividade?id=${atividade.id}"><button class="btn btn-success">Participar</button></a></td>
                                                   			 </c:when>
                                                   			 <c:otherwise>
                                                   			 	<td><button class="btn btn-secondary" style="width:91px;" disabled="disabled">Participar</button></td>
                                                   			 </c:otherwise>
                                                         </c:choose>
                                                        </c:if> 
                                                    </tr>
                                                </c:if>
                                             </c:forEach>
                                      </table>
                               </div>
                                </div>
                            </div>
                        </div>
                    </div>
                  </c:forEach>
                </div>
                </div>
                <div class="tab-pane fade" id="faq-catative-2">
                    <div class="panel-group" id="accordion-catative-2">
                        <div class="panel panel-default panel-faq">
                            <div class="panel-heading">
                                <a data-toggle="collapse" data-parent="#accordion-catative-2" href="#faq-catative-2-sub-1">
                                    <h4 class="panel-title">
                                       Minhas Atividades
                                        <span class="pull-right"><i class="glyphicon glyphicon-plus"></i></span>
                                    </h4>
                                </a>
                            </div>
                            <div id="faq-catative-2-sub-1" class="panel-collapse collapse">
                                <div class="panel-body">
                                <div id="Atividades">
					            <table class="table table-striped custab">
					            	<c:forEach var="atividadeUsu" items="${listaAtividades}">
					            		<c:if test="${usuarioLogado.idTipoUsuario == 3 && usuarioLogado.id == atividadeUsu.id_orientador}">
					            			<tr>
					                           <th>${atividadeUsu.nome}</th>
					                           <th>
					                             <div class="pull-right">
                                                 	<a href="alterarAtividade?id=${atividadeUsu.id}"><button class="btn btn-warning "> <span class="glyphicon glyphicon-pencil"></span></button></a>
                                                 	<a href="removerAtividade?id=${atividadeUsu.id}"><button class="btn btn-danger" data-toggle="modal" data-target="#confirm"> <span class="glyphicon glyphicon-remove"></span></button></a>
                                                </div>
					                           </th>
					                       </tr>
					            		</c:if>
					                	<c:if test="${atividadeUsu.matriculado == 1}">
					                       <tr>
					                           <th>${atividadeUsu.nome}</th>
					                           <th>
					                              <a href="cancelarAtividade?id=${atividadeUsu.id}"><button class="btn btn-danger">Cancelar</button></a>
					                           </th>
					                       </tr>
					                	</c:if>
					            	</c:forEach>
					            </table>
                                </div>
                            </div>
                         </div>
                      </div>
                   </div>
                 </div>
               </div>
            </div>
          </div>
        </div>

                    <!-- Fim atividades -->

                </div>
            </div>
                   
<script type="text/javascript">
$(document).ready(function() {
    $('.collapse').on('show.bs.collapse', function() {
        var id = $(this).attr('id');
        $('a[href="#' + id + '"]').closest('.panel-heading').addClass('active-faq');
        $('a[href="#' + id + '"] .panel-title span').html('<i class="glyphicon glyphicon-minus"></i>');
    });
    $('.collapse').on('show.bs.collapse', function() {
        var id = $(this).attr('id');
        $('a[href="#' + id + '"]').closest('.panel-heading').removeClass('active-faq');
        $('a[href="#' + id + '"] .panel-title span').html('<i class="glyphicon glyphicon-plus"></i>');
    });
});
</script>
<c:import url="/view/linkjs.jsp" />
</body>
</html>
