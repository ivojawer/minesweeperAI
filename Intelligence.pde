public class Intelligence{
  Intelligence(){
    
  }
  
  void step(Cell[][] cells){
    lessLikelyCell(cells).uncover();  
  }
  
  Cell lessLikelyCell(Cell[][] cells){
    return cells[1][1];
  }
  
}
