size( 200, 200 );

translate( 100, 50 );

beginShape( TRIANGLE_FAN );

vertex(  0,  0 );  // 最初の中心となる点
vertex( 80, 35 );
vertex( 55, 70 );
vertex( 20, 90 );
vertex( -20, 90 );
vertex( -55, 70 );
vertex( -80, 35 );

endShape( CLOSE );
