package Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class AlunoDAO {
  private Aluno aluno;

  public AlunoDAO(Aluno aluno) {
    this.aluno = aluno;
  }
  
  public static ArrayList<Aluno> listarAlunos() {
    Connection          conn    = ConnectionFactory.getConnection();
    PreparedStatement   stmt    = null;
    ResultSet           rs      = null;
    ArrayList<Aluno>    lst     = new ArrayList<>();
    
    try {
      stmt = conn.prepareStatement("" +
              "SELECT " +
              " aluno.alu_nome as 'nome', round(avg(nota.not_nota),2) as 'media' " +
              " FROM aluno " +
              "   INNER JOIN nota ON aluno.alu_matricula = nota.alu_matricula " +
              "GROUP BY aluno.alu_matricula " +
              "ORDER BY aluno.alu_nome");
      
      rs = stmt.executeQuery();
      while ( rs.next() ) {
        String nome   = rs.getString("nome");
        float media   = rs.getFloat("media");
        
        Aluno a = new Aluno(nome, media);
        
        lst.add(a);
      }
    }
    catch (SQLException ex) {
      Logger.getLogger(AlunoDAO.class.getName()).log(Level.SEVERE, null, ex);
    }
    finally {
      ConnectionFactory.closeConnection(conn, stmt, rs);
    }        

    return(lst);
  }
  
  public boolean consultarAluno() {
    Connection          conn    = ConnectionFactory.getConnection();
    PreparedStatement   stmt    = null;
    ResultSet           rs      = null;
    boolean             result  = false;
    
    try {
      stmt = conn.prepareStatement(""
              + "SELECT "
              + " aluno.alu_nome as 'nome', nota.not_codigo as 'codigo', nota.not_nota as 'nota' "
              + "FROM aluno "
              + " INNER JOIN nota ON aluno.alu_matricula = nota.alu_matricula "
              + "WHERE aluno.alu_matricula = ?");
      stmt.setString(1, this.aluno.getMatricula() );
            
      rs = stmt.executeQuery();
      for ( int i=0; rs.next(); i++ ) {
        this.aluno.setNome( rs.getString("nome") );
        this.aluno.setNota( new Nota(rs.getInt("codigo"), rs.getFloat("nota")), i );
        result = true;
      }
    }
    catch (SQLException ex) {
      Logger.getLogger(AlunoDAO.class.getName()).log(Level.SEVERE, null, ex);
    }
    finally {
      ConnectionFactory.closeConnection(conn, stmt, rs);
    }        

    return(result);
  }
  
  public boolean removerAluno() {
    Connection          conn    = ConnectionFactory.getConnection();
    PreparedStatement   stmt    = null;
    boolean             result  = false;
    
    try {
      conn.setAutoCommit(false);
      
      stmt = conn.prepareStatement("DELETE FROM nota WHERE alu_matricula = ?");
      stmt.setString(1, this.aluno.getMatricula() );
      boolean r1 = stmt.executeUpdate() > 0;
      
      stmt = conn.prepareStatement("DELETE FROM aluno WHERE alu_matricula = ?");
      stmt.setString(1, this.aluno.getMatricula() );
      boolean r2 = stmt.executeUpdate() > 0;
      
      if ( r1 && r2 ) {
        result = true;
        conn.commit();
      }
      else {
        conn.rollback();
      }     
    }
    catch (SQLException ex) {
      Logger.getLogger(AlunoDAO.class.getName()).log(Level.SEVERE, null, ex);
    }
    finally {
      ConnectionFactory.closeConnection(conn, stmt);
    }
    
    return( result );
  }
  
  
  public boolean adicionarAluno() {
    Connection          conn    = ConnectionFactory.getConnection();
    PreparedStatement   stmt    = null;
    boolean             result  = false;
    
    try {
      conn.setAutoCommit(false);
      
      // Cadastrar um novo aluno.
      stmt = conn.prepareStatement("INSERT INTO aluno VALUES (?, ?)");
      stmt.setString(1, this.aluno.getMatricula() );
      stmt.setString(2, this.aluno.getNome() );
      boolean r1 = stmt.executeUpdate() > 0;
      
      // Cadastrar nota 1.
      stmt = conn.prepareStatement("INSERT INTO nota (alu_matricula, not_nota) VALUES (?, ?)");
      stmt.setString(1, this.aluno.getMatricula() );
      stmt.setFloat(2, this.aluno.getNota()[0].getValor() );
      boolean r2 = stmt.executeUpdate() > 0;
      
      // Cadastrar nota 2.
      stmt = conn.prepareStatement("INSERT INTO nota (alu_matricula, not_nota) VALUES (?, ?)");
      stmt.setString(1, this.aluno.getMatricula() );
      stmt.setFloat(2, this.aluno.getNota()[1].getValor() );
      boolean r3 = stmt.executeUpdate() > 0;
      
      // Cadastrar nota 3.
      stmt = conn.prepareStatement("INSERT INTO nota (alu_matricula, not_nota) VALUES (?, ?)");
      stmt.setString(1, this.aluno.getMatricula() );
      stmt.setFloat(2, this.aluno.getNota()[2].getValor() );
      boolean r4 = stmt.executeUpdate() > 0;
      
      if ( r1 && r2 && r3 && r4 ) {
        result = true;
        conn.commit();
      }
      else {
        conn.rollback();
      }
    }
    catch (SQLException ex) {
      Logger.getLogger(AlunoDAO.class.getName()).log(Level.SEVERE, null, ex);
    }
    finally {
      ConnectionFactory.closeConnection(conn, stmt);
    }
    
    return( result );
  }
}
