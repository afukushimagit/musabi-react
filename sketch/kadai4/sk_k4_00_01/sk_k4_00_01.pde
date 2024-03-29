/**
 ステンドグラス模様の描画
 
 - fillとstrokeを分けて描画
 - 窓の模様の中に窓を再帰的に描画
 */

// ガラス部分の照明.
final float[] BRIGHTNESS_INTENSITY   = {0.9, 0.8};
final int[][] BRIGHTNESS_FILTER_POS  = {{ 250, 300 },{ 600, 650 } };
final int[][] BRIGHTNESS_FILTER_SIZE = {{ 300, 300 },
  { 600, 500 }};
// window common
final int[][] FILL_SET_COMMON = {{4, 2, 5, 3, 2, 1, 3, 2},{4, 0, 5, 2, 0, 5, 2, 4}};
// triangle strip
final int[][] FILL_SET_TRIANGLE_STRIP = {{2, 5},{4, 6}};
// circle clover
final int[][] FILL_SET_CIRCLE_CLOVER = {{0, 2, 0, 3, 4, 1, 1, 5, 1},{5, 0, 1, 5, 2, 1, 0, 0, 0}};

// circle fan
final int[][] FILL_SET_CIRCLE_FAN = {{4, 6, 5, 2},{4, 3, 5, 5}};

// window fan
final int[][] FILL_SET_WINDOW_FAN = {{0, 4},{6, 5}};

// モジュール毎のストローク.
final int[] STROKE_SET_COMMON = {3, 0, 0, 0, 0, 0, 0, 0, 0, 2, 3};
final int[] STROKE_SET_TRIANGLE_STRIP = {2, 0};
final int[] STROKE_SET_CIRCLE_CLOVER = {3, 0, 0, 0, 0, 0, 0, 2};
final int[] STROKE_SET_CIRCLE_FAN = {0};
final int[] STROKE_SET_WINDOW_FAN = {0, 0};

// 調色.
final int[][] COLOR_TONE =
{{ 80, 90, 10, 16, 8, 12 }, // Magenta  :0
 { 52, 60, 10, 16, 10, 12 }, // Cyan     :1
 { 28, 36, 10, 16, 8, 12}, // Green    :2
 { 15, 16, 10, 16, 8, 12}, // Yellow   :3
 { -4, 4, 10, 16, 8, 12}, // Red      :4
 { 65, 66, 12, 16, 8, 12}, // Blue     :5
 { 100, 100, 0, 2, 13, 15}};  // White    :6

// ストローク太さの種類.
final float[] STROKE_WEIGHT = { 8, 10, 14, 24};

final float[] WINDOW_DEFAULT_SIZE = { 500, 850 };
final float[][][] TRIANGLE_STRIP_VERTEX =
{ { {0, 0.15}, {-0.14, 0.08}, {-0.21, 0.17}   },
  { {-0.21, 0.17}, {-0.36, 0.25}, {-0.23, 0.29} },
  { {-0.36, 0.25}, {-0.23, 0.29}, {-0.38, 0.34}  },
  { {-0.38, 0.34}, {-0.46, 0.42}, {-0.30, 0.42}  },
  { {-0.46, 0.45}, {-0.34, 0.45}, {-0.40, 0.56}  },
  { {-0.40, 0.56}, {-0.45, 0.68}, {-0.34, 0.68}  } };

