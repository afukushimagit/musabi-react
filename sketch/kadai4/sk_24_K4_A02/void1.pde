void drawGOD()
{
  colorMode(RGB, 10);
  pushMatrix();
  translate(500,500);
 strokeWeight(2);
 float me = random(0,2);
 int x = int(random(0,11));
 int xx;
 int xxx;
 int xxxx;
 int xxxxx;
 int xxxxxx;
 if(x >=2)
 { xx = abs(x-2);}
 else{ xx = x+10;}
 if(xx >=2)
 { xxx = abs(xx-2);}
 else{ xxx = xx+10;}
 if(xxx >=2)
 { xxxx = abs(xxx-2);}
 else{ xxxx = xxx+10;}
 if(xxxx >=2)
 { xxxxx = abs(xxxx-2);}
 else{ xxxxx = xxxx+10;}
 if(xxxxx >=2)
 { xxxxxx = abs(xxxxx-2);}
 else{ xxxxxx = xxxxx+10;}
 //noStroke();
 fill(cr[xx][0],cr[xx][1],cr[xx][2]);
 ellipse(0,0,300,350);
 fill(cr[xxx][0],cr[xxx][1],cr[xxx][2]);
 ellipse(0,0,280,330);
 fill(cr[x][0],cr[x][1],cr[x][2]);
 ellipse(0,0,260,310);
 fill(cr[xxxx][0],cr[xxxx][1],cr[xxxx][2]);
 rect(0,0,190,240);
 fill(cr[xxxxx][0],cr[xxxxx][1],cr[xxxxx][2]);
 rect(0,0,170,220);

 //karada
 fill(cr[xx][0],cr[xx][1],cr[xx][2]);
 beginShape();
 vertex(-20,-70);
 vertex(-60,-50);
 vertex(-65,-40);
 vertex(-60,-20);
 vertex(-30,25);
 vertex(-33,40);
 vertex(-95,30);
 vertex(-110,40);
 vertex(-120,65);
 vertex(-95,90);
 vertex(-40,79);
 vertex(0,75);
 vertex(40,79);
 vertex(95,90);
 vertex(120,65);
 vertex(110,40);
 vertex(95,30);
 vertex(33,40);
 vertex(30,25);
 vertex(60,-20);
 vertex(65,-40);
 vertex(60,-50);
 vertex(20,-70);
 endShape();

 //ude
 beginShape();
 vertex(-35,15);
 vertex(-50,20);
 vertex(-65,10);
 vertex(-68,-50);
 vertex(-60,-55);
 vertex(-48,-50);
 vertex(-35,-5);
 endShape(CLOSE);

 beginShape();
 vertex(-68,-50);
 vertex(-75,-60);
 vertex(-72,-85);
 vertex(-60,-92);
 vertex(-50,-88);
 vertex(-48,-72);
 vertex(-45,-70);
 vertex(-43,-57);
 vertex(-48,-50);
 endShape();



 beginShape();
 vertex(53,-10);
 vertex(52,10);
 vertex(30,15);
 vertex(30,5);
 
 endShape();
 
 beginShape();
 vertex(32,10);
 vertex(24,21);
 vertex(27,46);
 vertex(32,52);
 vertex(51,49);
 vertex(53,33);
 vertex(56,31);
 vertex(58,18);
 vertex(52,10);
 endShape();
 
 //kao
 
 beginShape();
 vertex(-15,-142);
 vertex(-32,-130);
 vertex(-40,-110);
 vertex(-30,-70);
 vertex(-15,-60);
 vertex(15,-60);
 vertex(30,-70);
 vertex(40,-110);
 vertex(32,-130);
 vertex(15,-142);
 endShape(CLOSE);
 
 if(me <1)
 {
   
   //me
   fill(cr[xxxxxx][0],cr[xxxxxx][1],cr[xxxxxx][2]);
   beginShape();
   vertex(-40,-100);
   vertex(-25,-93);
   vertex(-5,-95);
   vertex(-10,-115);
   vertex(-20,-125);
   vertex(-33,-120);
   endShape(CLOSE);
   beginShape();
   vertex(40,-100);
   vertex(25,-93);
   vertex(5,-95);
   vertex(10,-115);
   vertex(20,-125);
   vertex(33,-120);
   endShape(CLOSE);
    
   if(bug > 9.5)
   {
     fill(cr[xxxx][0],cr[xxxx][1],cr[xxxx][2]);
     beginShape();
     vertex(-35,-103);
     vertex(-23,-97);
     vertex(-11,-99);
     vertex(-13,-112);
     vertex(-20,-119);
     vertex(-30,-116);
     endShape(CLOSE);
     beginShape();
     vertex(35,-103);
     vertex(23,-97);
     vertex(11,-99);
     vertex(13,-112);
     vertex(20,-119);
     vertex(30,-116);
     endShape(CLOSE);
       
     fill(cr[xxx][0],cr[xxx][1],cr[xxx][2]);
     beginShape();
     vertex(-30,-105);
     vertex(-23,-102);
     vertex(-17,-102);
     vertex(-16,-106);
     vertex(-20,-113);
     vertex(-27,-112);
     endShape(CLOSE);
     beginShape();
     vertex(30,-105);
     vertex(23,-102);
     vertex(17,-102);
     vertex(16,-106);
     vertex(20,-113);
     vertex(27,-112);
     endShape(CLOSE);
   }
 }
 else
 {
   fill(cr[xxxxxx][0],cr[xxxxxx][1],cr[xxxxxx][2]);
   beginShape();
   vertex(40,-100);
   vertex(25,-93);
   vertex(5,-92);
   vertex(10,-115);
   vertex(20,-125);
   vertex(33,-120);
   endShape(CLOSE);
   beginShape();
   vertex(-40,-100);
   vertex(-25,-93);
   vertex(-5,-92);
   vertex(-10,-115);
   vertex(-20,-125);
   vertex(-33,-120);
   endShape(CLOSE);
   if(bug > 9.5)
   {
     fill(cr[xxxx][0],cr[xxxx][1],cr[xxxx][2]);
     beginShape();
     vertex(33,-102);
     vertex(24,-97);
     vertex(11,-97);
     vertex(13,-110);
     vertex(20,-120);
     vertex(31,-115);
     endShape(CLOSE);
     beginShape();
     vertex(-33,-102);
     vertex(-24,-97);
     vertex(-11,-97);
     vertex(-13,-110);
     vertex(-20,-120);
     vertex(-31,-115);
     endShape(CLOSE);
     
     fill(cr[xxx][0],cr[xxx][1],cr[xxx][2]);
     beginShape();
     vertex(28,-103);
     vertex(24,-101);
     vertex(17,-101);
     vertex(18,-107);
     vertex(22,-114);
     vertex(28,-112);
     endShape(CLOSE);
     beginShape();
     vertex(-28,-103);
     vertex(-24,-101);
     vertex(-17,-101);
     vertex(-18,-107);
     vertex(-22,-114);
     vertex(-28,-112);
     endShape(CLOSE);
   }
   
 }
 
 
 //kuchi
 fill(cr[xxxxxx][0],cr[xxxxxx][1],cr[xxxxxx][2]);
 beginShape();
 vertex(10,-80);
 vertex(20,-82);
 vertex(32,-87);
 vertex(15,-70);
 vertex(0,-65);
 vertex(-15,-70);
 vertex(-32,-87);
 vertex(-20,-82);
 vertex(-10,-80);
 endShape(CLOSE);
 
 if(bug > 9.5)
 {
   line(20,-82,20,-75);
   line(10,-80,10,-68);
   line(0,-80,0,-65);
   line(-20,-82,-20,-75);
   line(-10,-80,-10,-68); 
 }
 popMatrix();
}




