void drawFrame() {
    pushStyle();

    int frameColor = #33130B;
    stroke(frameColor);
    strokeWeight(frameThickness);
    line(0, 0, width, 0);
    line(0, 0, 0, height);
    line(width, 0, width, height);
    line(0, height, width, height);

    popStyle();
}