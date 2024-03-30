/**
この作品は江戸切子をモチーフとした作品です。江戸切子は、ガラスに繊細な紋様を施し
た江戸川区の伝統工芸品で、その美しさと連続して見える紋様が、今回の課題の要点であ
る「再起」とマッチしていると思ったからです。また、私の住んでいる場所が江戸川区だ
からというのも理由の一つです。
*/
void setup()
{
  colorMode(HSB,360,30,30);
  size( 1000, 1000);
  background(#66cdaa);
  strokeWeight(1);
  strokeCap(PROJECT);
  float hueVal=random(360);
  stroke(hueVal,100,100);
  drawTuta(random(0,width),height/2,700,20,10 );
}

void drawTuta(float fBeginX, float fBeginY, float fLength, float fDegree,int iLevel )
{ 
 
  float fEndX = fBeginX + fLength * cos( radians( fDegree ) );
  float fEndY = fBeginY + fLength * sin( radians( fDegree ) );
  
  line(fBeginX,fBeginY,fEndX,fEndY);
  
  if( iLevel > 1 )
  {
    drawTuta( fEndX,fEndY,fLength,fDegree+40,iLevel - 1 ); 
    drawTuta( fEndX,fEndY,fLength,fDegree-40,iLevel - 1 ); 
    drawTuta( fEndX,fEndY,fLength,fDegree-60,iLevel - 1 ); 
    
  }
}
