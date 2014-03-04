void setup() {
  size(1600,900);
  smooth();  
}

void draw() {
  background(30);
  // Fix co-ordinate system
  translate(0,height);
  scale(1,-1);
  drawBike(50,11);
  noLoop();
//  save("Big Wheel.png");
}

void drawWheel(float size, float xpos) {
  pushMatrix();
  translate(xpos, size/2);
  ellipse(0,0,size,size);
  popMatrix();
}

void drawFrame(float wheelSize, float wheelBase) {
  pushMatrix();
  pushStyle();
  strokeWeight(20);
  noFill();

  stroke(255);
  
  beginShape();
  vertex(wheelBase, wheelSize/2);
  quadraticVertex(wheelBase-100,wheelSize/2+100,wheelBase-120,wheelSize/2+200);
  vertex(wheelBase-150,wheelSize+175);
  vertex(wheelBase-100, wheelSize+175);
  bezierVertex(wheelBase+30, wheelSize+175, wheelBase+30, wheelSize+25, wheelBase-100, wheelSize+25);  
  endShape();

//  stroke(255,0,0);
  beginShape();
  vertex(0,wheelSize/2);
  vertex(wheelSize/2+100, wheelSize/2-40);
  vertex(wheelBase-141, wheelSize+75);
  vertex(wheelBase-145, wheelSize+120);
  vertex(wheelSize/2-75,wheelSize+50);
  endShape(CLOSE);
  
  beginShape();
  vertex(wheelSize/2+100,wheelSize/2-40);
  vertex(wheelSize/2-150,wheelSize+250);
  endShape();
  
//  stroke(0);
  beginShape();
  vertex(wheelSize/2-220,wheelSize+275);
  bezierVertex(wheelSize/2-150,wheelSize+250,wheelSize/2-80,wheelSize+280,wheelSize/2-50,wheelSize+240);
  endShape();
  
  popMatrix();
  popStyle();
}

void drawBike() {
  drawBike(50,11);
}

void drawBike( float chainring, float sprocket ) {
  float wheelSize = 700;
  float wheelBase = 1000;
  float rearWheelSize = wheelSize * chainring / sprocket;

  pushMatrix();
  noStroke();
  fill(200,150);
  
  scale(min(0.5, height/rearWheelSize));
  translate(rearWheelSize/2,0);

  drawWheel(wheelSize, 0);
  drawWheel(wheelSize, wheelBase);

  fill(10,200,200,100);
  drawWheel(rearWheelSize, 0);

  drawFrame(wheelSize, wheelBase);
  popMatrix();
}
