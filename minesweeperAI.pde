//expert: 24x24 99mines

int xCells = 6;
int yCells = 6;
int cantMines = 5;
Intelligence ai= new Intelligence();;
//ArrayList<Cell> cells;
Cell[][] cells= new Cell[xCells][yCells];
public boolean lost = false;
void setup() {
  //noStroke();
  cells = createCells();
  background(255);
}

void settings() {
  int y = int(yCells*cellSize);
  int w = int(xCells*cellSize); 
  size(y, w);
}


void draw() {
  background(255);
  ai.step(cells);
  showCells();
}



void showCells() {
  for (int i = 0; i < xCells; i++) {    
    for (int j = 0; j < yCells; j++) {
      cells[i][j].show();
    }
  }
}

Cell[][] createCells() {
  Cell[][] cells= new Cell[xCells][yCells];
  for (int i = 0; i < xCells; i++) {    
    for (int j = 0; j < yCells; j++) {
      cells[i][j] = new RegularCell(i, j);
    }
  }
  return randomBombs(cells);
}

Cell[][] randomBombs(Cell[][] cells) {
  for(int i = 0; i<cantMines;i++){
    int rndCol = int(random(xCells-1));
    int rndRow = int(random(xCells-1));
    while( cells[rndCol][rndRow].isBomb()){
      rndCol = int(random(xCells-1));
      rndRow = int(random(xCells-1));
    }
    cells[rndCol][rndRow] = new Bomb(rndCol,rndRow);    
  }  
  return cells;
}
