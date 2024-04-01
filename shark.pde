ArrayList<PVector> sharkVertices = createShark();
PVector sharkPosition = new PVector(700, 100);
PVector sharkDirection = new PVector(-3, 0);
PVector sharkSize = new PVector(400, 200);
PGraphics sharkSourceImage;
PGraphics sharkMaskImage;


void setupShark() {
    sharkSourceImage = createGraphics(400, 200);
    sharkMaskImage = createGraphics(400, 200);

}

ArrayList<PVector> createShark() {
    var vertices = new ArrayList<PVector>();
    //beginShape();
    vertices.add(new PVector(24, 86));
    vertices.add(new PVector(93, 70));
    vertices.add(new PVector(168, 66));
    vertices.add(new PVector(205, 31)); // 윗지느러미 끝
    vertices.add(new PVector(212, 70));
    vertices.add(new PVector(275, 78));
    vertices.add(new PVector(329, 90)); // 윗 꼬리 시작
    vertices.add(new PVector(385, 50));
    vertices.add(new PVector(360, 93));
    vertices.add(new PVector(373, 134));
    vertices.add(new PVector(332, 106)); // 아래 꼬리 시작
    vertices.add(new PVector(258, 120));
    vertices.add(new PVector(170, 134)); // 아래 지느러미 오른쪽 시작
    vertices.add(new PVector(175, 159));
    vertices.add(new PVector(145, 135));
    vertices.add(new PVector(145, 155));
    vertices.add(new PVector(124, 131));
    vertices.add(new PVector(69, 114)); // 아래 입 시작
    vertices.add(new PVector(106, 114));
    vertices.add(new PVector(62, 106));
    return vertices;
}

void updateShark() {
    sharkPosition.x += sharkDirection.x;
    sharkPosition.y += sharkDirection.y;
    if (sharkPosition.x + sharkSize.x < 0)
    {
        sharkPosition.x = width + random(0, 500);
        sharkPosition.y = random(frameThickness, height - frameThickness - sharkSize.y);
    }
    // else if (sharkPosition.x > width + sharkSize.x)
    // {
    //     sharkPosition.x = 0;
    // }
}

void drawShark(PVector position) {
    pushStyle();
    color startColor = #0D1F30;
    color endColor = #A9BFD4;
    int lerpStartY = 55;
    int lerpEndY = 190;
    sharkSourceImage.beginDraw();
    sharkSourceImage.background(0);
    for (int i = 0; i < sharkSourceImage.width; ++i) {
        color c = 0;
        if (i < lerpStartY) {
            c = startColor;
        }
        else if (i > lerpEndY) {
            c = endColor;
        }
        else {
            c = lerpColor(startColor, endColor, (float)(i - lerpStartY) / (lerpEndY - lerpStartY));
        }
        //color c = lerpColor(startColor, endColor, (float)i / sharkSourceImage.width);
        sharkSourceImage.stroke(c);
        sharkSourceImage.line(0, i, sharkSourceImage.width, i);
    }
    sharkSourceImage.endDraw();

    // sharkMaskImage.beginDraw();
    // sharkMaskImage.beginShape();
    // for (int i = 0; i < sharkVertices.size(); ++i) {
    //     PVector v = sharkVertices.get(i);
    //     sharkMaskImage.vertex(v.x, v.y);
    // }
    // sharkMaskImage.endShape(CLOSE);
    // sharkMaskImage.endDraw();

    // sharkSourceImage.mask(sharkMaskImage);
    //image(sharkSourceImage, position.x, position.y, sharkSize.x, sharkSize.y);
    // fill(0);
    float sharkYSize = 180;
    float xCycle = 100;
    float xAmp = 10;
    float yAmp = 5;
    drawVerticesWithWaveDistortion2(position, sharkSourceImage, sharkMaskImage, sharkVertices, sharkYSize, xCycle, xAmp, yAmp);
    PVector eyePosition = new PVector(75, 90);
    eyePosition = waveDistortion(eyePosition, sharkYSize, xCycle, xAmp / 3, yAmp);
    // draw eye
    noStroke();
    fill(0);
    ellipse(position.x + eyePosition.x, position.y + eyePosition.y, 8, 6);
    fill(255);
    ellipse(position.x + eyePosition.x + 1, position.y + eyePosition.y - 1, 2, 2);
    popStyle();
}