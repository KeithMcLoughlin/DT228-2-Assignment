class Trend extends Graph
{
  Trend()
  {
    super(10, 10);
  }
  
  Trend(int hi, int vi)
  {
    super(hi, vi);
  }
  
  void drawTrendGraph(ArrayList<Integer> data, color c)
  {
    float maxValue = calculateMax(data);
    
    stroke(c);
    for (int i = 1; i < data.size(); i++)
    {
      float x1 = map(i-1, 0, data.size(), border, width - border);
      float x2 = map(i, 0, data.size(), border, width - border);
      float y1 = map(data.get(i-1), 0, maxValue, height - border, border);
      float y2 = map(data.get(i), 0, maxValue, height - border, border);
      line(x1, y1, x2, y2);
    }
  }
}
