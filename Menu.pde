class Menu
{
  float mainLeftSpace = width * 0.33f;
  float topSpace = height * 0.05f;
  float optionGap = topSpace + (height * 0.2f);
  float leftSide = width * 0.05f;
  float rightSide = width * 0.62f;
  float side;
  
  float boxW = width * 0.33f;
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
    
    int counter = 0;
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
      rect(side, optionGap, boxW, boxH);
      fill(0);
      text(options[i], side, optionGap, boxW, boxH);
      
      counter ++;
      if(counter == 2)
      {
        optionGap += (height * 2.0f); 
        counter = 0;
      }
    }
  }
}
