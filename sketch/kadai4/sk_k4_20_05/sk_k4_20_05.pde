void setup()
{
  size(1000,1000);
  noLoop();
}

void draw()
{
  fill(250);
  background(#1D4C4D);
  strokeWeight(15);

  text("forest",20,20);
  fill(250);
  textSize(600);

  for(int i=-300; i<=500;i+=80)
  {
    pushMatrix();
    translate(width/5+i,height);
    branch(0);
    popMatrix();
  }
}

void branch(int depth)
{
  if(depth<11)
  {
    line(3,2,2,-height/10);
    {
      translate(0,-height/15);
      rotate(random(-0.1,0.1));

      if(random(1.0)<0.4)
      {  
        rotate(0.4);
        scale(0.7);
        pushMatrix();
        branch(depth+1);
        popMatrix();
        rotate(-0.6);
        pushMatrix();
        branch(depth+1);
        popMatrix();
      }
      else
      {
        branch(depth);
      }
    }
  }
  else
  {
    noStroke();
    fill(#4C7C6F);
    ellipse(0,0,random(100,300),random(100,300));
    stroke(0);
  
    fill(#94AF77);
    ellipse(30,60,random(70,90),random(70,90));
  
    fill(#1C765C);
    ellipse(100,100,random(60,80),random(60,80));
  
    fill(#094C4D);
    ellipse(500,500,random(100,120),random(100,120));
  
    fill(#13392F);
    ellipse(900,500,random(30,50),random(30,50));
  }
}
