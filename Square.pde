class Square{
  float x;
  float y;
  float size;
  
  void display(){
    fill(212,176,106);
    rect(x,y,size,size);
    
  }
  
  Square(float col, float row){
    size = 20 ;
    x = 200 + col*1.2*size ;
    y = 100 + row*1.2*size ;
    
  }

}
