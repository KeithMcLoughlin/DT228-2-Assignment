class BarChart extends Graph
{
  //fields
  int startYear;
  int endYear;
  
  //default constructor
  BarChart()
  {
    this(0, 81, 8, 10);
  }
  
  //parameterised constructor (which takes in start an end years of data)
  BarChart(int s, int e, int hor, int ver)
  {
    super(hor, ver);
    startYear = s;
    endYear = e;
  }
  
  //function that draws the bars of the bar chart
  void drawBarChart(ArrayList<Integer> data, color c)
  {
    float maxValue = calculateMax(data);
    int intervals = endYear - startYear;   //number of intervals on the bottom axis
    float rectWidth = (float) horRange / intervals;
    float ratio = verRange / maxValue;
    float x = border;
    
    stroke(0);
    fill(c);
    
    //the draww of the bars
    for(int i = startYear; i < endYear; i++)
    {
      rect(x, height - border, rectWidth, -(data.get(i) * ratio));
      x += rectWidth;
    }
  }
  
  //function to draw the second set of bars for making comparisons
  void comparisonBars(ArrayList<Integer> data, color c)
  {
    float maxValue = calculateMax(data);
    int intervals = endYear - startYear;
    float rectWidth = (float) (horRange / intervals) / 2;
    float ratio = verRange / maxValue;
    float x = border + (rectWidth/2);
    
    stroke(0);
    fill(c);
    
    for(int i = startYear; i < endYear; i++)
    {
      rect(x, height - border, rectWidth, -(data.get(i) * ratio));
      x += (rectWidth * 2);
    }
  }
}
