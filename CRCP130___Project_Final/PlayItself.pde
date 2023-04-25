void PlayItself(){
  
  paddleX = (int) (ballX - PADDLE_WIDTH / 2);
  if (paddleX < 0) paddleX = 0;
  if (paddleX > SCREEN_WIDTH - PADDLE_WIDTH) paddleX = SCREEN_WIDTH - PADDLE_WIDTH;

  
}
