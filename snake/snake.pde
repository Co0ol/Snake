int snakeX = 0;
int snakeY = 0;
int fruitX = 0;
int fruitY = 0;

int nKeyCode = 0;//now keyCode
int snakeLength = 0;
boolean keyTooFast = false;
int pSnake[][] = new int[250][2];

void setup(){
  size(800, 800);
  surface.setTitle("Snake");
  rectMode(CENTER);
  background(221);
  noStroke();
  
  snakeX = int(random(16, width));
  snakeY = int(random(16, height));
  snakeX -= snakeX % 16 + 8;
  snakeY -= snakeY % 16 + 8;
  
  fruitX = int(random(16, width));
  fruitY = int(random(16, height));
  fruitX -= fruitX % 16 + 8;
  fruitY -= fruitY % 16 + 8;
}

void draw(){
  surface.setTitle("Snake (snakeLength = " + (snakeLength + 1) + ")");
  
  switch(nKeyCode){
    case UP:
      snakeY -= 16;
      break;
    case DOWN:
      snakeY += 16;
      break;
    case LEFT:
      snakeX -= 16;
      break;
    case RIGHT:
      snakeX += 16;
      break;
  }
  if(snakeX > width){
    snakeX -= width;
  }
  else if(snakeX < 0){
    snakeX += width;
  }
  if(snakeY > height){
    snakeY -= height;
  }
  else if(snakeY < 0){
    snakeY += height;
  }
  
  fill(221);
  rect(pSnake[snakeLength][0], pSnake[snakeLength][1], 16, 16);
  fill(0);
  rect(fruitX, fruitY, 16, 16);
  fill(255, 0, 0);
  rect(fruitX, fruitY, 12, 12);
  fill(0);
  rect(snakeX, snakeY, 16, 16);  
  fill(0, 255, 0);
  rect(snakeX, snakeY, 12, 12); 
  
  if(snakeX == fruitX && snakeY == fruitY){
    snakeLength ++;
    fruitX = int(random(16, width));
    fruitY = int(random(16, height));
    fruitX -= fruitX % 16 + 8;
    fruitY -= fruitY % 16 + 8;
  }
  
  for(int i = snakeLength; i > 0; i--){
    if(snakeX == pSnake[i][0] && snakeY == pSnake[i][1]) noLoop();
    pSnake[i][0] = pSnake[i - 1][0];
    pSnake[i][1] = pSnake[i - 1][1];  
  }
  pSnake[0][0] = snakeX;
  pSnake[0][1] = snakeY;
  
  keyTooFast = false;
  delay(50);
}

void keyReleased(){
  if(keyTooFast) return;
  
  switch(keyCode){
    case UP:
      if(nKeyCode != DOWN){      
        nKeyCode = keyCode;
      }
      break;
    case DOWN:
      if(nKeyCode != UP){      
        nKeyCode = keyCode;
      }
      break;
    case LEFT:
      if(nKeyCode != RIGHT){      
        nKeyCode = keyCode;
      }
      break;
    case RIGHT:
      if(nKeyCode != LEFT){      
        nKeyCode = keyCode;
      }
      break;
  }
  keyTooFast = true;
}
