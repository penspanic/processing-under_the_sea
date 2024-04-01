int a, b;

void drawBubble(){
  
  //background(#075ADE);
  stroke(255);
  strokeWeight(2);
  ellipse(mouseX, mouseY+b, 3,3);
  ellipse(mouseX -20 +a , mouseY +20 +b, 10, 10);
  
  noFill();
  ellipse(mouseX, mouseY -25, 10, 10);
  ellipse(mouseX+10 +b, mouseY +30, 3,3);

    noFill();
  ellipse(mouseX +25 , mouseY -10 +a, 20, 20);
    fill(255, 50);
  ellipse(mouseX+a+b, mouseY -15, 10, 10);
    fill(255, 50);
  ellipse(mouseX, mouseY+b, 5, 5);
  
    noFill();
  ellipse(mouseX +15 , mouseY -25 -a, 20, 20);
    fill(255, 50);
  ellipse(mouseX-10+b, mouseY -1, 10, 10);
    fill(255, 50);
  ellipse(mouseX, mouseY+b, 5, 5);
  
  noFill();
  ellipse(mouseX -10 +a , mouseY +50 -b, 10, 10);
  ellipse(mouseX, mouseY -25, 10, 10);
  ellipse(mouseX+50 -b, mouseY +20,3,3);
  
  noFill();
  ellipse(mouseX +65 , mouseY -60 +a, 10, 10);
  ellipse(mouseX+b, mouseY -75, 10, 10);
  ellipse(mouseX+30, mouseY+b, 10, 10);
  ellipse(mouseX -50 +a , mouseY +20 -b,5, 5);
  
  fill(255, 50);
  ellipse(mouseX+b, mouseY -25, 10, 10);
  ellipse(mouseX+60 +b, mouseY -20, 7, 7);
  
  fill(255, 100);
  noStroke();
  ellipse(mouseX+b, mouseY -25, 7, 7);
  ellipse(mouseX+60 +b, mouseY -20, 5, 5);

  stroke(255);
    noFill();
  ellipse(mouseX +85 , mouseY -20 +a, 7, 7);
    fill(255, 50);
  ellipse(mouseX-b, mouseY -80, 20, 20);
  noStroke();
  
  fill(255, 50);
  noStroke();
  ellipse(mouseX+21+b, mouseY -35, 17, 17);
  ellipse(mouseX+14-a, mouseY -15, 10, 10);
  ellipse(mouseX+57+b, mouseY -20, 7, 7);
  ellipse(mouseX+25+a, mouseY +40, 3, 3);
  ellipse(mouseX+8+a, mouseY -7, 3, 3);
  
  
    
  ellipse(mouseX, mouseY +30, 10, 10);
  mouseX = constrain(mouseX, 1, width);
  mouseY = constrain(mouseY, 1, height);
  
  if(mousePressed == true){
    a += 2;
    b += 1;
    // a = constrain(a, 10, width);
    // b = constrain(b, 10, height);
    
  }else if(mouseX > 80){
    
    a -= 2;
    b -= 1;
    
  }
}
