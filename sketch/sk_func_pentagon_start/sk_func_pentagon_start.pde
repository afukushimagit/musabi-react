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
  iPentagonAnimRot++;
  if( iPentagonAnimRot > 360 )
  {
    iPentagonAnimRot = 0;
  }
  
  // ペンタゴンの描画
   translate( 150, 150 );
  rotate( radians( iPentagonAnimRot ) );

  beginShape();
  for( int iDeg = -18; iDeg < 360; iDeg += 72 )
  {
    float fX = fPentagonRadius * cos( radians( iDeg ) );
    float fY = fPentagonRadius * sin( radians( iDeg ) );
    
    vertex( fX, fY );
  }
  endShape( CLOSE );
}
