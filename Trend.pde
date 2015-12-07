class Trend extends Graph
{
  //default constructor
  Trend()
  {
    super(8, 10);
  }
  
  //parameterised constructor (takes in the number of horizontal and vertical intervals for the graph)
  Trend(int hi, int vi)
  {
    super(hi, vi);
  }
  
  //function which draws the trend lines of the trend graph
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
      highlight(x1, y1, x2, y2, i - 1);
    }
    
    //allow for the last data element to be highlighted
    float x1 = map(data.size() - 1, 0, data.size(), border, width - border);
    float x2 = width;
    float y1 = map(data.get(data.size() - 1), 0, maxValue, height - border, border);
    float y2 = height - border;
    highlight(x1, y1, x2, y2, data.size() - 1);
  }
  
  //draws two trend graph, one on the top half of the graph and the other on the bottom half
  void drawCompTrend(ArrayList<Integer> data, ArrayList<Integer> data2, color c1, color c2)
  {
    float maxValue1 = calculateMax(data);
    float maxValue2 = calculateMax(data2);
    
    stroke(c1);
    for (int i = 1; i < data.size(); i++)
    {
      float x1 = map(i-1, 0, data.size(), border, width - border);
      float x2 = map(i, 0, data.size(), border, width - border);
      float y1 = map(data.get(i-1), 0, maxValue1, height - border, border + verRange * 0.5f);
      float y2 = map(data.get(i), 0, maxValue1, height - border, border + verRange * 0.5f);
      line(x1, y1, x2, y2);
      highlight(x1, y1, x2, y2, i - 1);
    }
    
    //allow for the last data element to be highlighted
    float x1 = map(data.size() - 1, 0, data.size(), border, width - border);
    float x2 = width;
    float y1 = map(data.get(data.size() - 1), 0, maxValue1, height - border, border + verRange * 0.5f);
    float y2 = height - border;
    highlight(x1, y1, x2, y2, data.size() - 1);
    
    stroke(c2);
    for (int i = 1; i < data2.size(); i++)
    {
      x1 = map(i-1, 0, data2.size(), border, width - border);
      x2 = map(i, 0, data2.size(), border, width - border);
      y1 = map(data2.get(i-1), 0, maxValue2, height - border - verRange * 0.5f - verGap, border);
      y2 = map(data2.get(i), 0, maxValue2, height - border - verRange * 0.5f - verGap, border);
      line(x1, y1, x2, y2);
      highlight(x1, y1, x2, y2, i - 1);
    }
    
    //allow for the last data element to be highlighted
    x1 = map(data2.size() - 1, 0, data2.size(), border, width - border);
    x2 = width;
    y1 = map(data2.get(data2.size() - 1), 0, maxValue2, height - border - verRange * 0.5f - verGap, border);
    y2 = height - border;
    highlight(x1, y1, x2, y2, data2.size() - 1);
  }
}
