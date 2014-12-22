class Ball{
  float x;
  float y;
  float xSpeed;
  float ySpeed;
  float size;
  float circleDistanceX ;
  float rectangleWidth ;
  float radius ;
  void move(){
    
    if (status==GAME_START){
    x = board.x ;
    y = board.y-5-this.size/2;
    }else if(status == GAME_PLAYING){
    x+=xSpeed;
    y+=ySpeed;
    if (x<size/2 || x>width-size/2){ //hit boarder left & right
      xSpeed *= -1;
    }
    if (y<size/2){ //hit boarder top
      ySpeed *= -1;
    }
    if (y>height-size/2 + 10){ //hit boarder bottom
     // y = size/2;
     x = board.x ;
     y = board.y ;
    }
    
   
    
    float bottom = y+size/2; //bottom of the ball
    float bl = board.y - 10/2; //top of the board 
    float bLeft = board.x-board.len/2; //left of the board
    float bRight = board.x+board.len/2; //right of the board
    if (bottom >= bl && x>bLeft && x<bRight){
        ySpeed *= -1;
        y = bl;
    }
    }
  }
  void display(){
    ellipse(x,y,size,size);
  }
  
  boolean isHit(
        float circleX,
        float circleY,
        float radius,
        float rectangleX,
        float rectangleY,
        float rectangleWidth,
        float rectangleHeight)
  {
     circleDistanceX = abs(circleX - rectangleX);
   // float circleDistanceX = abs(circleX - rectangleX);//abs() -> get absolute value
      float circleDistanceY = abs(circleY - rectangleY);
   
      if (circleDistanceX > (rectangleWidth/2 + radius)) { return false; }
      if (circleDistanceY > (rectangleHeight/2 + radius)) { return false; }
   
      if (circleDistanceX <= (rectangleWidth/2)) { return true; }
      if (circleDistanceY <= (rectangleHeight/2)) { return true; }
   
      float cornerDistance_sq = pow(circleDistanceX - rectangleWidth/2, 2) +
                           pow(circleDistanceY - rectangleHeight/2, 2);
   
      return (cornerDistance_sq <= pow(radius,2));//false -> not hit
  }
  
  Ball(){
    x = random(width);
    y = random(height);
    xSpeed = 5;
    ySpeed = 3;
    size = 10;
  }
  
  Ball(float size, float xSpeed){
    x = board.x;
    y = board.y-5-this.size/2;
 //   y = random(height);
    this.xSpeed = xSpeed;
    this.ySpeed = size;
    this.size = size;
  }
}
