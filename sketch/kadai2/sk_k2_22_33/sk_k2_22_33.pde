size(500, 500);
background(#f39800);

// random clock
for (int i = 25; i < 500; i += 50) { // row
  for (int j = 25; j < 500; j += 50) { // column
    strokeWeight(4);
    stroke(random(0, 100), random(0, 100), random(0, 100));
    ellipse( i, j, 40, 40);
    line(i, j, i + random(-8, 8), j + random(-12, 12));
    line(i, j, i + random(-8, 8), j + random(-12, 12));
  }
}
