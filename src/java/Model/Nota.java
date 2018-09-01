package Model;

public class Nota {
  private int     codigo;
  private float   valor;
  
  

  public Nota(int codigo, float valor) {
    this.codigo = codigo;
    this.valor = valor;
  }
  
  public Nota(float valor) {
    this.valor = valor;
  }
  
  
  

  public int getCodigo() {
    return codigo;
  }

  public void setCodigo(int codigo) {
    this.codigo = codigo;
  }

  public float getValor() {
    return valor;
  }

  public void setNota(float valor) {
    this.valor = valor;
  }
}
