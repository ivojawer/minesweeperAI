public class Intelligence {




  Intelligence() {
  }

  void step(Cell[][] cells) {
    flagObvious(cells);
    if (!removeFull(cells)) {      
      Cell lltbc = lessLikelyToBeBombCell(cells);
      lltbc.uncover();
    }
  }

  void flagObvious(Cell[][] cells) {
    for (Cell myCell : allUncoveredCells(cells)) {
      if (myCell.isFullOfMines(cells)) {
        for (Cell toFlagCell : myCell.surroundingCoveredCells(cells)) {
          toFlagCell.flag();
        }
      }
    }
  }

  boolean removeFull(Cell[][] cells) {
    boolean removedSomething = false;
    for (Cell myCell : allUncoveredCells(cells)) {
      if (myCell.isFull(cells)) {

        for (Cell toUncoverCell : myCell.surroundingCoveredAndNotFlaggedCells(cells)) {
          toUncoverCell.uncover();
          removedSomething =true;
        }
      }
    }
    return removedSomething;
  }

  boolean anyFullCell(ArrayList<Cell> surrCells, Cell[][] cells) {
    for (Cell myCell : surrCells) {
      if (myCell.cantTouchingBombs() == myCell.surroundingCoveredCells(cells).size()) return true;
    }
    return false;
  }

  Cell lessLikelyToBeBombCell(Cell[][] cells) {
    Cell lessLikelyCell = randomCoveredCell(cells);
     //for (Cell myCell : allCoveredCells(cells)) {
    //  if (myCell.probabilityToBeBomb(cells) <  lessLikelyCell.probabilityToBeBomb(cells)) lessLikelyCell   = myCell;
    //}

    return lessLikelyCell;
  }

  Cell randomCoveredCell(Cell[][] cells) {
    ArrayList<Cell> covCells = allCoveredCells(cells);   
 
    return covCells.get(int(random(covCells.size())));
 }


  ArrayList<Cell> allCoveredCells(Cell[][] cells) {
    ArrayList<Cell> coveredCells= new ArrayList();
    for (int i = 0; i < xCells; i++) {
      for (int j = 0; j < yCells; j++) {
        Cell cell = cells[i][j];
        if (!cell.isUncovered() && !cell.flagged) coveredCells.add(cell);
      }
    }
    return coveredCells;
  }

  ArrayList<Cell> allUncoveredCells(Cell[][] cells) {
    ArrayList<Cell> uncoveredCells= new ArrayList();
    for (int i = 0; i < xCells; i++) {
      for (int j = 0; j < yCells; j++) {
        Cell cell = cells[i][j];
        if (cell.isUncovered()) uncoveredCells.add(cell);
      }
    }
    return uncoveredCells;
 }
}
