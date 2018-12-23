public class Bomb extends Cell {

  public Bomb(int _col, int _row) {
    super(_col, _row);
    fillColor = color(255, 0, 255);//color(180);
  }

  @Override
    public void uncover() {
    //cells = createCells();
    lost = true;
    print("You Lose!!!");
  }

  @Override
    boolean isUncovered() { 
    return false;
  }

  @Override
    boolean isBomb() {
    return true;
  }
}
