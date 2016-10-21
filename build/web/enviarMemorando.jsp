<%-- 
    Document   : cadastrarSetor
    Created on : 18/10/2016, 18:02:48
    Author     : casa01
--%>

<%@page import="java.util.List"%>
<%@page import="br.edu.ifpe.memorando.db.SetorDao"%>
<%@page import="br.edu.ifpe.memorando.models.Setor"%>
<%@page import="br.edu.ifpe.memorando.models.Status"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/memorando.css">
        <!-- Bootstrap core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <title>Memorando</title>
    </head>
    <body>
        <!-- Fixed navbar -->
    <nav class="navbar navbar-default">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="index.jsp">Memorando</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav">
            <li><a href="index.jsp">Home</a></li>
            <li><a href="/memorando/CadastrarSetor">Cadastrar Setor</a></li>
            <li class="active"><a href="/memorando/EnviarMemorando">Enviar Memorando </a></li>
            <li><a href="/memorando/ListarMemorandos">Listar Memorandos </a></li>
            
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </nav>

        <h3>${msg}</h3>
        <div class="container">
            <h3>Enviar Memorando</h3>
            <form  action="EnviarMemorando" method="POST" class="form-horizontal">
                Numero: ${memorando.numero}<br/>
                <div class="form-group">
                    <span class="col-md-4">
                     <input type="text" class="form-control" name="assunto" placeholder="Assunto" aria-describedby="basic-addon1">
                    </span>
                </div>
                <div class="form-group">
                    <span class="col-md-4">
                        <textarea  class="form-control" rows="4" cols="50" name="mensagem" placeholder="Mensagem" aria-describedby="basic-addon1"></textarea>
                    </span>
                </div>
                <div class="form-group">
                    <span class="col-md-4">
                Status: <select name="status" class="form-control">
                            <% 
                                for(Status s: Status.values()){%>
                                <option value="<%=s.getCodigo()%>"><%=s.getLabel()%></option>
                            <%

                                }
                            %>

                        </select>
                    </span>
                </div>
                <div class="form-group">
                   <span class="col-md-4">
                Tipo:<select name="tipo" class="form-control">
                            <option value="0">Circular</option>
                            <option value="1">Requisição</option>
                        </select><br/>
                Setor Origem: <select name="setorOrigem" class="form-control">
                            <%
                                SetorDao sDao = new SetorDao();
                                List<Setor> list = sDao.findAll();


                                for(Setor setor: list){
                            %>
                            <option value="<%=setor.getSigla()%>"><%=setor.getSigla()%></option>
                            <%

                                }
                            %>
                        </select>
                   </span>
                </div>
                         <div class="form-group">
                    <span class="col-md-4">
                Setor Destino: <select name="setorDestino" class="form-control">
                            <option value="todos">Todos</option>
                            <%
                                List<Setor> listDestino = sDao.findAll();


                                for(Setor setor: listDestino){
                            %>
                            <option value="<%=setor.getSigla()%>"><%=setor.getSigla()%></option>
                            <%

                                }
                            %>
                        </select>
                    </span>
                </div>
               <input type="submit" value="Inserir" class="btn btn-default">
            </form>
        </div>
    </body>
</html>
