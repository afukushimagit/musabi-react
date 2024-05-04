size( 400, 100 );

for ( int iX = 0; iX < 400; iX += 50 )
{
  if( iX < 200  )  // もしiXの値が200未満だったら．
  {
    square( iX, 25, 50 );
  }
  else             // そうでなかったら
  {
    circle( iX + 25, 50, 50 );
  }
}
