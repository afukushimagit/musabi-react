size( 400, 100 );

for ( int iX = 0; iX < 400; iX += 50 )
{   
  if( iX % 100 == 0 )    // iXの値100で割った余りが0の時
  {
    circle( iX + 25, 50, 50 );
  }
  else
  {
    square( iX, 25, 50 );
  }
}
