public class Bomb extends Cell {

  public Bomb(int _col, int _row) {
    super(_col,_row);
    fillColor = color(255,0,255);
  }
 
  @Override
  public void uncover(){
    createCells();
    lost = true;
    print("You Lose!!!");
  }
  @Override
  boolean isBomb(){
    return true;
  }
}
