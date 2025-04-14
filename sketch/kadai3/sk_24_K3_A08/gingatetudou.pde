void gingatetudou()
{

     // 位置
fgRectX -= 600 * deltaTime;
    noStroke();
     fill( 0 );
     //線路
     rect( fgRectX, 210, 890, 2 );
     rect( fgRectX+900, 210, 30, 2 );
     rect( fgRectX+940, 210, 20, 2 );
     rect( fgRectX+970, 210, 15, 2 );
     rect( fgRectX+995, 210, 10, 2 );
     rect( fgRectX+1015, 210, 5, 2 );
     //煙
     fill( 100, 50 );
     ellipse( fgRectX+65, 175, 15, 10 );
     ellipse( fgRectX+95, 160, 30, 20 );
     ellipse( fgRectX+150, 140, 60, 40 );
     //列車本体
     fill( 0 );
     triangle( fgRectX+40, 207, 49, 203, 55, 207 );//列車下
     rect( fgRectX+50, 203 , 35, 4 );
     rect( fgRectX+87, 203 , 680, 4 );
     circle( fgRectX+48, 196, 10 );//列車中心
     rect( fgRectX+48, 189 , 36, 13 );
     rect( fgRectX+70, 182 , 14, 20 );
     rect( fgRectX+87, 189 , 680, 13 );
     triangle( fgRectX+54, 194, 49, 181, 57, 181 );//列車下
     fill( fgRectX+255, 255, 0 );
     rect( fgRectX+74, 185 , 7, 9 );//窓
//以下おそらくもっといい書き方があると思うが思いつかなかった
     rect( fgRectX+90, 192, 4, 6);//1車両目
     rect( fgRectX+96, 192, 4, 6);
     rect( fgRectX+102, 192, 4, 6);
     rect( fgRectX+108, 192, 4, 6);
     rect( fgRectX+116, 192, 4, 6);//2車両目
     rect( fgRectX+122, 192, 4, 6);
     rect( fgRectX+128, 192, 4, 6);
     rect( fgRectX+134, 192, 4, 6);
     rect( fgRectX+142, 192, 4, 6);//3車両目
     rect( fgRectX+148, 192, 4, 6);
     rect( fgRectX+154, 192, 4, 6);
     rect( fgRectX+160, 192, 4, 6);
     rect( fgRectX+168, 192, 4, 6);//4車両目
     rect( fgRectX+174, 192, 4, 6);
     rect( fgRectX+180, 192, 4, 6);
     rect( fgRectX+186, 192, 4, 6);
     rect( fgRectX+194, 192, 4, 6);//5車両目
     rect( fgRectX+200, 192, 4, 6);
     rect( fgRectX+206, 192, 4, 6);
     rect( fgRectX+212, 192, 4, 6);
     rect( fgRectX+220, 192, 4, 6);//6車両目
     rect( fgRectX+226, 192, 4, 6);
     rect( fgRectX+232, 192, 4, 6);
     rect( fgRectX+238, 192, 4, 6);
     rect( fgRectX+246, 192, 4, 6);//7車両目
     rect( fgRectX+252, 192, 4, 6);
     rect( fgRectX+258, 192, 4, 6);
     rect( fgRectX+264, 192, 4, 6);
     rect( fgRectX+272, 192, 4, 6);//8車両目
     rect( fgRectX+278, 192, 4, 6);
     rect( fgRectX+284, 192, 4, 6);
     rect( fgRectX+290, 192, 4, 6);
     rect( fgRectX+298, 192, 4, 6);//9車両目
     rect( fgRectX+304, 192, 4, 6);
     rect( fgRectX+310, 192, 4, 6);
     rect( fgRectX+316, 192, 4, 6);
     rect( fgRectX+324, 192, 4, 6);//10車両目
     rect( fgRectX+330, 192, 4, 6);
     rect( fgRectX+336, 192, 4, 6);
     rect( fgRectX+342, 192, 4, 6);
     rect( fgRectX+350, 192, 4, 6);//11車両目
     rect( fgRectX+356, 192, 4, 6);
     rect( fgRectX+362, 192, 4, 6);
     rect( fgRectX+368, 192, 4, 6);
     rect( fgRectX+376, 192, 4, 6);//12車両目
     rect( fgRectX+382, 192, 4, 6);
     rect( fgRectX+388, 192, 4, 6);
     rect( fgRectX+394, 192, 4, 6);
     rect( fgRectX+402, 192, 4, 6);//13車両目
     rect( fgRectX+408, 192, 4, 6);
     rect( fgRectX+414, 192, 4, 6);
     rect( fgRectX+420, 192, 4, 6);
     rect( fgRectX+428, 192, 4, 6);//14車両目
     rect( fgRectX+434, 192, 4, 6);
     rect( fgRectX+440, 192, 4, 6);
     rect( fgRectX+446, 192, 4, 6);
     rect( fgRectX+454, 192, 4, 6);//15車両目
     rect( fgRectX+460, 192, 4, 6);
     rect( fgRectX+466, 192, 4, 6);
     rect( fgRectX+472, 192, 4, 6);
     rect( fgRectX+480, 192, 4, 6);//16車両目
     rect( fgRectX+486, 192, 4, 6);
     rect( fgRectX+492, 192, 4, 6);
     rect( fgRectX+498, 192, 4, 6);
     rect( fgRectX+506, 192, 4, 6);//17車両目
     rect( fgRectX+512, 192, 4, 6);
     rect( fgRectX+518, 192, 4, 6);
     rect( fgRectX+524, 192, 4, 6);
     rect( fgRectX+532, 192, 4, 6);//18車両目
     rect( fgRectX+538, 192, 4, 6);
     rect( fgRectX+544, 192, 4, 6);
     rect( fgRectX+550, 192, 4, 6);
     rect( fgRectX+558, 192, 4, 6);//19車両目
     rect( fgRectX+564, 192, 4, 6);
     rect( fgRectX+570, 192, 4, 6);
     rect( fgRectX+576, 192, 4, 6);
     rect( fgRectX+584, 192, 4, 6);//20車両目
     rect( fgRectX+590, 192, 4, 6);
     rect( fgRectX+596, 192, 4, 6);
     rect( fgRectX+602, 192, 4, 6);
     rect( fgRectX+610, 192, 4, 6);//21車両目
     rect( fgRectX+616, 192, 4, 6);
     rect( fgRectX+622, 192, 4, 6);
     rect( fgRectX+628, 192, 4, 6);
     rect( fgRectX+636, 192, 4, 6);//22車両目
     rect( fgRectX+642, 192, 4, 6);
     rect( fgRectX+648, 192, 4, 6);
     rect( fgRectX+654, 192, 4, 6);
     rect( fgRectX+662, 192, 4, 6);//23車両目
     rect( fgRectX+668, 192, 4, 6);
     rect( fgRectX+674, 192, 4, 6);
     rect( fgRectX+680, 192, 4, 6);
     rect( fgRectX+688, 192, 4, 6);//24車両目
     rect( fgRectX+694, 192, 4, 6);
     rect( fgRectX+700, 192, 4, 6);
     rect( fgRectX+706, 192, 4, 6);
     rect( fgRectX+714, 192, 4, 6);//25車両目
     rect( fgRectX+720, 192, 4, 6);
     rect( fgRectX+726, 192, 4, 6);
     rect( fgRectX+732, 192, 4, 6);
     rect( fgRectX+740, 192, 4, 6);//26車両目
     rect( fgRectX+746, 192, 4, 6);
     rect( fgRectX+752, 192, 4, 6);
     rect( fgRectX+758, 192, 4, 6);
     
     //車輪
     fill( 0 );
     circle( fgRectX+50, 209, 5 );
     circle( fgRectX+60, 209, 5 );
     circle( fgRectX+70, 209, 5 );
     circle( fgRectX+80, 209, 5 );
     circle( fgRectX+90, 209, 5 );
     circle( fgRectX+100, 209, 5 );
     circle( fgRectX+110, 209, 5 );
     circle( fgRectX+120, 209, 5 );
     circle( fgRectX+130, 209, 5 );
     circle( fgRectX+140, 209, 5 );
     circle( fgRectX+150, 209, 5 );
     circle( fgRectX+160, 209, 5 );
     circle( fgRectX+170, 209, 5 );
     circle( fgRectX+180, 209, 5 );
     circle( fgRectX+190, 209, 5 );
     circle( fgRectX+200, 209, 5 );
     circle( fgRectX+210, 209, 5 );
     circle( fgRectX+220, 209, 5 );
     circle( fgRectX+230, 209, 5 );
     circle( fgRectX+240, 209, 5 );
     circle( fgRectX+250, 209, 5 );
     circle( fgRectX+260, 209, 5 );
     circle( fgRectX+270, 209, 5 );
     circle( fgRectX+280, 209, 5 );
     circle( fgRectX+290, 209, 5 );
     circle( fgRectX+300, 209, 5 );
     circle( fgRectX+310, 209, 5 );
     circle( fgRectX+320, 209, 5 );
     circle( fgRectX+330, 209, 5 );
     circle( fgRectX+340, 209, 5 );
     circle( fgRectX+350, 209, 5 );
     circle( fgRectX+360, 209, 5 );
     circle( fgRectX+370, 209, 5 );
     circle( fgRectX+380, 209, 5 );
     circle( fgRectX+390, 209, 5 );
     circle( fgRectX+400, 209, 5 );
     circle( fgRectX+410, 209, 5 );
     circle( fgRectX+420, 209, 5 );
     circle( fgRectX+430, 209, 5 );
     circle( fgRectX+440, 209, 5 );
     circle( fgRectX+450, 209, 5 );
     circle( fgRectX+460, 209, 5 );
     circle( fgRectX+470, 209, 5 );
     circle( fgRectX+480, 209, 5 );
     circle( fgRectX+490, 209, 5 );
     circle( fgRectX+500, 209, 5 );
     circle( fgRectX+510, 209, 5 );
     circle( fgRectX+520, 209, 5 );
     circle( fgRectX+530, 209, 5 );
     circle( fgRectX+540, 209, 5 );
     circle( fgRectX+550, 209, 5 );
     circle( fgRectX+560, 209, 5 );
     circle( fgRectX+570, 209, 5 );
     circle( fgRectX+580, 209, 5 );
     circle( fgRectX+590, 209, 5 );
     circle( fgRectX+600, 209, 5 );
     circle( fgRectX+610, 209, 5 );
     circle( fgRectX+620, 209, 5 );
     circle( fgRectX+630, 209, 5 );
     circle( fgRectX+640, 209, 5 );
     circle( fgRectX+650, 209, 5 );
     circle( fgRectX+660, 209, 5 );
     circle( fgRectX+670, 209, 5 );
     circle( fgRectX+680, 209, 5 );
     circle( fgRectX+690, 209, 5 );
     circle( fgRectX+700, 209, 5 );
     circle( fgRectX+710, 209, 5 );
     circle( fgRectX+720, 209, 5 );
     circle( fgRectX+730, 209, 5 );
     circle( fgRectX+740, 209, 5 );
     circle( fgRectX+750, 209, 5 );
     circle( fgRectX+760, 209, 5 );


}
