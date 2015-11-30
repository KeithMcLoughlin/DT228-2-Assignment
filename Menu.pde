class Menu
{
  float mainLeftSpace = width * 0.4f;
  float topSpace = height * 0.1f;
  float optionGap = topSpace * 3.0f;
  float leftSide = width * 0.1f;
  float rightSide = width * 0.7f;
  float side;
  
  float boxW = width * 0.2f;
  float boxH = height * 0.1f;
  
  String title;
  String[] options;
  PImage back;
  
  Menu(String t, String[] o,  String b)
  {
    title = t;
    options = o;
    back = loadImage(b);
  }
  
  void generate()
  {
    image(back, 0, 0, width, height);
    textAlign(CENTER);
    stroke(0);
    
    fill(#7B79FF);
    rect(mainLeftSpace, topSpace, boxW, boxH);
    fill(0);
    textSize(50);
    text(title, mainLeftSpace, topSpace, boxW, boxH);
    
    for(int i = 0; i < options.length; i++)
    {
      if(i % 2 == 0)
      {
        side = leftSide;
      }
      else
      {
        side = rightSide;
      }
      
      fill(#7B79FF);
      rect(side, optionGap * (i+1), boxW, boxH);
      fill(0);
      textSize(30);
      text(options[i], side, optionGap * (i+1), boxW, boxH);
    }
  }
}
