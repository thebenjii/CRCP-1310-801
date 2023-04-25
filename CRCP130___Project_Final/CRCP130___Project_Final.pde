import processing.sound.*;
SoundFile file;
SoundFile collide;
String kill = "data/mixkit-arcade-space-shooter-dead-notification-272.wav";
String paths;
String audioName = "data/mixkit-game-level-music-689.wav";
String path;
final int SCREEN_WIDTH = 640;
final int SCREEN_HEIGHT = 480;
final int PADDLE_WIDTH = 80;
final int PADDLE_HEIGHT = 10;
final int PADDLE_Y = SCREEN_HEIGHT - PADDLE_HEIGHT - 10;
final int BALL_SIZE = 10;
final int NUM_BRICKS = 60;
final int BRICK_WIDTH = 50;
final int BRICK_HEIGHT = 20;
final int BRICK_GAP = 5;
final int BRICK_START_X = 20;
final int BRICK_START_Y = 50;
float BALL_SPEED = 5;
float PADDLE_SPEED = 15;
int currentLevel = 1;
boolean levelComplete;

int paddleX;
float ballX, ballY;
float ballDX, ballDY;
int bricksHit;
boolean gameStarted;
boolean gameOver;
int[] brickX = new int[NUM_BRICKS];
int[] brickY = new int[NUM_BRICKS];
boolean[] brickAlive = new boolean[NUM_BRICKS];
color[] brickColors = {color(255, 0, 0), color(0, 255, 0), color(0, 0, 255)};
color brickColor;

PImage backgroundImage;
float backgroundX1 = 0;
float backgroundX2;
float backgroundSpeed = 1;

void setup() {
  size(640, 480);
  frameRate(60);
  resetGame();

  path = sketchPath(audioName);
  file = new SoundFile(this, path);
  file.loop();

  paths = sketchPath(kill);
  collide = new SoundFile(this, paths);

  backgroundImage = loadImage("data/gameimage.gif");
  backgroundX2 = backgroundImage.width;
}



void keyPressed() {
  if (key == ' ' && !gameStarted) {
    gameStarted = true;
  }
  if (keyCode == 'R' || keyCode == 'r') {
    resetGame();
  }
  if (key == 'N' || key == 'n') {
    currentLevel++;
    resetGame();
  }
}

void drawPaddle() {
  rect(paddleX, PADDLE_Y, PADDLE_WIDTH, PADDLE_HEIGHT);
}

void movePaddle() {
  if (keyPressed && (keyCode == LEFT || keyCode == RIGHT)) {
    if (keyCode == LEFT && paddleX > 0) {
      paddleX -= PADDLE_SPEED;
    }
    if (keyCode == RIGHT && paddleX < SCREEN_WIDTH - PADDLE_WIDTH) {
      paddleX += PADDLE_SPEED;
    }
  }
}

void drawBall() {
  ellipse(ballX, ballY, BALL_SIZE, BALL_SIZE);
}

void moveBall() {
  if (gameStarted && !gameOver) {
    ballX += ballDX;
    ballY += ballDY;
  }
}

void bounceBall() {
  if (ballX <= 0 || ballX >= SCREEN_WIDTH - BALL_SIZE) {
    ballDX *= -1;
  }
  if (ballY <= 0) {
    ballDY *= -1;
  }
  if (ballY >= PADDLE_Y - BALL_SIZE && ballX >= paddleX && ballX <= paddleX + PADDLE_WIDTH) {
    ballDY *= -1;
  }
}

void drawBricks() {
  for (int i = 0; i < NUM_BRICKS; i++) {
    if (brickAlive[i]) {
      brickColor = brickColors[currentLevel % brickColors.length];
      fill(brickColor);
      rect(brickX[i], brickY[i], BRICK_WIDTH, BRICK_HEIGHT);
    }
  }
}

void checkGameOver() {
  if (ballY > PADDLE_Y + BALL_SIZE) {
    gameOver = true;
  }
}



void displayGameOver() {
  if (gameOver) {
    textSize(32);
    fill(255);
    textAlign(CENTER, CENTER);
    text("GAME OVER \n PRESS R TO RESTART", SCREEN_WIDTH/2, SCREEN_HEIGHT/2);
  }
}

void displayLevelInfo() {
  textSize(16);
  fill(255);
  textAlign(LEFT, TOP);
  text("Level: " + currentLevel, 10, 10);
}


void draw() {
  background(0);
  image(backgroundImage, backgroundX1, 0);
  image(backgroundImage, backgroundX2, 0);
  scrollBackground();

  PlayItself();
  drawPaddle();
  movePaddle();
  drawBall();
  moveBall();
  bounceBall();
  drawBricks();
  checkGameOver();
  checkCollisionWithBricks();
  displayGameOver();
  displayLevelInfo();
  levelCompleteMessage();
}
