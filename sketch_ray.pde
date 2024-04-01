int rayX = 187;
int rayY = 680;
int rayDirx = 1;
int rayDiry = 1;
int rayTailDir = 1;
int minRayY = rayY - 25;
int maxRayY = rayY + 25;

void drawRay() {
  rayX += rayDirx;
  rayY += rayDiry;

  if (rayX >= width + 190) { //오른쪽 닿았을 때 처음으로
    rayX = 0;
  }
  
  if ((rayDiry < 0 && rayY <= minRayY) || (rayDiry > 0 && rayY >= maxRayY)){
    rayDiry *= -1;
  }

  ray(rayX, rayY);
}

boolean isRayClicked() {
  return mouseX < rayX && mouseX > rayX-108 && mouseY < rayY+40 && mouseY > rayY-85;
}

void reverseRayTail() {
  rayTailDir *= -1;
}

void ray(int x, int y) {
  fill(215, 228, 246);
  stroke(178, 191, 210);
  strokeWeight(6);

  beginShape();

  vertex(x, y); //맨앞1
  bezierVertex(x, y, x-3, y-30, x-23, y-31); //1~2
  bezierVertex(x-21, y-31, x-22, y-64, x-46, y-85); //2~3
  bezierVertex(x-56, y-85, x-87, y-84, x-104, y-38); //3~4

  // 2
  if (rayTailDir == 1) {
    bezierVertex(x-112, y-38, x-128, y-53, x-148, y-29); //4~5 꼬리
    bezierVertex(x-167, y-16, x-121, y-42, x-108, y-22); //5~6
  } else {
    bezierVertex(x-125, y-31, x-162, y-43, x-156, y-50); //4~5 꼬리
    bezierVertex(x-167, y-40, x-126, y-11, x-107, y-15); //5~6
  }
  bezierVertex(x-108, y-22, x-109, y+15, x-87, y+40); //6~7
  bezierVertex(x-87, y+40, x-60, y+41, x-37, y+16); //7~8
  bezierVertex(x-37, y+16, x-9, y+15, x, y); //8~1

  endShape();

  stroke(0);
  strokeWeight(3);

  point(x-24, y-14); //코1
  point(x-26, y-4); //코2

  curve(x-26, y+6, x-35, y-18, x-32, y-9, x-3, y-3); //입
  curve(x-30, y-21, x-35, y+1, x-32, y-9, x+3, y+2);

  point(x-48, y-35); //배
  point(x-56, y-40);
  point(x-66, y-43);
  point(x-74, y-44);
  point(x-60, y+4);
  point(x-69, y+3);
  point(x-77, y+1);
  point(x-85, y-2);
}