public class RegularCell extends Cell{ 
  
  boolean uncovered;
  
  RegularCell(int _col,int _row){
    super(_col,_row);
    uncovered = false;
    fillColor=color(180);
  }
  
  @Override
  void uncover(){
    uncovered =true;
  }
  
  @Override
  boolean isBomb(){
    return false;
  }
  
  @Override
  void show(){
    super.show();
    if(uncovered) showNumber(cantTouchingBombs());
  }
  
  void showNumber(int n){
    textSize(30);
    fill(#13A740);
    text(Integer.toString(n),posX(),posY(),posX()+size,posY()+size);
  }
  
  int cantTouchingBombs(){
    
    return 3;
  }
  
}
