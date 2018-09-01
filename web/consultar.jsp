<%@page import="Model.Aluno"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
  int status = 0;
  if ( request.getAttribute("status")!=null )
    status = Integer.parseInt( request.getAttribute("status").toString() );
%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>SisAlunos - Consultar Aluno</title>
    
    <style type="text/css">
      body a {
        font-size: 22px;
      }
      
      body b {
        font-size: 13px;
      }
      
      tr {
        height: 40px;
      }
      
      input {
        width:95%;
      }
      
      #field {
        text-align: right;
      }
      
      #confirm {
        text-align: center;
      }
      
      #result {
        color:red;
        text-align:center;
      }
    </style>
  </head>
  
  <body>
    
    <center>
      <div style="width:500px">
          <fieldset>
            <legend>SisAlunos - Consultar Aluno</legend>
            <a href="/SisAlunos/"><img src="images/logo.png" title="Home" width="120px" height="120px"></a>

            <hr>

            <form method="post" action="ConsultarAluno">
              <table border="0" width="70%">
                <col width="30%">
                <col width="70%">

                <tr>
                  <td id="field"><strong>Matrícula:</strong></td>
                  <td>
                    <input 
                      type="text" 
                      placeholder="1112223334" 
                      name="matricula" 
                      maxlength="10"
                      required
                    enabled>
                  </td>
                </tr>
                
                <tr>
                  <td id="confirm" colspan="2">
                    <input type="submit" value="Consultar Aluno">
                  </td>
                </tr>
                
                <% if ( status == 1 ) { %>
                <% Aluno a = (Aluno) request.getAttribute("aluno"); %>
                <tr>
                  <td colspan="2" id="result"><strong><i>A nota de <%=a.getNome()%> é <%=a.getNota().getValor()%>.</i></strong></td>
                </tr>
                <% } %>
              </table>
            </form>

            <hr>

            <b><i>By Mateus Pena - 01/09/2018</i></b>
          </fieldset>
      </div>
    </center>
  </body>
  
  <% if ( status == 2 ) { %>
  <script type="text/javascript">alert("Aluno não encontrado!"); location.href = "consultar.jsp"; </script>
  <% } %>
</html>