void scrollBackground() {
  backgroundX1 -= backgroundSpeed;
  backgroundX2 -= backgroundSpeed;

  if (backgroundX1 < -backgroundImage.width) {
    backgroundX1 = backgroundImage.width;
  }

  if (backgroundX2 < -backgroundImage.width) {
    backgroundX2 = backgroundImage.width;
  }
}
