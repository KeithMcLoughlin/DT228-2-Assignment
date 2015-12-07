class Menu
{
  //fields
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
    
    //the main title for the menu
    fill(#7B79FF);
    rect(mainLeftSpace, topSpace, boxW, boxH);
    fill(0);
    textSize(30);
    text(title, mainLeftSpace, topSpace, boxW, boxH);
    
    //the other options
    int counter = 0;
    for(int i = 0; i < options.length; i++)
    {
      //check which side the option needs to be on (left or right side) 
      if(i % 2 == 0)
      {
        side = leftSide;
      }
      else
      {
        side = rightSide;
      }
      
      //making the option tab
      fill(#7B79FF);
      rect(side, optionGap, boxW, boxH);
      fill(0);
      text(options[i], side, optionGap, boxW, boxH);
      
      counter ++;
      //makes it 2 options per row
      if(counter == 2)
      {
        optionGap += (height * 0.2f); 
        counter = 0;
      }
    }
  }
}
