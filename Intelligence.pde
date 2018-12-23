public class Intelligence {




  Intelligence() {
  }

  void step(Cell[][] cells) {
    lessLikelyToBeBombCell(cells).uncover();
  }

  Cell lessLikelyToBeBombCell(Cell[][] cells) {
    Cell lessLikelyCell = randomUncoveredCell(cells);
    for(Cell myCell : allCoveredCells(cells)) {
        if (myCell.probabilityToBeBomb(cells) <  lessLikelyCell.probabilityToBeBomb(cells)) lessLikelyCell   = myCell;
    }
    
    return lessLikelyCell;
  }

  Cell randomUncoveredCell(Cell[][] cells) {
    int rndCol = int(random(xCells));
    int rndRow = int(random(yCells));
    while ( cells[rndCol][rndRow].isUncovered()) {
      rndCol = int(random(xCells));
      rndRow = int(random(yCells));
    }

    return cells[rndCol][rndRow];
  }
  
  
  ArrayList<Cell> allCoveredCells(Cell[][] cells){
    ArrayList<Cell> coveredCells= new ArrayList();
    for (int i = 0; i < xCells; i++) {
      for (int j = 0; j < yCells; j++) {
        Cell cell = cells[i][j];
        if(!cell.isUncovered()) coveredCells.add(cell);
      }
    }
    return coveredCells;
  }
  
  
  
}
