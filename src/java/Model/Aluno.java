package Model;

import java.util.ArrayList;

public class Aluno {
  private String  matricula;
  private String  nome;
  private Nota    nota;

  
  public boolean adicionar() {
    AlunoDAO dao = new AlunoDAO(this);
    return( dao.adicionarAluno() );
  }
  
  public boolean remover() {
    AlunoDAO dao = new AlunoDAO(this);
    return( dao.removerAluno() );
  }
  
  public boolean consultar() {
    AlunoDAO dao = new AlunoDAO(this);
    return( dao.consultarAluno() );
  }
  
  public static ArrayList<Aluno> listar() {
    return( AlunoDAO.listarAlunos() );
  }
   
  
  
  public Aluno(String matricula, String nome, Nota nota) {
    this.matricula = matricula;
    this.nome = nome;
    this.nota = nota;
  }
  
  public Aluno(String matricula, String nome, float notaValor) {
    this(matricula, nome, new Nota(notaValor) );
  }
  
  public Aluno(String matricula) {
    this.matricula = matricula;
  }
  
  public Aluno(String nome, float nota) {
    this.nome = nome;
    this.nota = new Nota(nota);
  }
  
  
  

  public String getMatricula() {
    return matricula;
  }

  public void setMatricula(String matricula) {
    this.matricula = matricula;
  }

  public String getNome() {
    return nome;
  }

  public void setNome(String nome) {
    this.nome = nome;
  }

  public Nota getNota() {
    return nota;
  }

  public void setNota(Nota nota) {
    this.nota = nota;
  }
  
}
