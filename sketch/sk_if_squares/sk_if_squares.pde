size( 400, 100 );

for ( int iX = 0; iX < 400; iX += 50 )
{
  if( iX >= 200  )  // もしiXの値が200以上だったら．
  {
    fill( 100 );
  }
  
  square( iX, 25, 50 );
}
