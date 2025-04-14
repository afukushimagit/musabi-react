//対向車線の電車
void taikoudensya(){
  
  PFont font = createFont("MS Gothic",50);
  textFont (font);
  
     // 位置
ftRectX += 600 * deltaTime;

     noStroke();
     fill( 0, 0, 30 );
     rect( ftRectX , 225, 1200, 225 );
     //電車の柄
     fill( 50, 0, 0 );
     rect( ftRectX, 230, 1200, 20 );//上線
     fill( 50, 0, 0 );
     rect( ftRectX, 380, 1200, 50 );//下線
     fill( 0, 0, 10 );//ドア
     rect( ftRectX+20, 280, 80, 160 );
     rect( ftRectX+140, 280, 160, 160 );
     rect( ftRectX+510, 280, 160, 160 );
     rect( ftRectX+880, 280, 160, 160 );
     rect( ftRectX+1080, 280, 80, 160 );
     fill( 0, 0, 30 );//ドア区切り線
     rect( ftRectX+215, 280, 10, 160 );
     rect( ftRectX+585, 280, 10, 160 );
     rect( ftRectX+955, 280, 10, 160 );
     fill( 210, 210, 0 );//窓
     rect( ftRectX+30, 290, 60, 80 );
     rect( ftRectX+150, 290, 55, 80 );
     rect( ftRectX+235, 290, 55, 80 );
     rect( ftRectX+330, 290, 150, 80 );
     rect( ftRectX+520, 290, 55, 80 );
     rect( ftRectX+605, 290, 55, 80 );
     rect( ftRectX+700, 290, 150, 80 );
     rect( ftRectX+890, 290, 55, 80 );
     rect( ftRectX+975, 290, 55, 80 );
     rect( ftRectX+1093, 290, 55, 80 );
     fill( 0, 0, 70 );//窓区切り線
     rect( ftRectX+400, 290, 10, 80 );
     rect( ftRectX+770, 290, 10, 80 );
     fill( 230, 170 );//行先表示
     rect( ftRectX+361, 245, 90, 35 );
     fill( 255, 50, 0 );
     textSize( 15 );
     text( "きさらぎ", ftRectX+364, 268 );
     textSize( 10 );
     text( "方面", ftRectX+427, 268 );
     
     fill( 230, 170 );
     rect( ftRectX+732, 245, 90, 35 );
     fill( 255, 50, 0 );
     textSize( 15 );
     text( "きさらぎ", ftRectX+735, 268 );
     textSize( 10 );
     text( "方面", ftRectX+798, 268 );
     
     
}
