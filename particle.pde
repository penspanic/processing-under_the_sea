ArrayList<Particle> particles = new ArrayList<Particle>();

public class Particle
{
    public float x;
    public float y;
    public float size;
    public float dirX;
    public float dirY;
    public color c;
    public Particle(float x, float y, float size, float dirX, float dirY, color c)
    {
        this.x = x;
        this.y = y;
        this.size = size;
        this.dirX = dirX;
        this.dirY = dirY;
        this.c = c;
    }
}
void setupParticles() {
    int particleCount = 100;
    for (int i = 0; i < particleCount; ++i)
    {
        float particleX = random(0, width);
        float particleY = random(0, height);
        float particleSize = random(1, 10);
        float randomDirection = random(0, 360);
        float dirX = cos(radians(randomDirection));
        float dirY = sin(radians(randomDirection));
        color c = color(random(240, 255), random(240, 255), random(240, 255), random(100, 255));
        Particle particle = new Particle(particleX, particleY, particleSize, dirX, dirY, c);
        particles.add(particle);
    }
}

void updateParticles() {
    // particle은 랜덤한 방향으로 움직이며, 화면 밖으로 나가면 화면 밖 어딘가에서 화면 안으로 들어옴.
    for (Particle particle : particles)
    {
        // oceanCurrent의 영향은 size가 클수록 적게 받는다. 질량을 시뮬레이션.
        float oceanCurrentX = oceanCurrents * (2 / particle.size);
        particle.x += particle.dirX + oceanCurrentX;
        particle.y += particle.dirY;
        if (particle.x < 0)
        {
            particle.x = width;
        }
        else if (particle.x > width)
        {
            particle.x = 0;
        }
        if (particle.y < 0)
        {
            particle.y = height;
        }
        else if (particle.y > height)
        {
            particle.y = 0;
        }
    }
}


void drawParticles(int x, int y, int sizeX, int sizeY) {
    pushStyle();

    noStroke();
    for (Particle particle : particles)
    {
        float particleX = particle.x;
        float particleY = particle.y;
        float particleSize = particle.size;
        float alpha = lerp(0f, 122f, lightFactor);
        color c = particle.c;
        c = color(red(c), green(c), blue(c), alpha);
        fill(c);
        ellipse(particleX, particleY, particleSize, particleSize);
    }

    popStyle();
}