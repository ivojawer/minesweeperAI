public int cellSize = 30;



public abstract class Cell {
  public int col, row;
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

  public float posX() { 
    return col*size;
  }
  public float posY() { 
    return row*size;
  }

  public void show() {
    fill(fillColor);
    rect(posX(), posY(), size, size);
    showFlag();
    // print(this instanceof Bomb);
  }

  public abstract boolean isUncovered();

  public void showFlag() {
    if (flagged) {
      ellipseMode(CORNER);
      fill(#FF0000);
      ellipse(posX(), posY(), size, size);
    }
  }

  float probabilityToBeBomb(Cell[][] cells) {
    return 1;
  }

  int cantTouchingBombs() {
    int countBombs = 0;
    for (Cell myCell : surroundingCells(cells)) {
      if (myCell instanceof Bomb) countBombs++;
    }
    return countBombs;
  }

  public void flag() {   
    flagged=true;
  }

  ArrayList<Cell> surroundingCells(Cell[][] cells) {
    ArrayList<Cell> surrCells = new ArrayList();
    for (int i = max(0, col-1); i<=min(xCells-1, col+1); i++) {
      for (int j = max(0, row -1); j<=min(yCells-1, row+1); j++) {        
        if (i != col || j != row) surrCells.add(cells[i][j]);
      }
    }


    return surrCells;
  }

  ArrayList<Cell> surroundingUncoveredCells(Cell[][] cells) {
    ArrayList<Cell> surrCovCells = new ArrayList();
    for (Cell mySurrCell : this.surroundingCells(cells)) {
      if (mySurrCell.isUncovered())surrCovCells.add(mySurrCell);
    }
    return surrCovCells;
  }
  ArrayList<Cell> surroundingCoveredCells(Cell[][] cells) {
    ArrayList<Cell> surrCovCells = new ArrayList();
    for (Cell mySurrCell : this.surroundingCells(cells)) {
      if (!mySurrCell.isUncovered())surrCovCells.add(mySurrCell);
    }
    return surrCovCells;
  }


  public abstract void uncover();
  public abstract boolean isBomb();
}
