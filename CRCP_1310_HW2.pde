class Ship {
  PVector position;
  PVector velocity;
  float orientation;
  color shipColor;

  Ship(float x, float y, color c) {
    position = new PVector(x, y);
    velocity = PVector.random2D().mult(random(2, 5));
    orientation = random(TWO_PI);
    shipColor = c;
  }

  void render() {
    push();
    translate(position.x, position.y);
    rotate(orientation);
    fill(shipColor);
    triangle(0, -15, -10, 15, 10, 15);
    pop();
  }

  void update(int width, int height) {
    position.add(velocity);
    if (position.x > width) {
      position.x = 0;
    } else if (position.x < 0) {
      position.x = width;
    }
    if (position.y > height) {
      position.y = 0;
    } else if (position.y < 0) {
      position.y = height;
    }
  }
}

ArrayList<Ship> allShip;

void setup() {
  size(1000, 800);
  allShip = new ArrayList<Ship>();
  for (int i = 0; i < 500; i++) {
    color c = color(random(255), random(255), random(255));
    Ship b = new Ship(random(1000), random(800), c);
    allShip.add(b);
  }
}

void draw() {
  background(255);
  for (int i = 0; i < allShip.size(); i++) {
    Ship aship = allShip.get(i);
    aship.render();
    aship.update(width, height);
  }
}
