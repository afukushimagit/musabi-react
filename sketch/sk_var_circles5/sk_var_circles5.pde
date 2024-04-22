int iCenterX = 100;    // 図形の中心座標X
int iCenterY = 100;    // 図形の中心座標Y

size( 200, 200 );

circle( iCenterX, iCenterY, 40 );

circle( iCenterX + 50, iCenterY, 40 );  // 右の円

circle( iCenterX - 50, iCenterY, 40 );  // 左の円

circle( iCenterX, iCenterY + 50, 40 );  // 下の円

circle( iCenterX, iCenterY - 50, 40 );  // 上の円
