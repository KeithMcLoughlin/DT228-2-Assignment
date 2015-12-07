class Graph
{
  //fields
  float border;
  int horIntervals;
  int verIntervals;
  float horRange;
  float horGap;
  float verRange;
  float verGap;
  float tick;
  
  //default constructor
  Graph()
  {
   this(8, 10);
  }
  
  //parameterised constructor - takes in horizonal and vertical intervals
  Graph(int hi, int vi)
  {
    border = width * 0.1f;
    horIntervals = hi;
    verIntervals = vi;
    horRange = width - (border * 2.0f);
    horGap = horRange / horIntervals;
    verRange = height - (border * 2.0f);
    verGap = verRange / verIntervals;
    tick = border * 0.1f;
  }
  
  void drawAxis()
  {
    stroke(0);
    
    // Draw the horizontal axis
    line(border, height - border, width - border, height - border);
    // Draw the vertical axis
    line(border, border , border, height - border);
  
    //draw horizontal ticks
    for (int i = 0; i <= horIntervals; i++)
    {
      float x = border + (i * horGap);
      line(x, height - (border - tick), x, height - border);
    }
  
    //draw vertical ticks
    for (int i = 0; i <= verIntervals; i++)
    {
      float y = (height - border) - (i * verGap);
      line(border - tick, y, border, y);
    }
  }
  
  void drawText(ArrayList<Integer> data, ArrayList<Integer> hor, String verTitle, String mainTitle, boolean barComp)
  {
    fill(0);
    float maxDataValue = calculateMax(data);
    float verDataGap = maxDataValue / verIntervals;
    int horDataGap = hor.size() / horIntervals;
    
    //labels on the vertical axis 
    for (int i = 0 ; i <= verIntervals; i ++)
    {
      float y = (height - border) - (i * verGap);
      int verLabel = (int)verDataGap * i;
  
      textAlign(RIGHT, CENTER);
      textSize(12);
      text(verLabel, border - (tick * 2.0f), y);
    }
    
    //labels on the horizontal axis
    int counter = 0;
    for (int i = 0; i < hor.size(); i += horDataGap)
    {
      float x = border + (counter * horGap);
      int horLabel = hor.get(i);
      counter ++;
      textSize(12);
      textAlign(CENTER);
      //check if it is a comparison bar chart
      if(barComp == false)
      {
        text(horLabel, x, (height - border) + (tick * 3.0f));  //place the labels under the ticks
      }
      else
      {
        text(horLabel, x + (horGap * 0.5f), (height - border) + (tick * 3.0f));  //place the labels between the ticks
      }
    }
    
    //writing the title for the vertical axis turned 90 degrees
    pushMatrix();
    translate(7, height/3);
    textAlign(RIGHT, CENTER);
    textSize(15);
    rotate(-HALF_PI);
    text(verTitle, 0, 0);
    popMatrix();
    
    //writing main title
    fill(0);
    rect(width * 0.33f, height * 0.01f, width * 0.33f, 50);
    fill(#B814F5);
    textSize(30);
    textAlign(CENTER);
    text(mainTitle, width * 0.33f, height * 0.01f, width * 0.33f, 50); 
  }
  
  //calculates the max value of a field
  float calculateMax(ArrayList<Integer> data)
  {
    float max = data.get(0);
    for (int i = 1; i < data.size(); i++)
    {
      if (data.get(i) > max)
      {
        max = data.get(i);
      }
    }
      
    return max;
  }
  
  //calculates the average of a field and draws a line on the graph indicating the average
  void drawAvgLine(ArrayList<Integer> data)
  {
    //calculating the average
    int dataSum = 0;
    float max = calculateMax(data);
    for(int i = 0; i < data.size(); i++)
    {
      dataSum += data.get(i);
    }
    float y = map(dataSum / data.size(), 0, max, height - border, border);
    
    //drawing the line
    stroke(255, 0, 255);
    fill(255, 0, 255);
    line(border, y, width - border, y);
    textSize(10);
    text("Average", border + 20, y - 5);
    stroke(0);
    fill(0);
  }
  
  //highlights the value on the graph and displays the title of the movie
  void highlight(float x1, float y1, float x2, float y2, int pos)
  {
    //check if mouse is on the graph
    if(mouseX > border && mouseX < width - border && mouseY > border && mouseY < height - border)
    {
      //check which point its at
      if(mouseX > x1 && mouseX < x2)
      {
        fill(#FF9E1F);
        ellipse(x1, y1, 15, 15);
        textSize(12);
        text(movies.get(pos).title, x1 + 20, y1 + 20);
      }
    }
  }
  
  //similar to drawText() but used to make the vertical axis split for two graphs
  void drawComparisonText(ArrayList<Integer> data, ArrayList<Integer> data2, ArrayList<Integer> hor, String verTitle, String verTitle2, String mainTitle, boolean barComp)
  {
    fill(0);
    float maxDataValue = calculateMax(data);
    float maxDataValue2 = calculateMax(data2);
    
    float verDataGap = maxDataValue / (verIntervals / 2);
    float verDataGap2 = maxDataValue2 / (verIntervals / 2);
    int horDataGap = hor.size() / horIntervals;
    
    for (int i = 0 ; i <= verIntervals / 2; i ++)
    {
      float y = (height - border) - (i * verGap);
      int verLabel = (int)verDataGap * i;
  
      textAlign(RIGHT, CENTER);
      textSize(12);
      text(verLabel, border - (tick * 2.0f), y);
    }
    int counter = verIntervals / 2;
    int counter2 = 0;
    for (int i = (verIntervals / 2) + 1; i <= verIntervals; i ++)
    {
      float y = (height - border - verGap) - (counter * verGap);
      int verLabel = (int)verDataGap2 * counter2;
  
      textAlign(RIGHT, CENTER);
      textSize(12);
      text(verLabel, border - (tick * 2.0f), y);
      counter++;
      counter2++;
    }
    
    counter = 0;
    for (int i = 0; i < hor.size(); i += horDataGap)
    {
      float x = border + (counter * horGap);
      int horLabel = hor.get(i);
      counter ++;
      textSize(12);
      textAlign(CENTER);
      if(barComp == false)
      {
        text(horLabel, x, (height - border) + (tick * 3.0f));
      }
      else
      {
        text(horLabel, x + (horGap * 0.5f), (height - border) + (tick * 3.0f));
      }
    }
    
    pushMatrix();
    translate(7, height - border - (verRange * 0.5f));
    textAlign(RIGHT, CENTER);
    textSize(15);
    rotate(-HALF_PI);
    text(verTitle, 0, 0);
    text(verTitle2, (verRange * 0.4f), 0);
    popMatrix();
    
    //main title
    fill(0);
    rect(width * 0.33f, height * 0.01f, width * 0.33f, 50);
    fill(#B814F5);
    textSize(30);
    textAlign(CENTER);
    text(mainTitle, width * 0.33f, height * 0.01f, width * 0.33f, 50); 
  }
}
