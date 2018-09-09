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
    <title>SisAlunos - Adicionar Aluno</title>
    
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
    </style>
    
    <script type="text/javascript">
      function checkNotaField(campo) {
        if ( campo.value=="" || parseFloat(campo.value)<0 || parseFloat(campo.value)>10 ) 
          campo.value = 0;
      }
    </script>
  </head>
  
  <body>
    
    <center>
      <div style="width:500px">
          <fieldset>
            <legend>SisAlunos - Adicionar Aluno</legend>
            <a href="/SisAlunos/"><img src="images/logo.png" title="Home" width="120px" height="120px"></a>

            <hr>

            <form method="post" action="AdicionarAluno">
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
                  <td id="field"><strong>Nome:</strong></td>
                  <td>
                    <input 
                      type="text" 
                      placeholder="Mateus Pena" 
                      name="nome" 
                      maxlength="50"
                      required
                    enabled>
                  </td>
                </tr>

                <tr>
                  <td id="field"><strong>Nota 1:</strong></td>
                  <td>
                    <input 
                      onfocusout="checkNotaField(this)" 
                      type="number" 
                      name="nota1"
                      value="0" 
                      step=".01" 
                      min="0" 
                      max="10"
                    enabled>
                  </td>
                </tr>
                
                <tr>
                  <td id="field"><strong>Nota 2:</strong></td>
                  <td>
                    <input 
                      onfocusout="checkNotaField(this)" 
                      type="number" 
                      name="nota2"
                      value="0" 
                      step=".01" 
                      min="0" 
                      max="10"
                    enabled>
                  </td>
                </tr>
                
                <tr>
                  <td id="field"><strong>Nota 3:</strong></td>
                  <td>
                    <input 
                      onfocusout="checkNotaField(this)" 
                      type="number" 
                      name="nota3"
                      value="0" 
                      step=".01" 
                      min="0" 
                      max="10"
                    enabled>
                  </td>
                </tr>

                <tr>
                  <td id="confirm" colspan="2">
                    <input type="submit" value="Cadastar Aluno">
                  </td>
                </tr>
              </table>
            </form>

            <hr>

            <b><i>By Mateus Pena - 01/09/2018</i></b>
          </fieldset>
      </div>
    </center>
  </body>
  
  <% if ( status == 1 ) { %>
  <script type="text/javascript">alert("Aluno adicionado com sucesso! :-)"); location.href = "index.jsp"; </script>
  <% } else if ( status == 2 ) { %>
  <script type="text/javascript">alert("Falha ao adicionar aluno!"); location.href = "adicionar.jsp"; </script>
  <% } %>
</html>