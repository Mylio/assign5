class Square{
  float x;
  float y;
  float size;
  
  void display(){
    fill(212,176,106);
    rect(x,y,size,size);
    
  }
  void displayR(){
    fill(250,111,165);
    rect(x,y,size,size);
  }
  void displayB(){
    fill(124,165,219);
    rect(x,y,size,size);
  }
  
  Square(float col, float row){
    size = 30 ;
    x = 150 + col*1.2*size ;
    y = 100 + row*1.2*size ;
    
  }

}
