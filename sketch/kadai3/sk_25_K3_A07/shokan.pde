void Shokan()
{
  if ( isShokanFrame > 385) //光が大きくなりながら、魔法陣の中央より上昇
  {
    blendMode(ADD);
    fill(148,93,216);
    circle(300,0-(350-isShokanFrame)*3,(500-isShokanFrame));
     isShokanFrame --;
    blendMode(BLEND);
  }
   else if ( isShokanFrame > 200) //光が拡大
  {
    blendMode(ADD);
     fill(148,93,216);
    circle(300,-300-(0-400),(500-isShokanFrame));
     isShokanFrame --;
    blendMode(BLEND);
  }
  else if( isShokanFrame > 40) //デ情くんが召喚される。少しずつ色が暗くなってフェードアウト
  {

    pushMatrix();
    scale(0.5);
   DejoukunShokan(600, 180,0,(148-(200-isShokanFrame)),(93-(200-isShokanFrame)),(216-(200-isShokanFrame)));
    isShokanFrame --;
    popMatrix();
  }
}


void DejoukunShokan( int iX, int iY, float iDeg ,int iR,int iG,int iB)
{
  fill(148, 93, 216);

  pushMatrix();

  translate( iX, iY );
  rotate( radians( iDeg ) );

  noStroke();  // fuchi nashi

  // finger
  fill( iR,iG,iB);
  ellipse( 100, -49, 104, 136 );

  // finger mask
  fill( 10, 16, 43 );
  ellipse( 190, -70, 200, 200 );

  // daen
  fill( iR,iG,iB );
  ellipse( 0, 30, 260, 200 );

  // mouth mask
  fill( 10, 16, 43);
  ellipse( 0, 4, 116, 186 );

  // ue daen mask
  fill( iR,iG,iB );
  ellipse( 0, -4, 200, 134 );

  // daen mask
  fill( 10, 16, 43);
  ellipse( 0, 4, 90, 60 );

  popMatrix();
}
