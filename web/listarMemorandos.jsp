<%-- 
    Document   : cadastrarSetor
    Created on : 18/10/2016, 18:02:48
    Author     : casa01
--%>

<%@page import="br.edu.ifpe.memorando.db.MemorandoDao"%>
<%@page import="java.util.List"%>
<%@page import="br.edu.ifpe.memorando.db.SetorDao"%>
<%@page import="br.edu.ifpe.memorando.models.Memorando"%>
<%@page import="br.edu.ifpe.memorando.models.Setor"%>
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
            <li><a href="/memorando/EnviarMemorando">Enviar Memorando </a></li>
            <li class="active"><a href="/memorando/ListarMemorandos">Listar Memorandos </a></li>
            
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </nav>

        <h3>${msg}</h3>
        <h3>Listar Memorandos</h3>
        <form  action="ListarMemorandos" method="POST">
            
            Setor Destino: <select name="setorDestino">
                        <option value="todos">Todos</option>
                        <%
                            SetorDao sDao = new SetorDao();
                            List<Setor> listDestino = sDao.findAll();
                            
                             
                            for(Setor setor: listDestino){
                        %>
                        <option value="<%=setor.getSigla()%>"><%=setor.getSigla()%></option>
                        <%
                            
                            }
                        %>
                    </select>   
           <input type="submit" value="Buscar">
        </form>
        <br/>
        <br/>
        <table class="table table-striped">
            
            <tr>
                <th>Número</th>
                <th>Assunto</th>
                <th>Status</th>
                <th>Tipo</th>
                <th>Setor Origem</th>
                <th>Setor Destino</th>
            </tr>
            <%
               MemorandoDao dao = new MemorandoDao();
               Memorando m =(Memorando) request.getAttribute("memoBusca");
               List<Memorando> list;
               if(m!=null){
                   list = dao.findAll(m);
               }else{
                   list = dao.findAll();
               }
                if(list.size()!=0){
                
                for(Memorando memorando: list){
            %>
            <tr>
                <td><%= memorando.getNumero()%></td>
                <td><%= memorando.getAssunto()%></td>
                <td><%= memorando.getStatus().getLabel()%></td>
                <td><%= memorando.getTipo()%></td>
                <td><% if(memorando.getSetorOrigem()!=null){%>
                        <%=memorando.getSetorOrigem().getSigla()%>
                    <%}%>
                <td>
                <% if(memorando.getSetorDestino()!=null){%>
                        <%=memorando.getSetorDestino().getSigla()%>
                    <%}%></td>

               
            </tr>
                <%
                }
            }   
                
            %>
            
        </table>
    </body>
</html>
