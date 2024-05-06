size( 400, 400 );

for ( int iGyou = 0; iGyou < 8; iGyou++ )
{
  for ( int iRetsu = 0; iRetsu < 8; iRetsu++ )
  {
    if( iGyou % 2 == 0 && iRetsu % 2 == 0   )
    {
      fill( 100 );
    }
    else
    {
      fill( 255 );
    }
    
    square( iRetsu * 50 + 5, iGyou * 50 + 5, 40 );
  }
}
