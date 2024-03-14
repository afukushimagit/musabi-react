void setup() {
  size(500, 500);
  background(255);
  noStroke();
  noLoop();
}

void draw() {
  for (int i = 0; i < 500; i += 20) {
    for (int j = 0; j < 500; j += 20) {
      float diameter = random(10, 30);
      float distance = dist(i, j, width / 2, height / 2);
      float alpha = map(distance, 0, 400, 255, 0);
      fill(255, 0, 0, alpha);
      ellipse(i, j, diameter, diameter);
    }
  }
}
