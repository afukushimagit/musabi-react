/**************************************************************
スパイラルとシェルピンスキーのカーペットを使って東洋の寺院にあるタイルを作成した。
スパイラルにfor文を併用し細かく繰り返すことでカケアミのようなグラデーションをかけた。
中央の白いスパイラルはランダムに回転し、不規則な渦が生成される。
 **************************************************************/
/**
  デバッグ機能
    実行ウィンドウ内でマウスクリック：再描画
    '1'キー：１枚目のpng出力（~_01.png）
    '2'キー：２枚目のpng出力（~_02.png）
*/
// === 'S'キーを押した時の出力画像名 ===
//  "K4_[クラス][番号]_[苗字]"  ※拡張子(.png)は不要
String pngName = "K4_A12_fukushima";

// === グローバル変数/定数 ===



// === setupには変更を加えないこと ===
void setup()
{
  size(1000, 1000);    // Window Size
  noLoop();            // draw once.
}

void draw() 
{
  background(255,255,255);  // 背景色を描画
  drawCarpet( width/2, height/2, width, height, 5 );  // 最初の再帰呼び出し
  translate(width/2, height/2);  // 中心を基準に描画

  
  //フレーム
  
    stroke(0,0,204);
    strokeWeight(10);
    noFill();
    rect(0,-1,900,900);
    
  // 花紺縁
  for (int iRot = 0; iRot < 360; iRot += 50) 
  {
    pushMatrix();  // 現在の変換行列を保存

    rotate(radians(iRot));  // 
    
    fill(0,0,204);
    noStroke();
    circle(150,150,400);
    
  
    popMatrix();  // 保存した変換行列を復元
  }
  
 //花内
  for (int iRot = 0; iRot < 360; iRot += 50) 
  {
    pushMatrix();  // 現在の変換行列を保存

    rotate(radians(iRot));  // 72度回転
    
    fill(44,180,173);
    noStroke();
    circle(150,150,300);
    
    popMatrix();  // 保存した変換行列を復元
  }
  
  //スパイラル細１
  for (int iRot = 0; iRot < 360; iRot += 3)
  {
    pushMatrix();  // 現在の変換行列を保存

    rotate(radians(iRot));  // 72度回転
    
    stroke(132,255,132);
    strokeWeight(2);
    drawSpiral(0, 0, 14, 0, 230); // スパイラルを描画

    popMatrix();  // 保存した変換行列を復元
  }
  
  //スパイラル細２
  for (int iRot = 0; iRot < 360; iRot += 3)
  {
    pushMatrix();  // 現在の変換行列を保存

    rotate(radians(iRot));  // 72度回転
    
    stroke(201,255,147);
    strokeWeight(2);
    drawSpiral(0, 0, 11, 0, 230); // スパイラルを描画

    popMatrix();  // 保存した変換行列を復元
  }
  
 
  
  //太スパイラル紺縁
  for (int iRot = 0; iRot < 360; iRot += 60)
  {
    pushMatrix();  // 現在の変換行列を保存

    rotate(radians(iRot));  // 60度回転
    
    stroke(0,0,204);
    strokeWeight(35);
    drawSpiral(0, 0, 18, 0, 230); // スパイラルを描画

    popMatrix();  // 保存した変換行列を復元
  }
  
  //太スパイラル白太
  for (int iRot = 0; iRot < 360; iRot += 60)
  {
    pushMatrix();  // 現在の変換行列を保存

    rotate(radians(iRot));  // 60度回転
    
    stroke(255,255,255);
    strokeWeight(20);
    drawSpiral(0, 0, 18, 0, 230); // スパイラルを描画

    popMatrix();  // 保存した変換行列を復元
  }
  

//中心

//縁取り朱

  noStroke();
  fill(255,69,0);
  ellipse(0, 0, 420, 220); 
  
  ellipse(0, 0, 220, 420);
  
  circle(80, 100, 120);
  circle(-80, 100,120);
  circle(-80, -100,120);
  circle(80, -100,120);

//紺色
  noStroke();
  fill(0,0,204);
  ellipse(0, 0, 400, 200); 
  
  ellipse(0, 0, 200, 400);
  
  circle(80, 100, 100);
  circle(-80, 100,100);
  circle(-80, -100,100);
  circle(80, -100,100);
  
  //スパイラル白
  for (int iRot = 0; iRot < 360; iRot += 40)
  {
    pushMatrix();  // 現在の変換行列を保存

    rotate(radians(iRot));  // 
    
    stroke(255,255,255);
    strokeWeight(2);
    drawSpiral(0, 0, random(6,9), 0, 150); // スパイラルを描画

    popMatrix();  // 保存した変換行列を復元
  }
  
  //中央小花
  for (int iRot = 0; iRot < 360; iRot += 50) 
  {
    pushMatrix();  // 現在の変換行列を保存

    rotate(radians(iRot));  // 
    
    fill(44,180,173);
    noStroke();
    circle(30,30,80);
    
  
    popMatrix();  // 保存した変換行列を復元
  }
  
  //中央小花２
  for (int iRot = 0; iRot < 360; iRot += 36) 
  {
    pushMatrix();  // 現在の変換行列を保存

    rotate(radians(iRot));  
    
    fill(152,251,152);
    noStroke();
    circle(30,30,35);
    
    popMatrix();  // 保存した変換行列を復元
  }
  
  
  //中心小円
  noStroke();
  fill(255,69,0);
  circle(0,0,50);
  
  //中心小円２
  noStroke();
  fill(255,220,0);
  circle(0,0,30); 
  
  }

