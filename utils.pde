
float sin0to1(float time) {
  return (sin(time) + 1) * 0.5f;
}

float minus1to1(float zeroToOne) {
  return zeroToOne * 2 - 1;
}

public class Animation {
    public float duration;
    public boolean loop;
    public float speed;

    

    public void update() {

    }
}

void drawVerticesWithWaveDistortion(PVector position, ArrayList<PVector> vertices, ArrayList<Integer> vertexColors, float ySize, float xCycle, float xAmplitude, float yAmplitude) {
    beginShape();
    for (int i = 0; i < vertices.size(); i++) {
        PVector v = vertices.get(i);
        color c = vertexColors.get(i);
        fill(c);
        float xRatio = (v.x % xCycle) / xCycle;
        float currentXAmplitude = xRatio * xAmplitude;
        //float x = v.x + sin((float)frameCount / 10 + i * 0.5) * currentXAmplitude;
        float x = v.x + sin((float)frameCount / 10) * currentXAmplitude;
        float currentYAmplitude = (v.y - ySize / 2) / ySize * yAmplitude * 2;
        //float y = v.y + cos((float)frameCount / 10 + i * 0.5) * currentYAmplitude;
        float y = v.y + cos((float)frameCount / 10) * currentYAmplitude;
        vertex(position.x + x, position.y + y);
        //ellipse(x, y, 5, 5);
    }
    endShape(CLOSE);
}

PVector waveDistortion(PVector position, float ySize, float xCycle, float xAmplitude, float yAmplitude) {
    float xRatio = (position.x % xCycle) / xCycle;
    float currentXAmplitude = xRatio * xAmplitude;
    float x = position.x + sin((float)frameCount / 10) * currentXAmplitude;
    float currentYAmplitude = (position.y - ySize / 2) / ySize * yAmplitude * 2;
    float y = position.y + cos((float)frameCount / 10) * currentYAmplitude;
    return new PVector(x, y);
}

void drawVerticesWithWaveDistortion2(PVector position, PGraphics source, PGraphics mask, ArrayList<PVector> vertices, float ySize, float xCycle, float xAmplitude, float yAmplitude) {
    mask.beginDraw();
    mask.beginShape();
    for (int i = 0; i < vertices.size(); i++) {
        PVector v = vertices.get(i);
        float xRatio = (v.x % xCycle) / xCycle;
        float currentXAmplitude = xRatio * xAmplitude;
        float x = v.x + sin((float)frameCount / 10 + i * 0.5) * currentXAmplitude;
        float currentYAmplitude = (v.y - ySize / 2) / ySize * yAmplitude * 2;
        float y = v.y + cos((float)frameCount / 10 + i * 0.5) * currentYAmplitude;
        //mask.vertex(position.x + x, position.y + y);
        mask.vertex(x, y);
        //ellipse(x, y, 5, 5);
    }
    mask.endShape(CLOSE);
    mask.endDraw();

    source.mask(mask);
    image(source, position.x, position.y);
}