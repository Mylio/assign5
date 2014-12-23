Ball []ball;
Bar board;
Square [] rec;
int life ;
int status = 0;
int recHit = 0 ;
float shootAngle ;
int redR1 ;
int redR2 ;
int redR3 ;
int bluR1 ;
int bluR2 ;
int bluR3;
final int GAME_START = 0 ;
final int GAME_WIN = 1 ;
final int GAME_LOSE = 2 ;
final int GAME_PAUSE = 3 ;
final int GAME_PLAYING = 4 ;
final int GAME_READY = 5 ;


void setup(){  
  size(640,480);
  reset();
}

void draw(){
  background(255);
  textSize(32);
  text("LIFE", 20 , height - 20); 
  fill(255, 0,0 );
  for(int i = 0 ;i< life ;i++){
    noStroke();
    ellipse(120 + i*30 ,height - 30,20,20);
  }
  for (int i=0; i<rec.length; i++){    
    rec[i].display();
  }
 if (mousePressed && (mouseButton == RIGHT) && (status==GAME_START)){
    status = GAME_PLAYING;
    }
 
  switch (status){ 
    case GAME_START :
      text("Right Click or Press Enter",200,420); 
      ball[0].display();
      ball[0].move();
    //  ellipse(board.x,board.y-ball[0].size/2-5,ball[0].size,ball[0].size);
      board.move();
      board.display();
      drawSpecial();
      break ;
   /* case GAME_READY:
      //ellipse(board.x,board.y,ball[0].size,ball[0].size);
      board.move();
      board.display();*/
    case GAME_PLAYING :
      ball[0].move();
      ball[0].display();
      board.move();
      board.display();
      checkRecHit();
      checkWin();
      checkLose();
      drawSpecial();
      break ;
    case GAME_WIN :
      background(0);
      textSize(50);
      fill(250, 244,156 );
      text("GAME WIN", width/2 , height/2 );
      break ;
    case GAME_LOSE :
      background(0);
      textSize(50);
      fill(140, 6,13 );
      text("GAME LOSE", width/2 , height/2 );       
      break ;
    case GAME_PAUSE :
      textSize(50);
      fill(140, 6,13 );
      text("GAME PAUSE", width/2 , height/2 );  
      ball[0].display();     
      board.display();
      drawSpecial();  
      break ;
  }
    
}

void reset(){
  life = 3 ;
  recHit = 0 ;
  shootAngle = random(-5,5) ;
  board = new Bar(100);
  rec = new Square[50];
  for (int i = 0; i< rec.length ; i++){
    rec[i] = new Square(int(i/5),int(i%5));
    }

  
  ball = new Ball[1];
  for (int i=0; i<ball.length; i++){
    ball[i] = new Ball(10, shootAngle);   
  }
  choose();
  
  
  //point = 0 ;//point unprint
}
void choose(){
 
    redR1 = int(random(rec.length)) ;
     redR2 = int(random(rec.length)) ;
    redR3 = int(random(rec.length)) ;
    bluR1 = int(random(rec.length)) ;
  bluR2 = int(random(rec.length)) ;
  bluR3 = int(random(rec.length)) ;
  if((redR1 == redR2)||(redR1 == redR3)||(redR2 == redR3)||(bluR1 == bluR2)||(bluR1 == bluR3)||(bluR2 == bluR3)){
    redR1 = int(random(rec.length)) ;
    redR2 = int(random(rec.length)) ;
    redR3 = int(random(rec.length)) ;
    bluR1 = int(random(rec.length)) ;
    bluR2 = int(random(rec.length)) ;
    bluR3 = int(random(rec.length)) ;
  }
}
 // fill(124,165,219);//blue
  void drawSpecial(){
  rec[bluR1].displayB();
  rec[bluR2].displayB();
  rec[bluR3].displayB();
  
//  fill(250,111,165);//red
  rec[redR1].displayR();
  rec[redR2].displayR();
  rec[redR3].displayR();
}

void checkRecHit(){
  for(int i =0;i<rec.length ;i++){
    if(ball[0].isHit(ball[0].x,ball[0].y,ball[0].size,rec[i].x,rec[i].y,rec[i].size,rec[i].size)){
     // rec.remove(i);
      rec[i].y = height + 100 ;
      recHit ++ ;
      if(i==redR1 || i==redR2 || i==redR3){
        board.len -= 15 ;
      }else if(i==bluR1 || i==bluR2 || i==bluR3){
        board.len += 15 ;
      }
      if(ball[0].circleDistanceX <= (ball[0].rectangleWidth/2 + ball[0].radius)){
      ball[0].xSpeed*=-1;
      }else {
      ball[0].ySpeed*=-1;
      }
    }
  }
}

void checkLose(){
  if(ball[0].y > height){
  life-- ;
  shootAngle = random(-5,5);
  status = GAME_START ;
  
  if (life == 0){
  status = GAME_LOSE ;
  }
  }
}

void checkWin(){
  if( recHit == rec.length){
    status = GAME_WIN ;    
  }
}
void keyPressed() {
  statusCtrl();
}
void statusCtrl() {
  
  
  if (key == ENTER ) {
    switch(status) {
   /* case GAME_READY:
      status = GAME_PLAYING;*/
    case GAME_START:
      shootAngle = random(-5,5);
      ball[0] = new Ball(10, shootAngle);
      status = GAME_PLAYING;
      break;
   case GAME_LOSE:
      reset();
      status = GAME_START;
      break;
   case GAME_WIN:
      reset();
      status = GAME_START;
      break;
   case GAME_PLAYING:
      status = GAME_PAUSE;
      break;
   case  GAME_PAUSE:
      status = GAME_PLAYING;
      break; 
     }
  }
}
