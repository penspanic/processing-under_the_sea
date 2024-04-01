int xc;

void setupStone() {
  xc = 0;
}

void stone_01(int a, int b){
  pushStyle();
  //stone_Base
  noStroke();
  fill(#808f92);
  beginShape();
  curveVertex(34+a,1000+b);
  curveVertex(34+a,1000+b);
  curveVertex(35+a,973+b);
  curveVertex(63+a,938+b); 
  curveVertex(99+a,924+b); 
  curveVertex(132+a,927+b);  
  curveVertex(170+a,944+b);  
  curveVertex(179+a,958+b);
  curveVertex(215+a,973+b);
  curveVertex(227+a,1008+b);
  curveVertex(181+a,1016+b);
  curveVertex(91+a,1015+b);
  curveVertex(41+a,1012+b);
  curveVertex(34+a,1000+b);
  curveVertex(34+a,1000+b);
  endShape();
  //stone_Spot
  fill(#919ea1);
  ellipse(126,934,17,5);
  ellipse(144,943,22,5);
  ellipse(110,943,11,5);
  ellipse(191,970,25,5);  
  fill(#76878a);
  ellipse(153,958,57,5);
  ellipse(138,1008,165,11);
  popStyle();
}

void seaweeds_01(int c, int d){
  pushStyle();
  noStroke();
  fill(#2CA739);
  //seaweeds_base
  beginShape();
  curveVertex(83+c,506+d);
  curveVertex(83+c,506+d);
  curveVertex(82+c,471+d);
  curveVertex(99+c+xc,437+d);
  curveVertex(92+c+xc, 390+d);
  curveVertex(120+c+xc,352+d);
  curveVertex(113+c+xc,284+d);
  curveVertex(148+c+xc,321+d);
  curveVertex(152+c+xc,363+d);
  curveVertex(132+c+xc,387+d);
  curveVertex(123+c+xc,399+d);
  curveVertex(133+c+xc,442+d);
  curveVertex(122+c,479+d);
  curveVertex(119+c,503+d);
  curveVertex(119+c,503+d);
  endShape();
  //seaweeds_middle_line
  noFill();
  stroke(#14831e);
  strokeWeight(4);
  beginShape();
  curveVertex(103+c,506+d);
  curveVertex(102+c,471+d);
  curveVertex(119+c+xc,437+d);
  curveVertex(110+c+xc,390+d);
  curveVertex(137+c+xc,331+d);
  curveVertex(61+c+xc,284+d);
  endShape();
  popStyle();
}

void seaweeds_02(int f, int g){
  pushStyle();
  noStroke();
  fill(#2c7032);
  //seaweeds_base
  beginShape();
  curveVertex(83+f,506+g);
  curveVertex(83+f,506+g);
  curveVertex(82+f,471+g);
  curveVertex(99+f+xc,437+g);
  curveVertex(92+f+xc, 390+g);
  curveVertex(120+f+xc,352+g);
  curveVertex(113+f+xc,284+g);
  curveVertex(148+f+xc,321+g);
  curveVertex(152+f+xc,363+g);
  curveVertex(132+f+xc,387+g);
  curveVertex(123+f+xc,399+g);
  curveVertex(133+f+xc,442+g);
  curveVertex(122+f,479+g);
  curveVertex(119+f,503+g);
  curveVertex(119+f,503+g);
  endShape();
  //seaweeds_middle_line
  noFill();
  stroke(#1f4e23);
  strokeWeight(4);
  beginShape();
  curveVertex(103+f,506+g);
  curveVertex(102+f,471+g);
  curveVertex(119+f+xc,437+g);
  curveVertex(110+f+xc,390+g);
  curveVertex(137+f+xc,331+g);
  curveVertex(61+f+xc,284+g);
  endShape();
  popStyle();
}

void drawStone() {
  seaweeds_02(-29,469);
  seaweeds_02(-12,562);
  seaweeds_02(90,520);  
  seaweeds_01(37,554);
  stone_01(-3,-2);
  seaweeds_01(-64,515);
  seaweeds_01(-106,614);    

  //animation_seaweed_01,02
  if (mousePressed && xc <= 10){
    xc++;
  } else if(xc > -20){
    xc--;
  }
}