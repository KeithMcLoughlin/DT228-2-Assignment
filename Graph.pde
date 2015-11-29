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
    border = width * 0.1f;
    horIntervals = 10;
    verIntervals = 10;
    horRange = (width - (border * 2.0f));
    horGap = horRange / horIntervals;
    verRange = height - (border * 2.0f);
    verGap = verRange / verIntervals;
    tick = border * 0.1f;
  }
  
  Graph(int hi, int vi)
  {
    border = width * 0.1f;
    horIntervals = hi;
    verIntervals = vi;
    horRange = (width - (border * 2.0f));
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
  
  void drawText(ArrayList<Integer> data, String verTitle, String mainTitle)
  {
    fill(0);
    float maxDataValue = calculateMax(data);
    float verDataGap = maxDataValue / verIntervals;
    
    for (int i = 0 ; i <= verIntervals ; i ++)
    {
      float y = (height - border) - (i * verGap);
      int verLabel = (int)verDataGap * i;
  
      textAlign(RIGHT, CENTER);
      textSize(12);
      text(verLabel, border - (tick * 2.0f), y);
    }
    
    for (int i = 0 ; i <=  horIntervals; i ++)
    {
      float x = border + (i * horGap);
      float horLabel = height - (border * 0.5f);
    }
    
    pushMatrix();
    translate(7, height/3);
    textSize(15);
    rotate(-HALF_PI);
    text(verTitle, 0, 0);
    popMatrix();
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
}
