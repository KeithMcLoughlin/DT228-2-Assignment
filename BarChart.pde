class BarChart extends Graph
{
  int startYear;
  int endYear;
  
  BarChart()
  {
    super();
    startYear = 0;
    endYear = 81;
  }
  
  BarChart(int s, int e)
  {
    super();
    startYear = s;
    endYear = e;
  }
  
  void drawBarChart(ArrayList<Integer> data, color c)
  {
    float maxValue = calculateMax(data);
    int intervals = endYear - startYear;
    float rectWidth = (float) horRange / intervals;
    float ratio = verRange / maxValue;
    float x = border;
    
    stroke(0);
    fill(c);
    
    for(int i = startYear; i < endYear; i++)
    {
      rect(x, height - border, rectWidth, -(data.get(i) * ratio));
      x += rectWidth;
    }
  }
  
  void comparisonBars(ArrayList<Integer> data)
  {
    float maxValue = calculateMax(data);
    int intervals = endYear - startYear;
    float rectWidth = (float) (horRange / intervals) / 2;
    float ratio = verRange / maxValue;
    float x = border + (rectWidth/2);
    
    stroke(0);
    fill(255, 0, 0);
    
    for(int i = startYear; i < endYear; i++)
    {
      rect(x, height - border, rectWidth, -(data.get(i) * ratio));
      x += (rectWidth * 2);
    }
  }
}
