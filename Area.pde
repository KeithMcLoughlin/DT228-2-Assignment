class Area extends Graph
{
  //default constructor
  Area()
  {
    super();
  }
  
  void drawAreaGraph(ArrayList<Integer> data, color c)
  {
    float maxValue = calculateMax(data);
    fill(c);
    beginShape();  //this shape will be used as the fill of the area graph
    vertex(border + 1, height - border - 1);  //the first vertex will be the left bottom corner of the graph
    
    stroke(0);
    //calculate the vertex in relation to the data on the graph
    for (int i = 1; i < data.size(); i++)
    {
      float x = map(i, 0, data.size(), border, width - border);
      float y = map(data.get(i), 0, maxValue, height - border, border);
      vertex(x, y);
    }
    
    vertex(width - border, height - border - 1);  //the last vertex will be the right bottom corner of the graph
    endShape(CLOSE);
  }
}
