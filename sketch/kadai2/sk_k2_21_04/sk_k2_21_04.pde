size(500, 500);

//haikei no gurade-syon
for (int ix=0; ix<500; ix++)
{
  for (int iy=0; iy<500; iy++)
  {
    stroke(160+ix, 255-ix, 50);
    point(ix, iy);
  }
}

// haikei no namisen
strokeWeight(2);
for ( int f = 0; f < 500; f++ )
{
  int g = f*6;
  int h = (f*2);

  stroke(255, 0, 1110);
  line( g, f, f, h + h*cos( radians(g) ))  ;
}

//shiroi maru

strokeWeight(3);
for (int i= 0; i < 500; i+=8)
{
  for (int j= 0; j< 500; j+=25)
  {
    stroke(255);
    noFill();
    ellipse(i, j, 10 -i/20, 10 -i/20);
  }
}

for (int k= 0; k < 500; k+=10)
{
  for (int l= 0; l< 500; l+=6)
  {
    stroke(255);
    noFill();
    ellipse(l, k, 10 -l/20, 10 -l/20);
  }
}
