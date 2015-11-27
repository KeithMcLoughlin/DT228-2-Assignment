//array list that hold all the different data types
ArrayList<Movie> movies = new ArrayList<Movie>();

void setup()
{
  size(800, 600);
  background(255);
  
  //load in datasets from files
  loadMovieData();
}

void draw()
{
  float border = 0.1 * height;
  int horInterval = movies.size(), verInterval = 10;
  float tick = border * 0.1f;
  
  //horizonal axis variables
  float horRange = (width - (border * 2.0f));
  float horGap = horRange / horInterval;
  
  //vertical axis variables
  float verRange = height - (border * 2.0f);
  float verGap = verRange / verInterval;
  
  ArrayList<Integer> data = new ArrayList<Integer>();
  for(int i = 0; i < movies.size(); i++)
  {
    int m = movies.get(i).gross;
    data.add(m);
  }
  
  drawAxis(border, horInterval, verInterval, horRange, horGap, verRange, verGap, tick);
  drawTrendGraph(data, border, color(255, 0, 0));
  drawText(data, "(in millions)", "Movie Titles", verInterval, horInterval, border, tick, verGap, horGap); 
}

void loadMovieData()
{
  String[] lines = loadStrings("movie_details.csv");
  for (String s : lines) 
  {
     Movie m = new Movie(s);
     movies.add(m);
  }
}

void drawAxis(float border, int horizontalIntervals, int verticalIntervals, float horizontalRange, float horizontalGap, float verticalRange, float verticalGap, float tickSize)
{
  stroke(0);

  // Draw the horizontal axis
  line(border, height - border, width - border, height - border);
  // Draw the vertical axis
  line(border, border , border, height - border);

  //draw horizontal ticks
  for (int i = 0; i <= horizontalIntervals; i++)
  {
    float x = border + (i * horizontalGap);
    line(x, height - (border - tickSize), x, height - border);
  }

  //draw vertical ticks
  for (int i = 0; i <= verticalIntervals; i++)
  {
    float y = (height - border) - (i * verticalGap);
    line(border - tickSize, y, border, y);
  }
}

void drawTrendGraph(ArrayList<Integer> data, float border, color c)
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

void drawText(ArrayList<Integer> data, String verTitle, String horTitle, int verticalIntervals, int horizontalIntervals, float border, float tickSize, float verticalGap, float horizontalGap)
{
  fill(0);
  float maxDataValue = calculateMax(data);
  float verticalDataGap = maxDataValue / verticalIntervals;
  
  for (int i = 0 ; i <= verticalIntervals ; i ++)
  {
    float y = (height - border) - (i * verticalGap);
    int verLabel = (int)verticalDataGap * i;

    textAlign(RIGHT, CENTER);
    textSize(12);
    text(verLabel, border - (tickSize * 2.0f), y);
  }
  
  for (int i = 0 ; i <=  horizontalIntervals; i ++)
  {
    float x = border + (i * horizontalGap);
    float horLabel = height - (border * 0.5f);
  }
  
  text(horTitle, width * 0.5f, height - (border * 0.5f));
  pushMatrix();
  translate(7, height/3);
  textSize(15);
  rotate(-HALF_PI);
  text(verTitle, 0, 0);
  popMatrix();
}
