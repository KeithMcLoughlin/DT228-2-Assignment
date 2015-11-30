//array list that hold all the different data types
ArrayList<Movie> movies = new ArrayList<Movie>();
int option, subOption;
void setup()
{
  size(800, 600);
  background(255);
  
  //load in datasets from files
  loadMovieData();
  
  option = 0;
  subOption = 0;
}

void draw()
{ 
  background(255);

  switch(option)
  {
    case 0: {mainScreen(); break;}
    case 1: {option1(); break;}
    case 2: {option2(); break;}
  }
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

void mainScreen()
{
  String[] options = {"1.Barchart", "2.Trend"};
  Menu mainScreen = new Menu("Main", options, "menuBackground.jpg");
  mainScreen.generate();
}

void option1()
{
  switch(subOption)
  {
    case 0:
    {
      background(0);
      text("Option1", 100, 50);
      text("1.Gross", 100, 100);
      text("2.Budget", 100, 150);
      break;
    }
    case 1:
    {
      background(255);
      ArrayList<Integer> data = new ArrayList<Integer>();
      for(int i = 0; i < movies.size(); i++)
      {
        int m = movies.get(i).gross;
        data.add(m);
      }
      
      BarChart g1 = new BarChart();
      g1.drawAxis();
      g1.drawText(data, "(in millions)", "gross");
      g1.drawBarChart(data, 0, 70, color(255, 0, 0));
      break;
    }
    case 2:
    {
      background(255);
      ArrayList<Integer> data = new ArrayList<Integer>();
      for(int i = 0; i < movies.size(); i++)
      {
        int m = movies.get(i).budget;
        data.add(m);
      }
      
      BarChart g1 = new BarChart();
      g1.drawAxis();
      g1.drawText(data, "(in hundred thousands)", "budget");
      g1.drawBarChart(data, 0, 70, color(255, 0, 0));
      break;
    }
  }
}

void option2()
{
  background(255);
  ArrayList<Integer> data = new ArrayList<Integer>();
  for(int i = 0; i < movies.size(); i++)
  {
    int m = movies.get(i).gross;
    data.add(m);
  }
  
  Trend g1 = new Trend();
  g1.drawAxis();
  g1.drawText(data, "(in millions)", "gross");
  g1.drawTrendGraph(data, color(255, 0, 0));
}

void keyPressed()
{
    if(option > 0 && subOption == 0)
    {
      switch(key)
      {
        case '0': {option = 0; break;}
        case '1': {subOption = 1; break;}
        case '2': {subOption = 2; break;}
        case '3': {subOption = 3; break;}
      }
    }
    if(subOption > 0)
    {
      switch(key)
      {
        case '0': {subOption = 0; break;}
      }
    }
    if(option == 0)
    {
      switch(key)
      {
        case '1': {option = 1; break;}
        case '2': {option = 2; break;}
        case '3': {option = 3; break;}
      }
    }
}