/**
 * 再帰関数：線を再帰的に短くし，回転させながら描画する．
 */
void drawSpiral(float fBeginX, float fBeginY, float fLength, float fRot, int iLevel) 
{
  if (iLevel > 0) {  // 再帰の継続条件
    // 線の終点
    float fEndX = fBeginX + cos(radians(fRot)) * fLength;
    float fEndY = fBeginY + sin(radians(fRot)) * fLength;

    line(fBeginX, fBeginY, fEndX, fEndY); // 線を描画

    drawSpiral(fEndX, fEndY, fLength * 0.981, fRot + 3.9, iLevel - 1); // 再帰呼び出し
  }
}
 
  //カーペット
  void drawCarpet( float fCenterX, float fCenterY, float fWidth, float fHeight, int iLevel )
{  
  if( iLevel > 0 )
  {
    // 中央に描画する矩形の大きさ
    float fRectW = fWidth/3;
    float fRectH = fHeight/3;

    // 再帰レベルに応じて図形を変える．
    if( iLevel % 3 == 0 )
    {
      // 矩形描画
       fill(44,180,173);
       rectMode( CENTER );  // 矩形の座標を中心点で指定する
       noStroke();
       fill(0,0,204);
       ellipse(fCenterX, fCenterY, fRectW/2, fRectH); 
  
       ellipse(fCenterX, fCenterY, fRectW, fRectH/2);
  
       fill(255,69,0);
       ellipse( fCenterX, fCenterY, fRectW/4, fRectH/4 );
    }
    else if( iLevel % 3 == 1 )
    {
     //花
       noStroke();
       fill(255,  100, 255);
       ellipse(fCenterX, fCenterY, fRectW/2, fRectH); 
  
       ellipse(fCenterX, fCenterY, fRectW, fRectH/2);
  
       fill(255, 0, 0);
       ellipse( fCenterX, fCenterY, fRectW/4, fRectH/4 );
      
    }
    else if( iLevel % 3 == 2 )
    {
      // 円
      noStroke();
      fill(255,69,0);
      ellipse( fCenterX, fCenterY, fRectW, fRectH );
      
    }
    
    
    
    
  // 再帰呼び出し
    drawCarpet( fCenterX - fRectW, fCenterY - fRectH, fRectW, fRectH, iLevel - 1 );
    drawCarpet( fCenterX, fCenterY - fRectH, fRectW, fRectH, iLevel - 1 );
    drawCarpet( fCenterX + fRectW, fCenterY - fRectH, fRectW, fRectH, iLevel - 1 );
    drawCarpet( fCenterX - fRectW, fCenterY, fRectW, fRectH, iLevel - 1 );
    drawCarpet( fCenterX + fRectW, fCenterY, fRectW, fRectH, iLevel - 1 );
    drawCarpet( fCenterX - fRectW, fCenterY + fRectH, fRectW, fRectH, iLevel - 1 );
    drawCarpet( fCenterX, fCenterY + fRectH, fRectW, fRectH, iLevel - 1 );
    drawCarpet( fCenterX + fRectW, fCenterY + fRectH, fRectW, fRectH, iLevel - 1 );
  }
}
  
  
  

 



// === 再帰関数の定義 ===
