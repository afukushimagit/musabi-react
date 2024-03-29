/**
 second: star orange
 minute: star green
 hour: rocket
*/

void setup()
{
  size( 650, 650 );
  colorMode( RGB, 255, 255, 255, 100 );
  background( 9, 34, 55, 30 ); //navy
  frameRate( 20 );
}

void draw()
{
  //refresh
  noStroke();
  fill( 9, 34, 55, 25 );
  rect( 0, 0, 650, 650 );

  translate( width/2, height/2 );
    
  float s = second();
  float m = minute();
  float h = hour();
  
  //second
  pushMatrix();
  rotate( radians(s*(360/60)) );
  for( int iX=0; iX<500; iX+=5 ) 
  {
    rotate( radians(20) );
    fill( 230 );
    circle( 5, 100, 5 );
  }
  popMatrix();
  
  //minute
  pushMatrix();
  rotate( radians(m*(360/60)) );
  for( int iX=0; iX<500; iX+=5 )
  {
    rotate( radians(20) );
    fill( 230 );
    circle( 5, 180, 8 );
  }
  popMatrix();
  
  //hour
  pushMatrix();
  for( int iX=0; iX<600; iX+=5 )
  {
    rotate( radians(20) );
    fill( 230 );
    circle( 5, 280, 10 );
  }
  popMatrix();
  
  //centor:star
  stroke( 230 );
  fill( 0, 100, 200 ); //blue
  circle( 0, 0, 60 );
  fill( 120, 210, 250 ); //light blue
  ellipse( 0, 0, 100, 12 );
  
  //hour:rocket
  pushMatrix();
  rotate( radians(h*(360/12)) );
  translate( 0, -280 );
  rotate( radians(270) );
  
  noStroke();
  
  //rocket
  fill( 253, 208, 0 ); //yellow
  beginShape();
  vertex(   0,  40 );
  vertex( -20,  30 );
  vertex( -20,   0 );
  vertex( -30, -10 );
  vertex( -30, -40 );
  vertex( -20, -30 );
  vertex(  20, -30 );
  vertex(  30, -40 );
  vertex(  30, -10 );
  vertex(  20,   0 );
  vertex(  20,  30 );
  endShape( CLOSE );
  
  //window
  fill( 120, 210, 250 ); //light blue
  circle( 0, 0, 25 );
  
  //fire
  fill( 241, 141, 0 ); //orange
  ellipse( 0, -70, 35, 50 );
  fill( 200, 0, 30 ); //red
  ellipse( 0, -62, 20, 35 );
  popMatrix();
  
  //minute:star
  pushMatrix();
  rotate( radians(m*(360/60)) );
  translate( -5.5, -175 );
  rotate( radians(90) );
  
  stroke( 255 );
  fill( 170, 240, 120 ); //green
  circle( 0, 0, 60 );
  fill( 253, 208, 0 ); //yellow
  ellipse( 0, 0, 15, 100 );
  popMatrix();
  
  //second:star
  pushMatrix();
  rotate( radians(s*(360/60)) );
  translate( -7, -100 );
  
  noStroke();
  fill( 241, 141, 0 ); //orange
  circle( 0, 0, 28 );
  popMatrix();
}
