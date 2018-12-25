public class Bomb extends Cell {

  public Bomb(int _col, int _row) {
    super(_col, _row);
    fillColor = color(180);
  }

  @Override
    public void uncover() {
    if (!flagged) {
      cells = createCells();
      lost = true;
      lastReset = millis()/1000;
      print("You Lose!!!");
    }
  }

  @Override
    boolean isUncovered() { 
    if(!flagged) return true;
    return false;
  }

  @Override
    boolean isBomb() {
    return true;
  }
}
