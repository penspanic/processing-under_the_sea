int turtleX = 300;
float turtleY = 400;
float turtleA = 0.0;
float inc = TWO_PI/200;

void updateTurtle() {
  turtleX += 1;
  turtleY = 700 + sin(turtleA) * 50;
  turtleA += inc;

  if (turtleX > width + 200) {
    turtleX = 0;
  }
}

void turtle(int x, float y) {
  noStroke();
  fill(#7abd05);
  beginShape();
  curveVertex(x, y-38);
  curveVertex(x-7, y-7);
  curveVertex(x-32, y+28);
  curveVertex(x-67, y+23);
  curveVertex(x-6, y-30);
  curveVertex(x-115, y+18);
  endShape();

  ellipse(x-50, y-18, 50, 15);

  beginShape();
  curveVertex(x+70, y+99);
  curveVertex(x+51, y-14);
  curveVertex(x+2, y+29);
  curveVertex(x+41, y+23);
  curveVertex(x+39, y-32);
  curveVertex(x-153, y+22);
  endShape();

  beginShape();
  curveVertex(x-109, y-181);
  curveVertex(x-21, y-14);
  curveVertex(x+57, y-86);
  curveVertex(x+100, y-51);
  curveVertex(x+38, y+107);
  endShape();

  fill(#406312);
  beginShape();
  curveVertex(x+83, y+47);
  curveVertex(x+62, y-5);
  curveVertex(x+41, y-54);
  curveVertex(x-33, y-54);
  curveVertex(x-63, y+2);
  curveVertex(x-96, y-8);
  endShape();

  stroke(56, 82, 31);
  strokeWeight(4);
  line(x-33, y-16, x+23, y-52);
  line(x-1, y-13, x+41, y-42);
  line(x+41, y-19, x-9, y-46);
  line(x+24, y-10, x-31, y-40);

  noStroke();//qkfxhq
  fill(#464343);
  ellipse(x-58, y+29, 6, 9);
  ellipse(x-46, y+30, 6, 9);
  ellipse(x-34, y+27, 6, 9);
  ellipse(x+13, y+31, 6, 9);
  ellipse(x+24, y+30, 6, 9);
  ellipse(x+34, y+27, 6, 9);

  fill(#d6e090, 70);
  ellipse(x-2, y-50, 23, 5);
  ellipse(x+24, y-51, 9, 4);

  fill(#679b44);
  rect(x-61, y-8, 126, 13, 41);

  fill(#000000);//sns
  ellipse(x+83, y-72, 6, 5);
}
