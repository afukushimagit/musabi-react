void setup()
{ 
  size(1000, 1000);  
  colorMode(RGB, 100, 100, 100, 100);
  background(1, 1, 1);
  strokeCap(ROUND);//線を丸く
  fire( 250, 180, 700, 50, 10);
}
void fire( float x, float y, float l, float a, int iLevel )
{ 
  strokeWeight(2);
  stroke(95, 30, 20, 3);
  float X = x+l*sin(radians(a)); 
  float Y = y+l*cos(radians(a)); 
  float X2 = x+l*sin(radians(a)); 
  float Y2 = y+l*cos(radians(a)); 
  line( X, Y, x, y ); 
  line( X2, Y2, x, y );
  if( iLevel>0 )  
  {    
    fire( X, Y, l*0.3, a+150, iLevel-1);
    fire( X, Y, l*0.7, a-150, iLevel-1);
    fire( X2, Y2, l*0.3, a+20, iLevel-1);
    fire( X2, Y2, l*0.7, a-50, iLevel-1);
  }
}
