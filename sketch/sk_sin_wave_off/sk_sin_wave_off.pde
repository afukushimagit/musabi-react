void setup() {
  size(400, 200);
  //background(255);
  noFill();
  stroke(0);
  strokeWeight(2);
  drawWave();
}

void drawWave() {
  float amplitude = 50; // 波の振幅
  float frequency = 0.02; // 波の周波数
  float yPrev = height / 2; // 前のy座標を初期化

  for (int x = 0; x < width; x++) {
    float y = height / 2 + amplitude * tan(frequency * x); // sin()関数を使って波形を計算
    line(x, yPrev, x, y); // 直線で波形を描画
    yPrev = y; // 前のy座標を更新
  }
  
  save("sk_cos_wave_off.png");
}
