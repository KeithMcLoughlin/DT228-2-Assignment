class Projector
{
  //fields
  PVector pos;
  float pWidth, pHeight;
  float cirGap;
  PVector cir1;
  PVector cir2;
  float theta;
  PImage reel;
  
  Projector()
  {
    this(width / 2, height / 2, 100, 50);
  }
  
  Projector(float x, float y, float w, float h)
  {
    pWidth = w;
    pHeight = h;
    pos = new PVector(x,y);
    float cirX = pos.x + (pWidth * 0.15f);
    cirGap = pHeight * 0.75f;
    float cirY = pos.y - cirGap;
    cir1 = new PVector(cirX, cirY);
    cir2 = new PVector(cirX + (pWidth * 0.75f), cirY);
    theta = 0.0f;
    reel = loadImage("filmReel.png");
  }
  
  //draw the projector
  void render()
  {
    fill(0);
    stroke(255);
    rect(pos.x, pos.y, pWidth, pHeight);
    rect(pos.x + pWidth, pos.y + (pHeight * 0.3f), pWidth * 0.1f, pHeight * 0.4f);
    fill(255);
    strokeWeight(3);
    ellipse(cir1.x, cir1.y, cirGap * 2, cirGap * 2);
    ellipse(cir2.x, cir2.y, cirGap * 2, cirGap * 2);
    strokeWeight(1);
    stroke(0);
  }
  
  //rotate the reels
  void update()
  {
    reel.resize((int)cirGap * 2, (int)cirGap * 2);
    pushMatrix();
    translate(cir1.x, cir1.y);
    rotate(theta);
    translate(-reel.width/2, -reel.height/2);
    image(reel, 0, 0);
    popMatrix();
    
    pushMatrix();
    translate(cir2.x, cir2.y);
    rotate(theta);
    translate(-reel.width/2, -reel.height/2);
    image(reel, 0, 0);
    popMatrix();
    theta += 0.05;
  }
}
