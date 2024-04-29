size( 300, 300 );

float fRadiusS = 40;  // 中心から頂点への距離（凹）
float fRadiusL = 100; // 中心から頂点への距離（凸）

translate( 150, 150 );

beginShape();
for( int iDeg = 0; iDeg < 360; iDeg += 20 )
{
  // 凹の頂点
  float fSX = fRadiusS * cos( radians( iDeg ) );
  float fSY = fRadiusS * sin( radians( iDeg ) );
  
  // 凸の頂点
  float fLX = fRadiusL * cos( radians( iDeg + 10 ) );  // 凹→凸へ10°進める
  float fLY = fRadiusL * sin( radians( iDeg + 10 ) );
  
  vertex( fSX, fSY );
  vertex( fLX, fLY );
}
endShape( CLOSE );