void haikei()
{
  colorMode(RGB, 1);
  float fR,fG,fB;      // Window RGB
  
  
  
  int R = int(random(1,6));
  for(int iX=0; iX<width; iX++)
  {
    for(int iY=0; iY<height; iY++)
    {
      fR = pow(cos(iX/2),sqrt(pow(iY,2)))*cos(iX*11)*82 ;
      fG = pow(sin(iX/2),sqrt(pow(iY-1000,2)))*sin(iX*12)*53 ;
      fB = cos((pow(iY-500,2)+pow(iX-500,2))/800)*0.8;
      
      if(bug<=9.5)
      {
        if(R==1)
        {stroke(fR, fG, fB);}
        else if(R==2)
        {stroke(fR, fB, fG);}
        else if(R==3)
        {stroke(fG, fB, fR);}
        else if(R==4)
        {stroke(fG, fR, fB);}
        else if(R==5)
        {stroke(fB, fR, fG);}
        else
        {stroke(fB, fG, fR);}
      }
      else 
      {
        int B = int(random(1,5));
        if(B==1)
        {stroke(fR, fG, fB);}
        else if(B==2)
        {stroke(fR, fB, fG);}
        else if(B==3)
        {stroke(fG, fB, fR);}
        else if(B==4)
        {stroke(fG, fR, fB);}
        else if(B==5)
        {stroke(fB, fR, fG);}
        
        
      }

      
      point(iX,iY);
    }
  }
}


