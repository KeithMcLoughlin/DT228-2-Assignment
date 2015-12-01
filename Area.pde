class Area extends Graph
{
  Area()
  {
    super();
  }
  
  void drawAreaGraph(ArrayList<Integer> data, color c)
  {
    float maxValue = calculateMax(data);
    fill(c);
    beginShape();
    vertex(border + 1, height - border - 1);
    
    stroke(c);
    for (int i = 0; i < data.size(); i++)
    {
      float x = map(i, 0, data.size(), border, width - border);
      float y = map(data.get(i), 0, maxValue, height - border, border);
      vertex(x, y);
    }
    
    vertex(width - border, height - border - 1);
    endShape(CLOSE);
  }
}
