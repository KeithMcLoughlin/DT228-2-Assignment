class Scatter extends Graph
{
  Scatter()
  {
    super();
  }
  
  void drawScatterPlot(ArrayList<Integer> verField, ArrayList<Integer> horField)
  {
    int cirSize = 5;
    float horMax = calculateMax(horField);
    float verMax = calculateMax(verField);
    
    for(int i = 0; i < verField.size(); i ++)
    {
      float x = map(horField.get(i), 70, horMax, border, width - border);
      float y = map(verField.get(i), 0, verMax, height - border, border);
      ellipse(x, y, cirSize, cirSize);
    }
  }
}
