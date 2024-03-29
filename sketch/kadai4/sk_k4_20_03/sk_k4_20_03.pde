void setup()
{
  size( 1000, 1000 );
  colorMode( HSB, 360, 100, 100, 100 );  // カラーモード( HSB, 色相, 彩度, 輝度, 不透明度 )
  background( 188, 90, 20 );  // 背景( 深緑色, 彩度90, 輝度20 )
  
  //花の座標はキャンバスの中心
  translate( 500, 500 );
    //色彩設定
    for( int i = 45; i <= 80;  i++ ) // orange~yellow系の色
    {
      blendMode( SCREEN ); // 重なる部分が明るくなる
      rotate( PI/ 9 );  // 花弁は20度ずつ作られる
      
      stroke( random( i ), 100, 95, 10 ); // ( 色相はランダム, 彩度100, 輝度95, 不透明度10 )
      strokeWeight( 1 );
      
      // 花の描画設定
      int kakudo = -90; // 反時計回りに90度回る
      int takasa = 140; // 高さは140で統一
      int X = 50;
      int Y = 50;
      Tree( kakudo, 110, X, Y );  // ( 90度(反時計回り), 高さ110, X50, Y50 )
      Tree( kakudo+5, takasa, X, Y );  // ( 85度(反時計回り), 高さ140 )
      Tree( kakudo+10, takasa, X, Y );  // ( 80度(反時計回り) )
      Tree( kakudo+15, takasa, X, Y );  // ( 75度(反時計回り) )
      Tree( kakudo+20, takasa, X, Y );  // ( 70度(反時計回り) )
      Tree( kakudo+25, takasa, X, Y );  // ( 65度(反時計回り) )
    }
 /*save("kadai_4.jpg");*/
}
 
 
// 花の形状設定
void Tree( float fAngle, float fLength, float fSX, float fSY )
{
  // 終点座標
  float fEX = fLength*cos( radians( fAngle ) )+fSX;
  float fEY = fLength*sin( radians( fAngle ) )+fSY;
  // 軸の長さ
  line( fSX, fSY, fEX, fEY );
  // 軸の他の線を描画
  if( fLength > 5 )  // 長さが5以上なら再帰終了
  {
    Tree( fAngle * 30, fLength*0.75, fEX, fEY ); // fAngle * 30
    Tree( fAngle = hour()+minute(), fLength*0.75, fEX, fEY ); // fAngle = 時＋分によって決定する
    println(fAngle);
  }
}
