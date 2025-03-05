Block block;
Block block2;

float g = 0.02;
float d = 0.2;




void setup(){
  size(1200,1000);
  background(100);
  
  block = new Block(200,200,50,20);
  block2 = new Block(500,200,30,10);
}

void draw(){
  background(100);
  
  block.addForce(new PVector(0, block.mass*g));
  //float m = block.vel.mag();
  block.addForce(new PVector(0, - d*sq(block.vel.mag())));
  block2.addForce(new PVector(0, block2.mass*g));
  
  block.update();
  block2.update();
}
