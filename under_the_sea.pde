void setup() {
    size(1280, 1024, P2D);
    setupParticles();
    setupShark();
    setupStone();
    setupFish();
    setupOctopus();
}

int frameThickness = 100;
float timeOfDay = 0.0;
float lightFactor = 0.0;
float todCycleSeconds = 10.0;
float oceanCurrents = 0; // 해류, x방향성을 가지고 음수일 수 있다. 객체들의 움직임에 영향을 준다.


void draw() {
    // logic update
    updateTimeOfDay();
    updateOceanCurrents();
    updateParticles();
    updateShark();
    updateTurtle();


    // draw
    background(0);
    drawBackground(0, 0, width, height);
    drawParticles(0, 0, width, height);
    drawShark(sharkPosition);
    drawFish();

    turtle(turtleX, turtleY);
    drawOctopus();
    drawRay();
    drawStone();
    drawBubble();

    //drawFrame();
}

void updateTimeOfDay() {
    timeOfDay = (millis() % (int)(todCycleSeconds * 1000)) / (todCycleSeconds * 1000);
    if (timeOfDay > 0.5f)
    {
        lightFactor = 1 - (timeOfDay - 0.5f) * 2;
    }
    else
    {
        lightFactor = timeOfDay * 2;
    }
}

void updateOceanCurrents() {
    // noise함수를 사용해 oceanCurrents를 결정한다.
    // noise함수는 0~1사이의 값을 반환하므로 -0.5를 곱해 -0.5~0.5사이의 값을 반환하도록 한다.
    oceanCurrents = (noise(timeOfDay * 10) - 0.5) * 2 * 10;
}


void drawBackground(int x, int y, int sizeX, int sizeY) {
    pushStyle();

    // gradation
    color startColor_brightest = 0xFF9BB5FF;
    //color startcolor_darkest = 0xFF001144;
    color startcolor_darkest = 0xFF1F4095;
    color endColor_brightest = 0xFF002284;
    //color endColor_darkest = 0xFF000000;
    color endColor_darkest = 0xFF000515;

    
    color startColor = lerpColor(startcolor_darkest, startColor_brightest, lightFactor);
    color endColor = lerpColor(endColor_darkest, endColor_brightest, lightFactor);

    for (int i = 0; i < sizeY; i++) {
        color currentColor = lerpColor(startColor, endColor, (float)i / sizeY);
        //color currentColor = startColor;
        //println(currentColor);
        stroke(currentColor);
        line(x, y + i, x + sizeX, y + i);
    }

    // light effects
    // 수면위의 햇빛이 수면 아래에 비치는 효과
    // 위에서 아래로 향하는 방향임.
    // light의 위치는 timeOfDay에 따라 변화함.
    // light는 햇빛의 위치로부터 퍼져나가는 원뿔 형태임.
    // random을 사용하지 않고 deterministic하게 만들어야 함.
    int lightCount = 20;
    float totalAngle = 140;
    float startAngle = lerp(180 - totalAngle, 90 + totalAngle, timeOfDay);
    float endAngle = lerp(90 - totalAngle, 180 - totalAngle, timeOfDay);
    float lightXRange = sizeX / 4;
    float lightXIntervalStandard = lightXRange / (lightCount - 1);
    float lightXIntervalMin = lightXIntervalStandard * 0.8;
    float lightXIntervalMax = lightXIntervalStandard * 1.2;
    // light의 간격은 무작위로 결정되지만 timeOfDay에 따라 deterministic하게 결정되어야 함.

    float lightAlpha = lerp(0f, 122f, lightFactor);
    noStroke();
    color lightColor = #ffffff;
    color lightColorStart = color(red(lightColor), green(lightColor), blue(lightColor), lightAlpha);
    color lightColorEnd = color(red(lightColor), green(lightColor), blue(lightColor), 0);
    for (int i = 0; i < lightCount; ++i)
    {
        float xInterval = lerp(lightXIntervalMin, lightXIntervalMax, noise(timeOfDay * 5));
        float lightX = -lightXRange / 2 + xInterval * i + sizeX * timeOfDay;
        //float lightX = -lightXRange / 2 + i * (lightXRange / (lightCount - 1)) + x + sizeX * timeOfDay;
        float lightY = y - lightXRange / 2;
        float lightLength = sizeY * 2;
        
        float lightAngle = startAngle + (endAngle - startAngle) * i / (lightCount - 1);
        
        println(lightColor);
        float lightAngleRad = radians(lightAngle);
        float lightEndX = lightX + lightLength * cos(lightAngleRad);
        float lightEndY = lightY + lightLength * sin(lightAngleRad);


        //float lightThickness = sin0to1(timeOfDay * (i + 1) * 3.54) * 10 + 1;
        float lightThickness = noise(i * 10 + timeOfDay * 20) * 20 + 5;
        fill(lightColor);
        beginShape();
        fill(lightColorStart);
        vertex(lightX - lightThickness / 8, lightY); // left top
        vertex(lightX + lightThickness / 8, lightY); // right top
        fill(lightColorEnd);
        vertex(lightEndX + lightThickness, lightEndY); // right bottom
        vertex(lightEndX - lightThickness, lightEndY); // left bottom
        endShape(CLOSE);
    }

    popStyle();
}

float randomTod(float seed) {
    return noise(seed + timeOfDay);
}