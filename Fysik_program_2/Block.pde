class Block {
  PVector loc;
  PVector vel;
  PVector acc;
  PVector force;

  float topspeed;
  float mass;

  float size;



  Block(float _xpos, float _ypos, float _size, float _mass) {
    loc = new PVector(_xpos, _ypos);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
    force = new PVector(0,1);
    
    topspeed = 30;

    mass = _mass;
    size = _size;
  }

  void update() {
    
    acc = PVector.div(force,mass); 
    loc.add(vel);
    vel.add(acc);
    vel.limit(topspeed);

    checkEdges();
    display();
    
    force.mult(0);
  }

  void display() {
    stroke(0);
    rectMode(CENTER);



    fill(200, 100, 100);
    rect(loc.x, loc.y, size, size);

    fill(0);
    textMode(CENTER);
    textSize(20);
    text(mass, loc.x-(size/2), loc.y);
  }

  void addForce(PVector newForce){
    force.add(newForce);
  }


  void checkEdges() {
    if (loc.x > width) {
      loc.x = 0;
    } else if (loc.x < 0) {
      loc.x = width;
    }

    if (loc.y > height) {
      loc.y = 0;
    } else if (loc.y < 0) {
      loc.y = height;
    }
  }

}
