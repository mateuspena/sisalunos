<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.Aluno"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
  ArrayList<Aluno> lstAluno = Aluno.listar();
  
  float media=0f;
  if ( lstAluno.size() > 0 ) {
    for (int i=0; i< lstAluno.size(); i++)
      media = media + lstAluno.get(i).getNota()[0].getValor();
    media = media / lstAluno.size();
  }
%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>SisAlunos - Média Geral</title>
    
    <style type="text/css">
      body a {
        font-size: 22px;
      }
      
      body b {
        font-size: 13px;
      }
      
      tr {
        height: 30px;
        text-align: left;
      }
      
    </style>
    
    <script type="text/javascript">
    </script>
  </head>
  
  <body>
    
    <center>
      <div style="width:500px">
          <fieldset>
            <legend>SisAlunos - Média Geral da Turma</legend>
            <a href="/SisAlunos/"><img src="images/logo.png" title="Home" width="120px" height="120px"></a>

            <hr>

            <table border="1" width="70%">
              <col width="75%">
              <col width="25%">
      
              <tbody>
                <tr>
                  <td>Média Geral da Turma</td>
                  <% DecimalFormat df = new DecimalFormat("0.00"); %>
                  <td><%=df.format(media) %></td>
                </tr>
              </tbody>
            </table>
            
            <br>
            
            <table border="1" width="70%">
              <col width="75%">
              <col width="25%">

              <thead>
                <th>Aluno</th>
                <th>Nota</th>
              </thead>
              
              <tbody>
                
                <% if ( lstAluno.size() > 0 ) for (int i=0; i< lstAluno.size(); i++) { %>
                <tr>
                  <td><%=lstAluno.get(i).getNome() %></td>
                  <td><%=lstAluno.get(i).getNota()[0].getValor() %></td>
                </tr>
                <% } else { %>
                <tr>
                  <td colspan="2" align="center"><i>Nenhum aluno encontrado.</i></td>
                </tr>
                <% } %>
                
              </tbody>
            </table>

            <hr>

            <b><i>By Mateus Pena - 01/09/2018</i></b>
          </fieldset>
      </div>
    </center>
  
  </body>
</html>