void setup()
{
  size(1000, 1000);
  colorMode(HSB, 100, 16, 16, 1.0 );
  background(10, 6, 2);

  // fill描画
  drawWindow( 0.25*width, 0.07*height, 1, 0, 2 );
  drawWindow( 0.75*width, 0.07*height, 1, 1, 2 );

  // フィルター
  brightnessFilter();

  // stroke描画
  drawWindow( 0.25*width, 0.07*height, 1, -1, 3 );
  drawWindow( 0.75*width, 0.07*height, 1, -1, 3 );
}
void drawWindow( float fPosX, float fPosY, float fScale, int iColorSet, int iLevel )
{
  pushMatrix();
  translate(fPosX, fPosY);
  scale( fScale );

  // 共通部分
  drawWindowCommon( 0, 0, WINDOW_DEFAULT_SIZE[0], WINDOW_DEFAULT_SIZE[1], iColorSet );

  // 再帰部分(fill)
  if ( iLevel > 0 )
  {
    drawWindow( -0.25*WINDOW_DEFAULT_SIZE[0], 0.73*WINDOW_DEFAULT_SIZE[1], 0.28, iColorSet, iLevel-1 );//再帰呼び出し
    drawWindow( +0.25*WINDOW_DEFAULT_SIZE[0], 0.73*WINDOW_DEFAULT_SIZE[1], 0.28, iColorSet, iLevel-2 );//再帰呼び出し
  } else
  {
    drawWindowFan( -0.25*WINDOW_DEFAULT_SIZE[0], 0.65*WINDOW_DEFAULT_SIZE[1], 0.48*WINDOW_DEFAULT_SIZE[0], 0.5*WINDOW_DEFAULT_SIZE[1], iColorSet );
    drawWindowFan( +0.25*WINDOW_DEFAULT_SIZE[0], 0.65*WINDOW_DEFAULT_SIZE[1], 0.48*WINDOW_DEFAULT_SIZE[0], 0.5*WINDOW_DEFAULT_SIZE[1], iColorSet );
  }

  popMatrix();
}
void drawWindowCommon( float fPosX, float fPosY, float fWidth, float fHeight, int iColorSet )
{
  pushMatrix();
  
  int iCurrentDrawIdx = 0;
  setFillAndStroke( iColorSet );
  
  // 窓枠
  iCurrentDrawIdx = fillOrStroke( iColorSet, iCurrentDrawIdx, 0 );
  drawWindowFrame( fPosX, fPosY, fWidth, fHeight, 1.0, iColorSet );
  
  // 中心の三つの円
  fillOrStroke( iColorSet, iCurrentDrawIdx, 0 );
  circle( fPosX, fPosY+0.765*fHeight, 0.09*fWidth );
  fillOrStroke( iColorSet, iCurrentDrawIdx, 0 );
  circle( fPosX+0.05*fWidth, fPosY+0.715*fHeight, 0.09*fWidth );
  iCurrentDrawIdx = fillOrStroke( iColorSet, iCurrentDrawIdx, 0 );
  circle( fPosX-0.05*fWidth, fPosY+0.715*fHeight, 0.09*fWidth );
  // 左右の装飾
  fillOrStroke( iColorSet, iCurrentDrawIdx, 0 );
  circle( fPosX-0.4*fWidth, fPosY+0.645*fHeight, 0.18*fWidth );
  iCurrentDrawIdx = fillOrStroke( iColorSet, iCurrentDrawIdx, 0 );
  circle( fPosX+0.4*fWidth, fPosY+0.645*fHeight, 0.18*fWidth );
  // 左右の花
  fillOrStroke( iColorSet, iCurrentDrawIdx, 0 );
  draw4Clover( fPosX-0.4*fWidth, fPosY+0.645*fHeight, 0.135*fWidth, 0, iColorSet );
  iCurrentDrawIdx = fillOrStroke( iColorSet, iCurrentDrawIdx, 0 );
  draw4Clover( fPosX+0.4*fWidth, fPosY+0.645*fHeight, 0.135*fWidth, 0, iColorSet );
  // 左右の４つの花
  fillOrStroke( iColorSet, iCurrentDrawIdx, 0 );
  draw4Clover( fPosX-0.45*fWidth, fPosY+0.57*fHeight, 0.075*fWidth, 0, iColorSet );
  fillOrStroke( iColorSet, iCurrentDrawIdx, 0 );
  draw4Clover( fPosX+0.45*fWidth, fPosY+0.57*fHeight, 0.075*fWidth, 0, iColorSet );
  fillOrStroke( iColorSet, iCurrentDrawIdx, 0 );
  draw4Clover( fPosX-0.45*fWidth, fPosY+0.725*fHeight, 0.075*fWidth, 0, iColorSet );
  iCurrentDrawIdx = fillOrStroke( iColorSet, iCurrentDrawIdx, 0 );
  draw4Clover( fPosX+0.45*fWidth, fPosY+0.725*fHeight, 0.075*fWidth, 0, iColorSet );
  // 上部の装飾
  iCurrentDrawIdx = fillOrStroke( iColorSet, iCurrentDrawIdx, 0 );
  draw4Clover( fPosX-0.12*fWidth, fPosY+0.095*fHeight, 0.07*fWidth, 0, iColorSet );
  draw4Clover( fPosX+0.12*fWidth, fPosY+0.095*fHeight, 0.07*fWidth, 0, iColorSet );
  // 上部中心
  iCurrentDrawIdx = fillOrStroke( iColorSet, iCurrentDrawIdx, 0 );
  circle( fPosX, fPosY+0.066*fHeight, 0.17*fWidth );
  iCurrentDrawIdx = fillOrStroke( iColorSet, iCurrentDrawIdx, 0 );
  draw4Clover( fPosX, fPosY+0.067*fHeight, 0.12*fWidth, 0, iColorSet );
  if ( iColorSet<0 )
  {
    iCurrentDrawIdx = fillOrStroke( iColorSet, iCurrentDrawIdx, 0 );
    line(fPosX-0.03*fWidth, fPosY+0.045*fHeight, fPosX+0.03*fWidth, fPosY+0.085*fHeight);
    line(fPosX-0.03*fWidth, fPosY+0.085*fHeight, fPosX+0.03*fWidth, fPosY+0.045*fHeight);
  }
  
  // 三角形ストリップ枠.
  drawTriangleStrip( -0.25*fWidth, 0.65*fHeight, 0.48*fWidth, 0.5*fHeight, iColorSet );
  drawTriangleStrip( 0.25*fWidth, 0.65*fHeight, 0.48*fWidth, 0.5*fHeight, iColorSet );
  
  // 大きな円部分
  drawCircleClover( fPosX, fPosY + 0.4*fHeight, 0.94*fWidth, iColorSet );
  
  // その他フレーム
  if ( iColorSet<0 )
  {
    iCurrentDrawIdx = fillOrStroke( iColorSet, iCurrentDrawIdx, 0 );
    line( fPosX-0.5*fWidth, fPosY+0.51*fHeight, fPosX+0.5*fWidth, fPosY+0.51*fHeight);
    iCurrentDrawIdx = fillOrStroke( iColorSet, iCurrentDrawIdx, 0 );
    line( fPosX-0.5*fWidth, fPosY+0.87*fHeight, fPosX+0.5*fWidth, fPosY+0.87*fHeight);
  }
  popMatrix();
}
void drawTriangleStrip( float fPosX, float fPosY, float fWidth, float fHeight, int iColorSet )
{
  pushMatrix();

  int iCurrentDrawIdx=0;
  setFillAndStroke( iColorSet );

  // ストリップ枠
  iCurrentDrawIdx = fillOrStroke( iColorSet, iCurrentDrawIdx, 1 );
  drawWindowFrame( fPosX, fPosY, fWidth, fHeight, 0.7, iColorSet );

  // 四辺形模様
  iCurrentDrawIdx = fillOrStroke( iColorSet, iCurrentDrawIdx, 1 );
  quad(fPosX, fPosY, fPosX-0.15*fWidth, fPosY+0.08*fHeight, fPosX, fPosY+0.15*fHeight, fPosX+0.15*fWidth, fPosY+0.08*fHeight );
  
  //TRIANGLE_STRIP
  for ( int iSymmetric = 0; iSymmetric<2; iSymmetric++ )
  {
    float fXSymmetric = 1;
    if ( iSymmetric%2==1 )
    {
      fXSymmetric = -1;
    }
    for ( int iTriangleIdx= 0; iTriangleIdx < TRIANGLE_STRIP_VERTEX.length; iTriangleIdx++ )
    {
      triangle( fPosX+fXSymmetric*TRIANGLE_STRIP_VERTEX[iTriangleIdx][0][0]*fWidth,
        fPosY+TRIANGLE_STRIP_VERTEX[iTriangleIdx][0][1]*fHeight,
        fPosX+fXSymmetric*TRIANGLE_STRIP_VERTEX[iTriangleIdx][1][0]*fWidth,
        fPosY+TRIANGLE_STRIP_VERTEX[iTriangleIdx][1][1]*fHeight,
        fPosX+fXSymmetric*TRIANGLE_STRIP_VERTEX[iTriangleIdx][2][0]*fWidth,
        fPosY+TRIANGLE_STRIP_VERTEX[iTriangleIdx][2][1]*fHeight );
    }
  }
  popMatrix();
}
void drawWindowFan( float fPosX, float fPosY, float fWidth, float fHeight, int iColorSet )
{
  pushMatrix();
  
  int iCurrentDrawIdx=0;
  setFillAndStroke( iColorSet );
  
  // 内
  iCurrentDrawIdx = fillOrStroke( iColorSet, iCurrentDrawIdx, 4 );
  drawWindowFrame( fPosX, fPosY+0.15*fHeight, 0.6*fWidth, 0.58*fHeight, 0.95, iColorSet );

  // 中央のアンブレラ.
  drawCircleFan( fPosX, fPosY+0.31*fHeight, 0.38*fWidth, iColorSet );
  drawCircleFan( fPosX, fPosY+0.57*fHeight, 0.38*fWidth, iColorSet );

  // 赤の長方形
  iCurrentDrawIdx = fillOrStroke( iColorSet, iCurrentDrawIdx, 4 );
  rect( fPosX-0.3*fWidth, fPosY+0.46*fHeight, 0.1*fWidth, 0.11*fHeight );
  rect( fPosX+0.2*fWidth, fPosY+0.46*fHeight, 0.1*fWidth, 0.11*fHeight );
  rect( fPosX-0.3*fWidth, fPosY+0.58*fHeight, 0.1*fWidth, 0.11*fHeight );
  rect( fPosX+0.2*fWidth, fPosY+0.58*fHeight, 0.1*fWidth, 0.11*fHeight );

  popMatrix();
}
void drawCircleClover( float fPosX, float fPosY, float fDiameter, int iColorSet )
{
  pushMatrix();
  translate( fPosX, fPosY );

  int iCurrentDrawIdx=0;
  setFillAndStroke( iColorSet );

  // bg circle
  if ( iColorSet<0 )
  {
    iCurrentDrawIdx = fillOrStroke( iColorSet, iCurrentDrawIdx, 2 );
  } else
  {
    for ( int iRotate = 15; iRotate<375; iRotate+=30 )
    {
      fillOrStroke( iColorSet, iCurrentDrawIdx, 2 );
      arc( 0, 0, fDiameter, fDiameter, radians(iRotate), radians(iRotate+30), PIE  );
    }
    iCurrentDrawIdx++;
  }
  circle( 0, 0, fDiameter );
  
  // bg middle circle
  if ( iColorSet>=0 )
  {
    for ( int iRotate = 15; iRotate<375; iRotate+=30 )
    {
      fillOrStroke( iColorSet, iCurrentDrawIdx, 2 );
      arc( 0, 0, 0.75*fDiameter, 0.75*fDiameter, radians(iRotate), radians(iRotate+30), PIE  );
    }
    iCurrentDrawIdx++;
  }
  
  // bg small circle
  if ( iColorSet<0 )
  {
    iCurrentDrawIdx = fillOrStroke( iColorSet, iCurrentDrawIdx, 2 );
    circle( 0, 0, 0.39*fDiameter );
  }
  else
  {
    for ( int iRotate = 15; iRotate<375; iRotate+=30 )
    {
      fillOrStroke( iColorSet, iCurrentDrawIdx, 2 );
      arc( 0, 0, 0.39*fDiameter, 0.39*fDiameter, radians(iRotate), radians(iRotate+30), PIE  );
    }
    iCurrentDrawIdx++;
  }
  iCurrentDrawIdx = fillOrStroke( iColorSet, iCurrentDrawIdx, 2 );
  circle( 0, 0, 0.28*fDiameter );
  
  // center clover
  iCurrentDrawIdx = fillOrStroke( iColorSet, iCurrentDrawIdx, 2 );
  draw4Clover(  0, 0, 0.2*fDiameter, float(15), iColorSet );
  iCurrentDrawIdx = fillOrStroke( iColorSet, iCurrentDrawIdx, 2 );
  circle(  0, 0, 0.1*fDiameter );
  iCurrentDrawIdx = fillOrStroke( iColorSet, iCurrentDrawIdx, 2 );
  circle( 0, 0, 0.13*fDiameter );
  
  // Clover
  float fCloverDiameter = fDiameter / 6.0;
  for ( int iRotate = 15; iRotate<375; iRotate+=30 )
  {
    if ( iColorSet<0 )
    {
      fillOrStroke( iColorSet, iCurrentDrawIdx, 2 );
    } else
    {
      if ( random(100)<30 )
      {
        fillOrStroke( iColorSet, iCurrentDrawIdx, 2 );
      } else
      {
        fillOrStroke( iColorSet, iCurrentDrawIdx+1, 2 );
      }
    }
    draw4Clover(  0.47*(fDiameter-fCloverDiameter)*cos(radians(iRotate)),
      0.47*(fDiameter-fCloverDiameter)*sin(radians(iRotate)),
      fCloverDiameter, float(iRotate), iColorSet );
  }
  if ( iColorSet<0 )
  {
    iCurrentDrawIdx++;
  } else
  {
    iCurrentDrawIdx += 2;
  }
  
  // radial lines
  if ( iColorSet<0 )
  {
    iCurrentDrawIdx = fillOrStroke( iColorSet, iCurrentDrawIdx, 2 );
    for ( int iRotate = 15; iRotate<375; iRotate+=30 )
    {
      line( (0.15*fDiameter)*cos(radians(iRotate)),
        (0.15*fDiameter)*sin(radians(iRotate)),
        (0.29*fDiameter)*cos(radians(iRotate)),
        (0.29*fDiameter)*sin(radians(iRotate)) );
    }
  }
  popMatrix();
}
void drawCircleFan( float fPosX, float fPosY, float fDiameter, int iColorSet )
{
  pushMatrix();
  translate( fPosX, fPosY );
  
  int iCurrentDrawIdx=0;
  setFillAndStroke( iColorSet );

  if ( iColorSet<0 )
  {
    iCurrentDrawIdx = fillOrStroke( iColorSet, iCurrentDrawIdx, 3 );
    for ( float fRotate = 0; fRotate<360; fRotate+=45 )
    {
      float fLineEndX = 0.5*fDiameter*cos(radians(fRotate-22.5));
      float fLineEndY = 0.5*fDiameter*sin(radians(fRotate-22.5));
      line( 0.3*fLineEndX, 0.3*fLineEndY, fLineEndX, fLineEndY );
      if ( int(fRotate)%90 == 0 )
      {
        float fVertex1X = 0.35*fDiameter*cos(radians(fRotate-22.5));
        float fVertex1Y = 0.35*fDiameter*sin(radians(fRotate-22.5));
        float fVertex2X = 0.5*fDiameter*cos(radians(fRotate+22.5));
        float fVertex2Y = 0.5*fDiameter*sin(radians(fRotate+22.5));
        line( fVertex1X, fVertex1Y, fVertex2X, fVertex2Y );
      }
    }
    circle( 0, 0, 0.3*fDiameter );
    circle( 0, 0, fDiameter );
  } else
  {
    for ( float fRotate = 0; fRotate<360; fRotate+=90 )
    {
      fillOrStroke( iColorSet, iCurrentDrawIdx, 3 );
      arc( 0, 0, fDiameter, fDiameter, radians(fRotate-22.5), radians(fRotate+22.5), PIE );
      fillOrStroke( iColorSet, iCurrentDrawIdx+1, 3 );
      arc( 0, 0, fDiameter, fDiameter, radians(fRotate+22.5), radians(fRotate+67.5), PIE );
      fillOrStroke( iColorSet, iCurrentDrawIdx+2, 3 );
      float fVertex0X = 0.5*fDiameter*cos(radians(fRotate-22.5));
      float fVertex0Y = 0.5*fDiameter*sin(radians(fRotate-22.5));
      float fVertex1X = 0.35*fDiameter*cos(radians(fRotate-22.5));
      float fVertex1Y = 0.35*fDiameter*sin(radians(fRotate-22.5));
      float fVertex2X = 0.5*fDiameter*cos(radians(fRotate+22.5));
      float fVertex2Y = 0.5*fDiameter*sin(radians(fRotate+22.5));
      triangle( fVertex0X, fVertex0Y, fVertex1X, fVertex1Y, fVertex2X, fVertex2Y );
    }
    iCurrentDrawIdx+=3;
    iCurrentDrawIdx = fillOrStroke( iColorSet, iCurrentDrawIdx, 3 );
    circle( 0, 0, 0.3*fDiameter );
  }

  popMatrix();
}
void draw4Clover( float fPosX, float fPosY, float fDiameter, float fAngle, int iColorSet )
{
  pushMatrix();
  translate(fPosX, fPosY);
  rotate(radians(fAngle));

  setFillAndStroke( iColorSet );

  if ( iColorSet<0 )
  {
    strokeCap(PROJECT);
    for ( int iRotate = 0; iRotate<360; iRotate+=90 )
    {
      rotate(radians(iRotate));
      arc( fDiameter/3.4, 0, fDiameter/1.8, fDiameter/1.8, radians(-90), radians(+90) );
    }
    strokeCap(ROUND);
  } else
  {
    for ( int iRotate = 0; iRotate<360; iRotate+=90 )
    {
      rotate(radians(iRotate));
      arc( fDiameter/3.4, 0, fDiameter/1.8, fDiameter/1.8, radians(-90), radians(+90) );
    }
    circle( 0, -0, 0.94*fDiameter );
  }
  popMatrix();
}
void drawWindowFrame( float fPosX, float fPosY, float fWidth, float fHeight, float fBaseRatio, int iColorSet )
{
  pushMatrix();
  translate(fPosX, fPosY);
  
  setFillAndStroke( iColorSet );
  
  // 窓枠
  curve( 0.7*fWidth, 0, 0, 0, -0.49*fWidth, 0.42*fHeight,-0.15*fWidth, 1.0*fHeight );
  curve(-0.4*fWidth, 0,-0.49*fWidth, 0.42*fHeight, -0.50*fWidth, fHeight*fBaseRatio,-0.50*fWidth, fHeight*fBaseRatio );
  curve( -0.7*fWidth, 0, 0, 0, 0.49*fWidth, 0.42*fHeight, 0.15*fWidth, 1.0*fHeight );
  curve(0.4*fWidth, 0, 0.49*fWidth, 0.42*fHeight, 0.50*fWidth, fHeight*fBaseRatio, 0.50*fWidth, fHeight*fBaseRatio );
  line(-0.50*fWidth, fHeight*fBaseRatio, 0.50*fWidth, fHeight*fBaseRatio);
  
  if ( iColorSet>=0 )
  {
    noStroke();
    beginShape();
    vertex( 0, 0 );
    vertex( -0.49*fWidth, 0.42*fHeight );
    vertex( -0.50*fWidth, fHeight*fBaseRatio );
    vertex( 0.50*fWidth, fHeight*fBaseRatio );
    vertex( 0.49*fWidth, 0.42*fHeight );
    endShape(CLOSE);
  }
  popMatrix();
}
void brightnessFilter()
{
  for ( int iFilterIdx = 0; iFilterIdx<BRIGHTNESS_INTENSITY.length; iFilterIdx++ )
  {
    int iCenterX = BRIGHTNESS_FILTER_POS[iFilterIdx][0];
    int iCenterY = BRIGHTNESS_FILTER_POS[iFilterIdx][1];
    int iWidth = BRIGHTNESS_FILTER_SIZE[iFilterIdx][0];
    int iHeight = BRIGHTNESS_FILTER_SIZE[iFilterIdx][1];
    float fIntensity = BRIGHTNESS_INTENSITY[iFilterIdx];

    pushMatrix();
    translate(iCenterX, iCenterY);

    for ( int iPixelY=-iHeight/2; iPixelY<iHeight/2; iPixelY++ )
    {
      for ( int iPixelX=-iWidth/2; iPixelX<iWidth/2; iPixelX++ )
      {
        // 楕円の方程式
        float fEllipse = pow(iPixelX/float(iWidth/2), 2)+pow(iPixelY/float(iHeight/2), 2);
        if ( fEllipse < 1 )
        {
          float fBrightnessAdd = fIntensity*(1 - fEllipse);
          stroke( 20, 6, 16, fBrightnessAdd );
          point( iPixelX, iPixelY );
        }
      }
    }
    popMatrix();
  }
}
int fillOrStroke( int iColorSet, int iCurrentDrawIdx, int iModuleIdx )
{
  if ( iColorSet < 0 )
  {
    int iStroke = 0;
    switch(iModuleIdx)
    {
    case 0:  // window common
      iStroke = STROKE_SET_COMMON[iCurrentDrawIdx];
      break;
    case 1:  // triangle strip
      iStroke = STROKE_SET_TRIANGLE_STRIP[iCurrentDrawIdx];
      break;
    case 2:
      iStroke = STROKE_SET_CIRCLE_CLOVER[iCurrentDrawIdx];
      break;
    case 3:
      iStroke = STROKE_SET_CIRCLE_FAN[iCurrentDrawIdx];
      break;
    case 4:
      iStroke = STROKE_SET_WINDOW_FAN[iCurrentDrawIdx];
      break;
    }
    stroke( 10, 6, 2 );
    strokeWeight(STROKE_WEIGHT[iStroke]);
    println("stroke:"+iStroke+" DrawIdx:"+iCurrentDrawIdx+" Module:"+iModuleIdx);
  } else
  {
    int iColorIdx = 0;
    switch(iModuleIdx)
    {
    case 0:  // window common
      iColorIdx = FILL_SET_COMMON[iColorSet][iCurrentDrawIdx];
      break;
    case 1:  // triangle strip
      iColorIdx = FILL_SET_TRIANGLE_STRIP[iColorSet][iCurrentDrawIdx];
      break;
    case 2:
      iColorIdx = FILL_SET_CIRCLE_CLOVER[iColorSet][iCurrentDrawIdx];
      break;
    case 3:
      iColorIdx = FILL_SET_CIRCLE_FAN[iColorSet][iCurrentDrawIdx];
      break;
    case 4:
      iColorIdx = FILL_SET_WINDOW_FAN[iColorSet][iCurrentDrawIdx];
      break;
    }
    fill( random(COLOR_TONE[iColorIdx][0], COLOR_TONE[iColorIdx][1]),
      random(COLOR_TONE[iColorIdx][2], COLOR_TONE[iColorIdx][3]),
      random(COLOR_TONE[iColorIdx][4], COLOR_TONE[iColorIdx][5]) );
    println("fill:"+iColorIdx+" DrawIdx:"+iCurrentDrawIdx+" Module:"+iModuleIdx);
  }
  return iCurrentDrawIdx+1;
}

void setFillAndStroke( int iColorSet )
{
  if ( iColorSet<0 )
  {
    noFill();
  } else
  {
    noStroke();
  }
}
