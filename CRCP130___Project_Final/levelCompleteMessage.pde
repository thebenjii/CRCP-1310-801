int levelCompleteTimer = 0;
int levelCompleteDuration = 2000; // 2000 milliseconds (2 seconds)

void levelCompleteMessage() {
  if (levelComplete) {
    textSize(32);
    fill(255);
    textAlign(CENTER, CENTER);
    text("LEVEL COMPLETE", width/2, height/2);

    if (levelCompleteTimer == 0) {
      levelCompleteTimer = millis(); // Store the current time
    } else if (millis() - levelCompleteTimer >= levelCompleteDuration) {
      levelComplete = false;
      currentLevel++;
      resetGame();
      levelCompleteTimer = 0; // Reset the timer
    }
  }
}
