/**
シンプルに雪の結晶を作ってみました。下記Configから値を変更することができます。
ついでにノードの深度に応じて色を変えられるようにしました。
自然界では氷の結晶構造が正四面体構造であるため、雪の結晶は6方向にしか伸びないのですが
centerDivの値を10とかにしてみると自然界にない形になります。結構おすすめです。
逆に4方向とか3方向とかも。数学的処理のいいところは物理的制限を回避した理論上の形が取れる所だと思います。
難しさでもあるんですけどね。
*/


//---------------------------------Config---------------------------------//

//------結晶らに関する設定------//
int snowAlpha = 50;             //背後の雪結晶の透明度(0-255)
int snowAmount = 8;             //雪結晶の量
int circleAmount = 10;          //雰囲気付けの量(設定値 * snowAmount 個)

//------中心に関する設定------//
int centerDiv = 6;            //中心分岐数
float maxR = 300;             //1st Nodeの最大長さ
float minR = maxR * 0.4;      //1st Nodeの最小長さ


//------ノード分岐に関する設定------//
int maxLevel = 4;                   //再帰する数 (設定値 → 中心の深度, 外側に向けて減衰)
float divAngle = radians(30);       //分割するときの角度 (0-360度)
float divRatio = 0.25;              //何%おきにノードを配置するか (0-1)

//------------------------------------------------------------------------//




//---------------------------------初期設定---------------------------------//
void setup()
{
  size(1000, 1000);
  background(0, 0, 0);
  colorMode(RGB);

  int x;
  int y;
  float r;

  for (int i=0; i<snowAmount; i++) {
    
    fill(0, snowAlpha);
    rect(0,0,width,height);
    
    //ランダム座標に結晶を描画(中心よりガウス分布で展開)
    x = int(width/2 * (1 + randomGaussian()/2));
    y = int(height/2 * (1 + randomGaussian()/2));
    r = random(minR, maxR);

    makeSnow(x, y, r, centerDiv);
    
    
    //雰囲気付け (丸描画)
    for (int k=0; k<10; k++) {
      x = int(random(0,width));
      y = int(random(0,height));
      r = random(minR*0.05, maxR*0.1);
      
      stroke(255, 255, 255);
      circle(x,y,r);
    }
  }
}




//---------------------------------Main---------------------------------//
//雪の結晶を描画する(中心のx,y, 半径, 中心分岐数)
void makeSnow(int x, int y, float r, int centerDiv) {
  for (int i=1; i<=centerDiv; i++) {

    //中心を(centerDiv)分割してノードを生やす
    drawNode(maxLevel, x, y, r, radians(360/centerDiv * i));
  }
}



//---------------------------------Recursion---------------------------------//
//エッジを追加し、ノードを再帰する(現在の深度, 始端のx,y, 半径, 角度)
void drawNode(int level, float fromX, float fromY, float r, float angle) {

  //------エッジの描画------//
  //終点Node作成
  float toX = fromX + (r * cos(angle));
  float toY = fromY + (r * sin(angle));
  
  //Nodeの深度によって色を変更してみる
  int Blueness = 250 - (level-1) * 20;
  stroke(Blueness, Blueness, 255);

  //描画
  line(fromX, fromY, toX, toY);
  //text(level, toX, toY); //For Debug


  //------次のノードを作成------//
  if (level > 1) {

    //一本のエッジに対して(divRatio)%の距離おきにノードを追加したい
    float radius = r * divRatio;

    //(divRatio)%の距離おきに、元の長さを超えない程度までノードを追加し続け、再帰する
    for (int k=1; divRatio*k <= 1; k++) {

      //分岐点のノードを作成 (±Angleで正しく実行されるように、toXYとは座標変数を分ける必要がある)
      fromX = fromX + (radius * cos(angle));
      fromY = fromY + (radius * sin(angle));
      //circle(fromX,fromY,5); //For Debug

      //再帰する
      drawNode(level - 1, fromX, fromY, r*0.5/sqrt(k), angle + divAngle);
      drawNode(level - 1, fromX, fromY, r*0.5/sqrt(k), angle - divAngle);
    }
  }
}
