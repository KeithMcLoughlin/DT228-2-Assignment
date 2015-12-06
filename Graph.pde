class Graph
{
  float border;
  int horIntervals;
  int verIntervals;
  float horRange;
  float horGap;
  float verRange;
  float verGap;
  float tick;
  
  Graph()
  {
   this(8, 10);
  }
  
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
    
    for (int i = 0 ; i <= verIntervals; i ++)
    {
      float y = (height - border) - (i * verGap);
      int verLabel = (int)verDataGap * i;
  
      textAlign(RIGHT, CENTER);
      textSize(12);
      text(verLabel, border - (tick * 2.0f), y);
    }
    int counter = 0;
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
    translate(7, height/3);
    textAlign(RIGHT, CENTER);
    textSize(15);
    rotate(-HALF_PI);
    text(verTitle, 0, 0);
    popMatrix();
    
    //main title
    fill(0);
    rect(width * 0.33f, height * 0.01f, width * 0.33f, 50);
    fill(#B814F5);
    textSize(30);
    textAlign(CENTER);
    text(mainTitle, width * 0.33f, height * 0.01f, width * 0.33f, 50); 
  }
  
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
  
  void drawAvgLine(ArrayList<Integer> data)
  {
    int dataSum = 0;
    float max = calculateMax(data);
    for(int i = 0; i < data.size(); i++)
    {
      dataSum += data.get(i);
    }
    float y = map(dataSum / data.size(), 0, max, height - border, border);
    stroke(255, 0, 255);
    fill(255, 0, 255);
    line(border, y, width - border, y);
    textSize(10);
    text("Average", border + 20, y - 5);
    stroke(0);
    fill(0);
  }
  
  void highlight(float x1, float y1, float x2, float y2, int pos)
  {
    if(mouseX > border && mouseX < width - border && mouseY > border && mouseY < height - border)
    {
      if(mouseX > x1 && mouseX < x2)
      {
        fill(#FF9E1F);
        ellipse(x1, y1, 15, 15);
        textSize(12);
        text(movies.get(pos).title, x1 + 20, y1 + 20);
      }
    }
  }
  
}
