void resetGame() {
  levelComplete = false;
  paddleX = width/2 - PADDLE_WIDTH/2;
  ballX = width/2;
  ballY = height/2;
  ballDX = BALL_SPEED;
  ballDY = -BALL_SPEED;
  bricksHit = 0;
  gameStarted = false;
  gameOver = false;

  //ballX = random(BALL_SIZE / 2, SCREEN_WIDTH - BALL_SIZE / 2);
  //ballY = random(BALL_SIZE / 2, SCREEN_HEIGHT / 2);

  initializeBricks();
  setLevelProperties(currentLevel);
}

void initializeBricks() {
  int brickIndex = 0;
  for (int row = 0; row < 6; row++) {
    for (int col = 0; col < 10; col++) {
      brickX[brickIndex] = BRICK_START_X + (BRICK_WIDTH + BRICK_GAP) * col;
      brickY[brickIndex] = BRICK_START_Y + (BRICK_HEIGHT + BRICK_GAP) * row;
      brickAlive[brickIndex] = true;
      brickIndex++;
    }
  }
}

void setLevelProperties(int level) {
  switch (level) {
  case 1:
    BALL_SPEED = 5;
    PADDLE_SPEED = 15;
    break;
  case 2:
    BALL_SPEED = 6;
    PADDLE_SPEED = 13;
    break;
  case 3:
    BALL_SPEED = 10;
    PADDLE_SPEED = 10;
    break;
  case 4:
    BALL_SPEED = 12;
    PADDLE_SPEED = 8;
    break;
   
  default:
  }
}
