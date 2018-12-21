//expert: 24x24 99mines

float xCells = 24;
float yCells = 24;
int cantMines = 99;

ArrayList<Cell> cells;
void setup() {
  //noStroke();


  background(255);
  cells = createCells();
}

void settings() {
  int y = int(yCells*cellSize);
  int w = int(xCells*cellSize); // null pointer exception
  size(w, y);
}


void draw() {
  showCells();
}

void showCells() {
  for (Cell myCell : cells) {
    myCell.show();
  }
}

ArrayList<Cell> createCells() {
  ArrayList<Cell> cells= new ArrayList();
  for (float i = 0; i < xCells; i++) {
    for (float j = 0; j < yCells; j++) {

      cells.add(new Cell(i, j));
    }
  }

  
  return generateBombs(cells);
}

ArrayList<Cell> generateBombs(ArrayList<Cell> cells) {
  float cantCells = xCells*yCells;
  for (int i = 0; i < cantMines; i++) {
    int rndCell = int(random(cantCells));
    while ((cells.get(rndCell) instanceof Bomb)) {
      rndCell = int(random(cantCells));
    }
    Cell prevCell=cells.get(rndCell);
    cells.set(rndCell,new Bomb(prevCell.x,prevCell.y));
  }

  return cells;
}
