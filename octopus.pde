ArrayList<float[]> octopus_links;
int octopus_linkX,  octopus_linkY,  octopus_spread;
int[] octopus_defaultEye, octopus_pressedEye;
int[] octopus_eye;

float octopus_wiggle;

color octopus_mainColor, octopus_subColor;

void setupOctopus() {
  octopus_links = new ArrayList<float[]>();

  octopus_linkX = 215;
  octopus_linkY = 227;
  octopus_spread = 2;

  octopus_defaultEye = new int[]{150, 177};
  octopus_pressedEye = new int[]{121, 137};

  octopus_eye = new int[]{150, 180};
  
  octopus_wiggle = 0.0;
  
  octopus_mainColor = #D13030;
  octopus_subColor = #F5C1C1;
}

void drawOctopus() {
  octopus(400, height - 250, 0.8f);
}

void octopus(int x, int y, float size) {
  pushStyle();
  scale(size);
  translate(x, y);

  noStroke();

  float noiseY;

  // sucker
  fill(octopus_subColor);
  noiseY = (noise(octopus_wiggle + 0.5) * 20) - 10;
  beginShape();
  vertex(54, 263);
  bezierVertex(136, 306 + noiseY, 188, 277 + noiseY, 169, 343 + noiseY);
  endShape();
  
  noiseY = (noise(octopus_wiggle + 1.0) * 20) - 10;
  beginShape();
  vertex(135, 448);
  bezierVertex(249, 520 + noiseY, 267, 62 + noiseY, 243, 346 + noiseY);
  endShape();
  
  noiseY = (noise(octopus_wiggle + 1.5) * 20) - 10;
  beginShape();
  vertex(239, 473);
  bezierVertex(225, 554 + noiseY, 420, 295 + noiseY, 267, 378 + noiseY);
  endShape();

  noiseY = (noise(octopus_wiggle + 2.0) * 20) - 10;
  beginShape();
  vertex(195, 342);
  bezierVertex(252, 556 + noiseY, 422, -80 + noiseY, 285, 230 + noiseY);
  endShape();

  noiseY = (noise(octopus_wiggle + 2.5) * 20) - 10;
  beginShape();
  vertex(289, 360);
  bezierVertex(300, 416 + noiseY, 538, 457 + noiseY, 518, 417 + noiseY);
  endShape();

  noiseY = (noise(octopus_wiggle + 3.0) * 20) - 10;
  beginShape();
  vertex(357, 327);
  bezierVertex(304, 352 + noiseY, 553, 407 + noiseY, 553, 339 + noiseY);
  endShape();
  
  
  // main body
  beginShape();
  noFill();
  fill(octopus_mainColor);
  vertex(224, 274);
  bezierVertex(102, 54, 499, 92, 311, 275);
  bezierVertex(369, 354, 336, 260, 501, 336);

  noiseY = (noise(octopus_wiggle + 0.5) * 20) - 10;
  bezierVertex(602, 320 + noiseY, 532, 368 + noiseY, 486, 361 + noiseY);
  
  
  noiseY = (noise(octopus_wiggle + 1.0) * 20) - 10;
  bezierVertex(398, 329 + noiseY, 415, 339 + noiseY, 375, 339 + noiseY);
  
  noiseY = (noise(octopus_wiggle + 1.5) * 20) - 10;
  bezierVertex(430, 411 + noiseY, 545, 406 + noiseY, 510, 420 + noiseY);
  
  noiseY = (noise(octopus_wiggle + 2.0) * 20) - 10;
  bezierVertex(415, 440 + noiseY, 444, 403 + noiseY, 306, 372 + noiseY);
  
  noiseY = (noise(octopus_wiggle + 2.5) * 20) - 10;
  bezierVertex(285, 409 + noiseY, 320, 413 + noiseY, 272, 463 + noiseY);
  
  noiseY = (noise(octopus_wiggle + 3.0) * 20) - 10;
  bezierVertex(195, 519 + noiseY, 282, 414 + noiseY, 241, 363 + noiseY);
  
  noiseY = (noise(octopus_wiggle + 3.5) * 20) - 10;
  bezierVertex(231, 407 + noiseY, 231, 310 + noiseY, 178, 444 + noiseY);
  
  noiseY = (noise(octopus_wiggle + 4.0) * 20) - 10;
  bezierVertex(174, 451 + noiseY, 100, 462 + noiseY, 154, 422 + noiseY);
  
  noiseY = (noise(octopus_wiggle + 4.5) * 20) - 10;
  bezierVertex(145, 324 + noiseY, 216, 265 + noiseY, 286, 388 + noiseY);
  
  noiseY = (noise(octopus_wiggle + 5.0) * 20) - 10;
  bezierVertex(234, 343 + noiseY, 210, 298, 169, 342 + noiseY);
  
  noiseY = (noise(octopus_wiggle + 5.5) * 20) - 10;
  bezierVertex(158, 291 + noiseY, 151, 337 + noiseY, 129, 304 + noiseY);
  
  noiseY = (noise(octopus_wiggle + 6.0) * 20) - 10;
  bezierVertex(-44, 225 + noiseY, 133, 260 + noiseY, 153, 281 + noiseY);
  
  noiseY = (noise(octopus_wiggle + 6.5) * 20) - 10;
  bezierVertex(232, 322 + noiseY, 192, 290 + noiseY, 245, 347 + noiseY);
  
  fill(octopus_mainColor);
  noiseY = (noise(octopus_wiggle + 7.0) * 20) - 10;
  bezierVertex(191, 282 + noiseY, 214, 341 + noiseY, 224, 274);
  endShape();
  
  // mouse
  stroke(0);
  fill(#F06D6D);
  ellipse(227, 227, 24, 38);
  line(224, 209, 256, 203);
  line(224, 246, 256, 241);

  noStroke();
  beginShape();
  for (int i=0; i<octopus_links.size(); i++) {
    fill(0, octopus_links.get(i)[2]);
    if (i % 72 == 0) {
      beginShape();
    }
    vertex(octopus_links.get(i)[0], octopus_links.get(i)[1]);

    if (i == octopus_links.size() - 1 || (i + 1) % 72 == 0) {
      endShape(CLOSE);
    }
  }
  endShape();

  if (mousePressed &&
      (get(mouseX, mouseY) == color(#F5C1C1) ||
       get(mouseX, mouseY) == color(#D13030) ||
       get(mouseX, mouseY) == color(#F06D6D))
     ) {
      // eye
      if (octopus_eye[0] > octopus_pressedEye[0]) {
        octopus_eye[0]-=5;
      }
      if (octopus_eye[1] > octopus_pressedEye[1]) {
        octopus_eye[1]-=5;
      }
  
      // link
      if (octopus_spread < 50) {
        for (int angle = 0; angle < 360; angle += 5) {
          float radius = octopus_spread + noise((octopus_linkX + angle) * 0.05, (octopus_linkY + angle) * 0.05) * 25; // 먹물이 퍼지는 정도에 노이즈를 추가
          float px = octopus_linkX + cos(radians(angle)) * radius;
          float py = octopus_linkY + sin(radians(angle)) * radius;
          float alpha = 255 * (1 - (octopus_spread / 50.0));
          float[] temp = {px, py, alpha};
          octopus_links.add(temp);
        }
  
        octopus_spread += 2;
        octopus_linkX -= 5;
      }
    } else {
      // eye
      if (octopus_eye[0] < octopus_defaultEye[0]) {
        octopus_eye[0]+= 5;
      }
      if (octopus_eye[1] < octopus_defaultEye[1]) {
        octopus_eye[1]+=5;
      }
  
      // link cleer
      octopus_links.clear();
      octopus_spread = 2;
      octopus_linkX = 215;
  }
  
  beginShape();
  fill(0);
  vertex(243, 171);
  bezierVertex(215, octopus_eye[0], 206, 203, 238, 194);
  bezierVertex(248, 189, 248, 177, 243, 171);
  endShape();

  beginShape();
  fill(0);
  vertex(303, 166);
  bezierVertex(283, 178, 302, 206, 319, 191);
  bezierVertex(335, octopus_eye[1], 312, 160, 303, 166);
  endShape();
  
  octopus_wiggle+=0.01;
  scale(1);
  translate(0, 0);
  popStyle();
}
