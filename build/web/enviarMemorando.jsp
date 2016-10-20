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
        <title>Memorando</title>
    </head>
    <body>
        <h3>${msg}</h3>
        <h1>Enviar Memorando</h1>
        <form  action="EnviarMemorando" method="POST">
            Numero: <input type="text" name="numero"><br/>
            Assunto: <input type="text" name="assunto"><br/>
            Mensagem: <textarea name="mensagem" rows="4" cols="50"></textarea><br/>
            Status: <select name="status">
                        <% 
                            for(Status s: Status.values()){%>
                            <option value="<%=s.getCodigo()%>"><%=s.getLabel()%></option>
                        <%
                            
                            }
                        %>
                        
                    </select><br/>
            Tipo:<select name="tipo">
                        <option value="1">Circular</option>
                        <option value="2">Requisição</option>
                    </select><br/>
            Setor Destino: <select name="setorDestino">
                        <option value="todos">Todos</option>
                        <%
                            SetorDao sDao = new SetorDao();
                            List<Setor> list = sDao.findAll();
                            
                             
                            for(Setor setor: list){
                        %>
                        <option value="<%=setor.getId()%>"><%=setor.getSigla()%></option>
                        <%
                            
                            }
                        %>
                    </select><br/>
           <input type="submit" value="Inserir">
        </form>
    </body>
</html>