void hotoke1( float fRectW, float fRectH,  int x) 
{
  int xx =int(random(0,11));
  int xxx =int(random(0,11));
  while(x==xx)
  {xx =int(random(0,11));}
  while(xx==xxx)
  {xxx =int(random(0,11));}
  float aa = fRectW*ww;
  float bb = fRectH*ww;
  
  fill(cr[xx][0],cr[xx][1],cr[xx][2]);  
  beginShape();
  vertex(aa / -10, bb / -7);
  vertex(aa / -5.5, bb / -9);
  vertex(aa / -8, bb / 6);
  vertex(aa / -3, bb / 7);
  vertex(aa / -2.7, bb / 5);
  vertex(aa / -3.2, bb / 3.4);
  vertex(0, bb / 3.7);
  vertex(aa / 3.2, bb / 3.4);
  vertex(aa / 2.7, bb / 5);
  vertex(aa / 3, bb / 7);
  vertex(aa / 8, bb / 6);
  vertex(aa / 5.5, bb / -9);
  vertex(aa / 10, bb / -7);
  endShape(); 
  
  // kao
  beginShape();
  vertex(aa / -8.5, bb / -2.5);
  vertex(aa / -7, bb / -3);
  vertex(aa / -8, bb / -6);
  vertex(0, bb / -10);
  vertex(aa / 8, bb / -6);
  vertex(aa / 7, bb / -3);
  vertex(aa / 8.5, bb / -2.5);
  endShape(CLOSE);
  
  fill(cr[xxx][0],cr[xxx][1],cr[xxx][2]);  
  beginShape();
  vertex(aa / -38, bb / -4.2);
  vertex(aa / -6.8, bb / -4);
  vertex(aa / -8, bb / -3.2);
  vertex(aa / -20, bb / -3.15);
  endShape(CLOSE);
  beginShape();
  vertex(aa / 38, bb / -4.2);
  vertex(aa / 6.8, bb / -4);
  vertex(aa / 8, bb / -3.2);
  vertex(aa / 20, bb / -3.15);
  endShape(CLOSE);
  
  beginShape();
  vertex(aa / 9, bb / -5);
  vertex(aa / 14, bb / -6.5);
  vertex(0, bb / -7.3);
  vertex(aa / -14, bb / -6.5);
  vertex(aa / -9, bb / -5);
  
  endShape(CLOSE);
}
