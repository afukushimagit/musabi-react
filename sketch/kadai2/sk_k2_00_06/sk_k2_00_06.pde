//青梅波という和柄パターンです。波模様の厚みや大きさなど適宜変更可能
size(500, 500);
ellipseMode(CORNER);
strokeWeight(5);
int r = 45; //波模様の半径。strokeWeightと一緒に調整すると吉
float d = 0.55; //円と真下の円との間隔。d=1のとき2r分
int n = 5; //波の層がn層になる
for (int k=0; (k-1)*r*d<=500+r; k++)
{
  //縦幅500を埋めたらそれ以上を描画しないよう調整
  for (int j=0; (j-1)*2*r<=500; j++)
  { //横幅も同様。
    for (int i=n; i>=1; i--)
    {
      stroke(58, 143-k, 183-k); //軽いグラデーション
      ellipse(r-r*i/n + j*2*r -k%2*r,
        //-k%2*rで一段ずつ噛み合うようにずらす
        -r*i/n + k*r*d,
        i*2*r/n,
        i*2*r/n);
    }
  }
}
