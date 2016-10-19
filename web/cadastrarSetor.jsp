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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/memorando.css">
        <title>Memorando</title>
    </head>
    <body>
        <h3>${msg}</h3>
        <h1>Cadastrar Setor</h1>
        <form  action="CadastrarSetor" method="POST">
           Nome: <input type="text" name="nome">
           Sigla: <input type="text" name="sigla">
           Senha: <input type="text" name="senha">
           <input type="submit" value="Inserir">
        </form>
        
        <br/>
        <br/>
        <br/>
        <br/>
        <br/>
        <table>
            
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
