package Model;

import java.util.ArrayList;

public class Aluno {
  private String    matricula;
  private String    nome;
  private Nota[]    nota;

  
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
   
  
  
  public Aluno(String matricula, String nome, Nota[] nota) {
    this.matricula  = matricula;
    this.nome       = nome;
    this.nota       = nota;
  }
  
  /**
   * Usado pela módulo Adicionar.
   * @param matricula String.
   * @param nome String.
   * @param nota1 Float.
   * @param nota2 Float.
   * @param nota3 Float.
   */
  public Aluno(String matricula, String nome, float nota1, float nota2, float nota3) {
    this(matricula, nome, null);
    this.nota       = new Nota[3];
    this.nota[0]    = new Nota(nota1);
    this.nota[1]    = new Nota(nota2);
    this.nota[2]    = new Nota(nota3);
  }
  
  /**
   * Usando pelos módulos Remover e Consultar.
   * @param matricula String.
   */
  public Aluno(String matricula) {
    this.matricula  = matricula;
    this.nota       = new Nota[3];
  }
  
  /**
   * Usando pelo módulo Média.
   * @param nome String.
   * @param media Float.
   */
  public Aluno(String nome, float media) {
    this.nome     = nome;
    this.nota     = new Nota[1];
    this.nota[0]  = new Nota(media);
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

  public Nota[] getNota() {
    return nota;
  }

  public void setNota(Nota[] nota) {
    this.nota = nota;
  }
  
  public void setNota(Nota nota, int index) {
    this.nota[index] = nota;
    
    System.out.println("\n\n>> " + nota.getValor() + " : " + index);
  }
  
}
