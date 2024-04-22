int iCenterX = 100;    // 図形の中心座標X
int iCenterY = 100;    // 図形の中心座標Y
int iSize = 40;       // 円の大きさ

size( 200, 200 );

circle( iCenterX, iCenterY, iSize );

circle( iCenterX + 50, iCenterY, iSize );  // 右の円

circle( iCenterX - 50, iCenterY, iSize );  // 左の円

circle( iCenterX, iCenterY + 50, iSize );  // 下の円

circle( iCenterX, iCenterY - 50, iSize );  // 上の円
