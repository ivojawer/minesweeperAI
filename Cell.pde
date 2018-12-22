public int cellSize = 30;



public abstract class Cell {
  public int col,row;
  public int size;
  public boolean flagged;
  color fillColor;


  public Cell(int _col, int _row) {
    size=cellSize;    
    flagged = false;
    col=_col;
    row=_row;
  }

  public Cell() {
  }
  
  public float posX() { return col*size;}
  public float posY() { return row*size;}

  public void show() {
    fill(fillColor);
    rect(posX(), posY(), size, size);
    showFlag();
    // print(this instanceof Bomb);
  }

  public void showFlag() {
    if (flagged) {
      ellipseMode(CORNER);
      fill(#FF0000);
      ellipse(posX(), posY(), size, size);
    }
  }

  public void flag() {   
    flagged=true;
  }
  
  public abstract void uncover();
  public abstract boolean isBomb();
}
