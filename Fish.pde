class Fish {
  private float x;
  private float y;
  private int size;
  private color c;
  private float fishWidth;
  private float fishHeight;
  private float xDir;

  Fish(float x, float y, int size, color c) {
    this(x, y, size, c, 2);
  }
  
  Fish(float x, float y, int size, color c, float xDir) {
    this.x = x;
    this.y = y;
    this.size = size;
    this.c = c;
    this.fishWidth = size * 1.2;
    this.fishHeight = size / 3 * 2;
    this.xDir = xDir;
  }

  public void move() {
    x += xDir;

    if (isAtLeftEdge()) {
      reverseXDirection();
    } else if (isAtRightEdge()) {
      reverseXDirection();
    }
  }

  public void reverseXDirection() {
    xDir *= -1;
    if (xDir > 0) {
      x = min(x + fishWidth, width);
    } else {
      x = max(x - fishWidth, 0);
    }
  }

  public void draw() {
    if (xDir > 0) {
      drawRight();
    } else {
      drawLeft();
    }
  }

  private boolean isAtLeftEdge() {
    return x <= 0;
  }

  private boolean isAtRightEdge() {
    return x >= width;
  }

  private void drawLeft() {
    // fin
    pushStyle();

    noStroke();
    color finColor = darkerColor(c);
    fill(finColor);

    beginShape();
    vertex(x + size * 0.25, y - (size * 0.2));
    vertex(x + size * 0.62, y - (size * 0.35));
    vertex(x + size * 0.66, y - (size * 0.2));
    endShape();

    beginShape();
    vertex(x + size * 0.25, y + (size * 0.2));
    vertex(x + size * 0.62, y + (size * 0.35));
    vertex(x + size * 0.66, y + (size * 0.2));
    endShape();

    popStyle();

    // body
    pushStyle();

    noStroke();
    fill(c);

    beginShape();
    vertex(x, y);
    bezierVertex(x + size * 0.25, y - fishHeight / 2, x + size * 0.75, y - fishHeight / 2, x + size, y);
    vertex(x + fishWidth, y + size * 0.2);
    bezierVertex(
      x + fishWidth * 0.95,
      y + size * 0.2,
      x + fishWidth * 0.95,
      y - size * 0.2,
      x + fishWidth,
      y - size * 0.2
      );
    vertex(x + size, y);
    bezierVertex(x + size * 0.75, y + fishHeight / 2, x + size * 0.25, y + fishHeight / 2, x, y);
    endShape();

    popStyle();

    // pupil
    pushStyle();

    noStroke();
    fill(#FFFFFF);
    circle(x + size * 0.15, y - size * 0.05, size * 0.08);
    fill(#000000);
    circle(x + size * 0.16, y - size * 0.05, size * 0.06);
    fill(#FFFFFF);
    circle(x + size * 0.14, y - size * 0.04, size * 0.03);

    popStyle();
  }

  private void drawRight() {
    // fin
    pushStyle();

    noStroke();
    color finColor = darkerColor(c);
    fill(finColor);

    beginShape();
    vertex(x - size * 0.25, y - (size * 0.2));
    vertex(x - size * 0.62, y - (size * 0.35));
    vertex(x - size * 0.66, y - (size * 0.2));
    endShape();

    beginShape();
    vertex(x - size * 0.25, y + (size * 0.2));
    vertex(x - size * 0.62, y + (size * 0.35));
    vertex(x - size * 0.66, y + (size * 0.2));
    endShape();

    popStyle();

    // body
    pushStyle();

    noStroke();
    fill(c);

    beginShape();
    vertex(x, y);
    bezierVertex(x - size * 0.25, y - fishHeight / 2, x - size * 0.75, y - fishHeight / 2, x - size, y);
    vertex(x - fishWidth, y + size * 0.2);
    bezierVertex(
      x - fishWidth * 0.95,
      y + size * 0.2,
      x - fishWidth * 0.95,
      y - size * 0.2,
      x - fishWidth,
      y - size * 0.2
      );
    vertex(x - size, y);
    bezierVertex(x - size * 0.75, y + fishHeight / 2, x - size * 0.25, y + fishHeight / 2, x, y);
    endShape();

    popStyle();

    // pupil
    pushStyle();

    noStroke();
    fill(#FFFFFF);
    circle(x - size * 0.15, y - size * 0.05, size * 0.08);
    fill(#000000);
    circle(x - size * 0.16, y - size * 0.05, size * 0.06);
    fill(#FFFFFF);
    circle(x - size * 0.14, y - size * 0.04, size * 0.03);

    popStyle();
  }

  public boolean isClick(int x, int y) {
    if (y >= this.y - fishHeight / 2 && y <= this.y + fishHeight / 2) {
      if (xDir > 0 && x <= this.x && x >= this.x - fishWidth) {
        return true;
      } else if (xDir < 0 && x >= this.x && x <= this.x + fishWidth) {
        return true;
      }
    }
    return false;
  }
}
