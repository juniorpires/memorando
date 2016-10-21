<%-- 
    Document   : cadastrarSetor
    Created on : 18/10/2016, 18:02:48
    Author     : casa01
--%>

<%@page import="java.util.List"%>
<%@page import="br.edu.ifpe.memorando.db.SetorDao"%>
<%@page import="br.edu.ifpe.memorando.models.Setor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
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
            <li ><a href="index.jsp">Home</a></li>
            <li class="active"><a href="/memorando/CadastrarSetor">Cadastrar Setor</a></li>
            <li><a href="/memorando/EnviarMemorando">Enviar Memorando </a></li>
            <li><a href="/memorando/ListarMemorandos">Listar Memorandos </a></li>
            
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </nav>

        <h3>${msg}</h3>
        <div class="container">
        <h3>Cadastrar Setor</h3>
        <form  action="CadastrarSetor" method="POST" class="form-horizontal">
            <div class="form-group">
                <span class="col-md-4">
                 <input type="text" class="form-control" name="nome" placeholder="Nome" aria-describedby="basic-addon1">
                </span>
            </div>
            <div class="form-group">
                <span class="col-md-4">
                 <input type="text" class="form-control" name="sigla" placeholder="Sigla" aria-describedby="basic-addon1">
                </span>
            </div>
            <div class="form-group">
                <span class="col-md-4">
                 <input type="password" class="form-control" name="senha" placeholder="Senha" aria-describedby="basic-addon1">
                </span>
            </div>

           <input type="submit" class="btn btn-default" value="Inserir">
        </form>
        </div>
        <br/>
        <br/>
        <br/>
        <br/>
        <br/>
        <table class="table table-striped">
            
            <tr>
                <th>Nome</th>
                <th>Sigla</th>
            </tr>
            <%
                SetorDao dao = new SetorDao();
                List<Setor> list = dao.findAll();
                
                if(list.size()!=0){
                
                for(Setor setor: list){
            %>
            <tr>
                <td><%= setor.getNome()%></td>
                <th><%= setor.getSigla() %> </th>
               
            </tr>
                <%
                }
            }   
                
            %>
            
        </table>
    </body>
</html>
