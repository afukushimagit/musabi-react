size(500, 500); //画面サイズの指定
colorMode(HSB, 360, 1.0, 1.0, 1.0); //カラーモードと色相、彩度、輝度、アルファの最大値の設定
background(10, 0.9, 0.7, 1.0); //背景色にやや暗い赤色を設定
for (int iBlackX = 20; iBlackX < width; iBlackX +=140) //黒い縦線の繰り返し設定
{
  for (int iBlackY = 20; iBlackY < height; iBlackY +=140) //黒い横線の繰り返し設定
  {
    stroke(230, 0.2, 0.2, 0.3); //色を黒色に変更
    strokeCap(SQUARE); //線の形状をスクエアに変更
    strokeWeight(30); //線の太さの変更（太線）
    line(iBlackX, 0, iBlackX, height); //黒い縦線①の描画
    line(iBlackX+55, 0, iBlackX+55, height); //黒い縦線②の描画
    line(0, iBlackY, width, iBlackY); //黒い横線①の描画
    line(0, iBlackY+55, width, iBlackY+55); //黒い横線②の描画
    strokeWeight(2); //線の太さの変更（細線）
    stroke(230, 0.2, 0.2, 0.3); //線の色（主にアルファ）を変更
    line(iBlackX+22.5, 0, iBlackX+22.5, height);//黒い縦線①の描画
    line(iBlackX+32.5, 0, iBlackX+32.5, height);//黒い縦線②の描画
    line(0, iBlackY+22.5, width, iBlackY+22.5); //黒い横線①の描画
    line(0, iBlackY+32.5, width, iBlackY+32.5); //黒い横線②の描画
  };
}; //黒い線の描画終了
for (int iWhiteY = 20; iWhiteY < height; iWhiteY +=140) //白い横線の繰り返し設定
{
  for (float fWhiteY = iWhiteY; fWhiteY < iWhiteY + 75; fWhiteY += 27.5) //3本複製する設定
  {
    for (int iWhiteX = 20; iWhiteX < height; iWhiteX += 140) //白い縦線の繰り返し設定
    {
      for (float fWhiteX = iWhiteX; fWhiteX < iWhiteX + 75; fWhiteX += 27.5) //3本複製する設定
      {
        stroke(0, 0, 1.0, 0.1); //線の色を白色に変更
        strokeWeight(2.5); //線の太さ変更
        line(0, fWhiteY, width, fWhiteY); //横線の描画
        line(fWhiteX, 0, fWhiteX, height); //縦線の描画
      };//3本の線の描画
    };
  };
}; //白い線の描画の終了
for (int iYellowX = 26; iYellowX < width; iYellowX +=140) //黄色い縦線の繰り返し設定
{
  for (int iYellowY = 26; iYellowY < height; iYellowY +=140) //黄色い横線の繰り返し設定
  {
    stroke(50, 0.9, 0.8, 0.2); //線の色を黄色に変更
    line(iYellowX, 0, iYellowX, height); //黄色の縦線①の描画
    line(iYellowX+55, 0, iYellowX+55, height); //黄色の縦線②の描画
    line(0, iYellowY, width, iYellowY); //黄色の横線①の描画
    line(0, iYellowY+55, width, iYellowY+55); //黄色の横線②の描画
  }; //黄色い線の描画終了
};
for (int iBlueX = 5; iBlueX < width; iBlueX +=140) //青い縦線の繰り返し設定
{
  for (int iBlueY = 5; iBlueY < height; iBlueY +=140) //青い横線の繰り返し設定
  {
    stroke(200, 0.9, 0.7, 0.1); //線の色を青色に変更
    line(iBlueX, 0, iBlueX, height); //青色の縦線①の描画
    line(iBlueX+85, 0, iBlueX+85, height); //青色の縦線②の描画
    line(0, iBlueY, width, iBlueY); //青色の横線①の描画
    line(0, iBlueY+85, width, iBlueY+85); //青色の横線②の描画
  }; //青い線の描画終了
};
