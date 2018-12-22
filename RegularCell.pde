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
    fillColor = color(100);
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
    textSize(size-10);
    fill(#13A740);    
    textAlign(CENTER,CENTER);
    text(Integer.toString(n),posX(),posY(),size,size);    
  }
  
  int cantTouchingBombs(){
    int countBombs = 0;
    for(int i = max(0,col-1);i<=min(xCells-1,col+1);i++){
      for(int j = max(0,row -1);j<=min(yCells-1,row+1);j++){        
        if(cells[i][j] instanceof Bomb) countBombs++;
      }
    }
    return countBombs;
  }
  
}
