size( 600, 100 );

for ( int iX = 0; iX < 600; iX += 50 )
{   
  if( iX % 150 == 0 )    // iXの値150で割った余りが0の時
  {
    circle( iX + 25, 50, 50 );
  }
  else
  {
    square( iX, 25, 50 );
  }
}
