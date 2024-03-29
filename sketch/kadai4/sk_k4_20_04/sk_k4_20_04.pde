int P = 7; //個数
int S = 6; //角の数
int N = 4; //回数
int mag = 800; //図の大きさ
boolean outside_curve = false;
 
void setup() {
  size(1000, 1000);
  background(0);
  ellipseMode(CENTER);
  smooth();
}
 
void draw() {

  background(0);
  stroke(255);
  strokeWeight(1);
  snowFlake();
}
 
void snowFlake() {
  float gr = - TWO_PI / P; // 元の回転角度
  if (outside_curve)
    gr = TWO_PI/P;
  float r = - TWO_PI / S; // 元じゃないやつの回転角度

  float[] D = new float[P]; 
  for (int i = 1; i < P-1; i++)
    D[i] = -gr;
  D[0]=D[P-1]=gr*(P-2)/2;

  int[] O = new int[N];

  float x1 = width/2;
  float y1 = height/2-mag/2;
  float x2, y2; 

  float an = r/2-TWO_PI; 
  float l =  mag * sin(r/2)/pow(3, N); //位置
  
  int i, k;
  boolean curve_finished;
  for (i=0; i<S; i++) { // 曲線の数、ポリゴンサイズ
    for (k=0; k<N; k++) // ゼロから作成
      O[k]=0;
    // 曲線ーーーーーーーー
    curve_finished=false;
    k=0;
    while (true) {
      x2=x1+cos(an)*l; //横幅
      y2=y1+sin(an)*l;  //縦幅
      line(x1, y1, x2, y2);
      x1=x2; 
      y1=y2;
      if (curve_finished)  break;

      an = an + D[O[k]];
      O[k]=O[k]+1;

      k=0;
      while (O[k]==P) {
        O[k] = 0;
        k = k + 1;
        if (k==N) {
          curve_finished = true;
          break;
        }
      }
    }
    an = an + r; // 追加の角度
  }
}
