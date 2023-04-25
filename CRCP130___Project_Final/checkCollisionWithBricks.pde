void checkCollisionWithBricks() {
  for (int i = 0; i < NUM_BRICKS; i++) {
    if (brickAlive[i]) {
      if (ballX >= brickX[i] && ballX <= brickX[i] + BRICK_WIDTH && ballY >= brickY[i] && ballY <= brickY[i] + BRICK_HEIGHT) {
        ballDY *= -1;

        // Randomize the angle by adjusting the ball's horizontal speed (ballDX)
        float angleChange = random(-1.5, 1.5);
        ballDX += angleChange;

        // Ensure the horizontal speed (ballDX) stays within a reasonable range
        ballDX = constrain(ballDX, -BALL_SPEED * 1.5, BALL_SPEED * 1.5);
        
        collide.play();

        brickAlive[i] = false;
        bricksHit++;
        if (bricksHit == NUM_BRICKS) {
          levelCompleteMessage();
          levelComplete = true;
          //gameOver = true;
        }
      }
    }
  }
}
