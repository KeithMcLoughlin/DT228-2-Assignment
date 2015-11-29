class BarChart extends Graph
{
  BarChart()
  {
    super();
  }
  
  void drawBarChart(ArrayList<Integer> data, int startYear, int endYear, color c)
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
  
  /*void comparisonBars(ArrayList<Integer> data, int startYear, int endYear)
  {
    float maxValue = calculateMax(data);
    int intervals = endYear - startYear;
    float rectWidth = (float) (horizontalRange / intervals) / 2;
    float ratio = verticalRange / maxValue;
    float x = border + (rectWidth/2);
    
    stroke(0);
    fill(255, 0, 0);
    
    for(int i = startYear; i < endYear; i++)
    {
      rect(x, height - border, rectWidth, -(data.get(i) * ratio));
      x += (rectWidth * 2);
    }
  }*/
}