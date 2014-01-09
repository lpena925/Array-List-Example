ArrayList <Particle> particles = new ArrayList<Particle>();

void setup() {
  size(400, 700);
}

void draw() {
  println(particles.size());
  for(int i = 0; i < 5; i++){
  particles.add(new Particle(mouseX, mouseY));
  }
  background(0);
  for (int i = particles.size()-1; i >= 0; i--) {
    Particle p = particles.get(i);
    p.display();
    p.update();
    if (p.life <= 0 ) {
      particles.remove(i);
    }
  }
}


class Particle {

  PVector loc, acc, vel;
  int d;
  int life;

  Particle(float x, float y) {
    loc = new PVector(x, y);
    vel = new PVector (random(-1, 1), random(-2, 0));
    acc = new PVector (0, 0.1);
    d = 10;
    life = int(random(20,200));
  }

  void display () {
    fill(255, 201, 64, life);
    noStroke();
    ellipse(loc.x, loc.y, d, d);
  }

  void update() {
    loc.add(vel);
    vel.add(acc);
    life--;
  }
}

