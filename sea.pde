Fish[] fishes;

void setupFish() {
  fishes = createFishes();
}

void drawFish() {
  moveFishes(fishes);
  drawFishes(fishes);
}

Fish[] createFishes() {
  ArrayList<Fish> fishList = new ArrayList<Fish>();
  fishList.add(new Fish(120, 500, 100, #FFB74B));
  fishList.add(new Fish(800, 100, 80, #FF0000));
  fishList.add(new Fish(400, 800, 150, #00FF00, -2));
  fishList.add(new Fish(600, 300, 140, #00FFFF, -3));

  for (int i = 0; i < 20; ++i)
  {
    int size = (int)random(30, 50);
    color c = randomColor();
    float x = random(0, width);
    float y = random(0, height);
    float speed = random(-2, 2);
    fishList.add(new Fish(x, y, size, c, speed));
  }

  for (int i = 0; i < 30; ++i)
  {
    int size = (int)random(10, 30);
    color c = randomColor();
    float x = random(0, width);
    float y = random(0, height);
    float speed = random(-2, 2);
    fishList.add(new Fish(x, y, size, c, speed));
  }

  Fish[] arr = new Fish[fishList.size()];
  fishList.toArray(arr);
  return arr;
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
