int iNenrinMaxWidth = 500;  // 年輪の最大幅
int iNenrinMaxHeight = 300; // 年輪の最大高さ

float[][] fNenrinRGB = new float[60][3];            // 年輪の色
float[][][] fNenrinVertexXY = new float[60][12][2]; // 年輪の頂点座標

size( 600, 300 );
background( 204 );
noStroke();


// 年輪の色初期化
for ( int iNenrin = 0; iNenrin < fNenrinRGB.length; iNenrin ++ )
{
  fNenrinRGB[iNenrin][0] = random( 255 );  // R
  fNenrinRGB[iNenrin][1] = random( 255 );  // G
  fNenrinRGB[iNenrin][2] = random( 255 );  // B
}

// 年輪の形の初期化
for ( int iNenrin = 0; iNenrin < fNenrinVertexXY.length; iNenrin++ )
{
  float fSizeRate = ( iNenrin + 1 ) / float( fNenrinVertexXY.length );
  float fNenrinRadiusW = iNenrinMaxWidth * fSizeRate / 2.0;
  float fNenrinRadiusH = iNenrinMaxHeight * fSizeRate / 2.0;
  
  for ( int iVertex = 0; iVertex < fNenrinVertexXY[iNenrin].length; iVertex++ )
  {
    fNenrinVertexXY[iNenrin][iVertex][0] = fNenrinRadiusW * cos( radians( 30 * iVertex ) ) * random( 1, 1.1 );
    fNenrinVertexXY[iNenrin][iVertex][1] = fNenrinRadiusH * sin( radians( 30 * iVertex ) ) * random( 1, 1.1 );
  }
}

translate( width/2, height/2 );

// 描画時は逆に外側から内側へ描画していく．
for ( int iNenrin = fNenrinRGB.length - 1; iNenrin >= 0; iNenrin-- )
{    
  beginShape();
  for ( int iVertex = 0; iVertex < fNenrinVertexXY[iNenrin].length; iVertex++ )
  {
    fill( fNenrinRGB[iNenrin][0], fNenrinRGB[iNenrin][1], fNenrinRGB[iNenrin][2] );
    vertex( fNenrinVertexXY[iNenrin][iVertex][0], fNenrinVertexXY[iNenrin][iVertex][1] );
  }
  endShape( CLOSE );
}
