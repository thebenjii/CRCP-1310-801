void setup() {
  size(400, 400);
}

void draw() {
  background(0);
  stroke(255);
  for (int i = 0; i < 400; i += 60) {
    line(i, 0, i, 400);
    line(0, i, 400, i);
  }

  float radius = 100;
  float angle = TWO_PI / 6;
  float x, y;

  for (int i = 0; i < 6; i++) {
    x = width/2 + radius * cos(angle * i);
    y = height/2 + radius * sin(angle * i);
    ellipse(x, y, 60, 60);
  }
  }
