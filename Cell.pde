public int cellSize = 30;



class Cell{
 Float x,y;
 int size;
 boolean flagged;
 Cell(Float _x,Float _y){
     size=cellSize;
     x=_x*size;
     y=_y*size;
     flagged = false;
 }
 
 
 void show(){
   fill(180);
   rect(x,y,size,size);
 }
 
 void flag(){
   ellipseMode(CORNER);
   fill(#FF0000);
   ellipse(x,y,cellSize-5,cellSize-5);
   flagged=true;
 }  
}


class Bomb extends Cell{
   Bomb(float _x,float _y){
     super(_x,_y);
   }
   
   void show(){
     
     
     rect(x,y,size,size);
     fill(0,255,0);
   }
}
