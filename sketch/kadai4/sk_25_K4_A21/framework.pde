void mouseClicked()
{
  redraw();
}
void keyPressed()
{
  if ( key == '1' )
  {
    save(pngName+"_01.png");
  } else if ( key == '2' )
  {
    save(pngName+"_02.png");
  }
}
