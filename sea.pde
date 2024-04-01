Fish[] fishes;

void setupFish() {
  fishes = createFishes();
}

void drawFish() {
  moveFishes(fishes);
  drawFishes(fishes);
}

Fish[] createFishes() {
  Fish[] fishes = {
    new Fish(120, 500, 100, #FFB74B),
    new Fish(800, 100, 80, #FF0000),
    new Fish(400, 700, 150, #00FF00, -2),
    new Fish(600, 300, 140, #00FFFF, -3),
  };
  return fishes;
}

void moveFishes(Fish[] fishes) {
  for (int i = 0; i < fishes.length; i++) {
    fishes[i].move();
  }
}

void drawFishes(Fish[] fishes) {
  for (int i = 0; i < fishes.length; i++) {
    fishes[i].draw();
  }
}

void mouseClicked() {
  for (int i = 0; i < fishes.length; i++) {
    if (fishes[i].isClick(mouseX, mouseY)) {
      fishes[i].reverseXDirection();
    }
  }
}

color darkerColor(color c) {
  return darkerColor(c, 50);
}

color darkerColor(color c, int amount) {
  float r = max(red(c) - amount, 0);
  float g = max(green(c) - amount, 0);
  float b = max(blue(c) - amount, 0);
  return color(r, g, b);
}
