public class RegularCell extends Cell { 

  boolean uncovered;

  RegularCell(int _col, int _row) {
    super(_col, _row);
    uncovered = false;
    fillColor=color(180);
  }

  @Override
    void uncover() {
    uncovered =true;
    fillColor = color(100);
    //0s patch
    if (cantTouchingBombs() == 0) {
      for (Cell myCell : this.surroundingCells(cells)) {
        if (!myCell.isUncovered())myCell.uncover();
      }
    }
  }

  @Override
    boolean isUncovered() {
    return uncovered;
  }
  @Override
    boolean isBomb() {
    return false;
  }

  @Override
    void show() {
    super.show();
    if (uncovered) showNumber(cantTouchingBombs());
  }

  void showNumber(int n) {
    if (n>0) {
      textSize(size-10);
      float m = map(n, 0, 8, 0, 255);
      fill(m, 50, m/2);  
      textAlign(CENTER, CENTER);
      text(Integer.toString(n), posX(), posY(), size, size);
    }
  }

  int cantTouchingBombs() {
    int countBombs = 0;
    //for (int i = max(0, col-1); i<=min(xCells-1, col+1); i++) {
    //  for (int j = max(0, row -1); j<=min(yCells-1, row+1); j++) {        
    //    if (cells[i][j] instanceof Bomb) countBombs++;
    //  }
    //}
    //return countBombs;
    for (Cell myCell : surroundingCells(cells)) {
      if (myCell instanceof Bomb) countBombs++;
    }
    return countBombs;
  }
}
