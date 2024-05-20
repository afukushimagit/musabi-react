// ペンタゴン用変数
float fPentagonRadius = 100;   // 中心から頂点への距離
int iPentagonAnimRot = 0;      // 回転アニメーション用

void setup()
{
  size( 300, 300 );
}

void draw()
{ 
  background( 204 );
    
  // ペンタゴンの更新
  updatePentagon();
  
  // ペンタゴンの描画
  drawPentagon();
  
  // 長方形
  rect( 135, 140, 30, 160 );
}
