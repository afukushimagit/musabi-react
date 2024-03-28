size(500, 500);
colorMode(HSB, 100); //colormodeHSB 100
background(0, 0, 0); //background-black
for (int i=0; i<5; i++)
{ //5kai kurikaesu
  noStroke(); //sennashi
  fill(random(0, 8), 100, 100, 30); //red~yellow,alpha30
  rect(i*100, 0, 25, 500); //tateline 1
  rect(i*100+30, 0, 25, 500); //tateline 2
  rect(0, i*100, 500, 25); //yokoline 1
  rect(0, i*100+30, 500, 25); //yokoline 2
  for (int k=0; k<100; k++)
  { //100 kai kurikaesu
    stroke(10, 100, 100); //line color yellow
    strokeWeight(2);
    point(k*5, i*100+77); //tensentate
    point(i*100+77, k*5); //tensenyoko
  }
}
