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
}
