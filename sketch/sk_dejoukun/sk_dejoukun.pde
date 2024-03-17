size( 400, 400 );

/*
PImage img;
img = loadImage("dinfo_logo.jpg");

background(img);
*/
background(204);

noStroke();  // fuchi nashi

// finger
fill( 0 );
ellipse( 300, 151, 104, 136 );

// finger mask
fill( 204 );
ellipse( 390, 130, 200, 200 );

// daen
fill( 0 );
ellipse( 200, 230, 260, 200 );

// mouth mask
fill( 204 );
ellipse( 198, 204, 116, 186 );

// ue daen mask
fill( 0 );
ellipse( 198, 196, 200, 134 );

// daen mask
fill( 204 );
ellipse( 198, 204, 90, 60 );
