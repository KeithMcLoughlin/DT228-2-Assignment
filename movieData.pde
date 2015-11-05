//array lists that hold all the different data types
ArrayList<Integer> yearDataset = new ArrayList<Integer>();
ArrayList<String> titleDataset = new ArrayList<String>();
ArrayList<String> genreDataset = new ArrayList<String>();
ArrayList<Integer> runtimeDataset = new ArrayList<Integer>();
ArrayList<Integer> budgetDataset = new ArrayList<Integer>();
ArrayList<Integer> grossDataset = new ArrayList<Integer>();
ArrayList<Integer> criticDataset = new ArrayList<Integer>();
ArrayList<Integer> audienceDataset = new ArrayList<Integer>();

void setup()
{
  size(800, 600);
  background(255);
  
  //load in datasets from files
  loadMovieDetailsData();
  loadGrossData();
  loadRatingData();
}

void draw()
{
  float border = 0.1 * height;
  int horInterval = grossDataset.size(), verInterval = 20;
  float tick = border * 0.1f;
  
  //horizonal axis variables
  float horRange = (width - (border * 2.0f));
  float horGap = horRange / horInterval;
  
  //vertical axis variables
  float verRange = height - (border * 2.0f);
  float verGap = verRange / verInterval;
  
  drawAxis(border, horInterval, verInterval, horRange, horGap, verRange, verGap, tick);
  drawTrendGraph(grossDataset, border);
  drawText(grossDataset, "(in millions)", verInterval, horInterval, border, tick, verGap, horGap, (calculateMax(grossDataset) / 1000000.0f));    //makes the values on the vertical axis in millions 
}

void loadMovieDetailsData()
{
  String[] lines = loadStrings("movieDetails.csv");
  for (String s : lines) 
  {
    //split the data where there are comas
    String[] data = s.split(",");
    
    //loading in years
    int year = Integer.parseInt(data[0]);  //takes in the first column which is years
    yearDataset.add(year);
 
    //loading in titles
    String title = data[1];  //takes in the second column which is titles
    titleDataset.add(title);
    
    //loading in genre
    String genre = data[2];  //takes in the third column which is genre
    genreDataset.add(title);
    
    //loading in runtime
    int runtime = Integer.parseInt(data[3]);  //takes in the fourth column which is runtime
    runtimeDataset.add(runtime);
  }
}

void loadGrossData()
{
  String[] lines = loadStrings("gross.csv");
  for (String s : lines) 
  {
    //split the data where there are comas
    String[] data = s.split(",");
    
    //loading in budget
    int budget = Integer.parseInt(data[0]);  //takes in the first column which is budget
    budgetDataset.add(budget);
 
    //loading in gross
    int gross = Integer.parseInt(data[1]);  //takes in the second column which is gross earnings
    grossDataset.add(gross);
  }
}

void loadRatingData()
{
  String[] lines = loadStrings("rating.csv");
  for (String s : lines) 
  {
    //split the data where there are comas
    String[] data = s.split(",");
    
    //loading in critic rating
    int critic = Integer.parseInt(data[0]);  //takes in the first column which is critic ratings
    criticDataset.add(critic);
 
    //loading in audience rating
    int aud = Integer.parseInt(data[1]);  //takes in the second column which is audience ratings
    audienceDataset.add(aud);
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

void drawTrendGraph(ArrayList<Integer> data, float border)
{
  float maxValue = calculateMax(data);
  
  stroke(255, 0, 0);
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

void drawText(ArrayList<Integer> data, String verTitle, int verticalIntervals, int horizontalIntervals, float border, float tickSize, float verticalGap, float horizontalGap, float maxDataValue)
{
  fill(0);
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
  
  pushMatrix();
  translate(7, height/3);
  textSize(15);
  rotate(-HALF_PI);
  text(verTitle, 0, 0);
  popMatrix();
}
