//array list that hold all the different data types
ArrayList<Movie> movies = new ArrayList<Movie>();

//variables used for navigating menus
int option, subOption, graphOption;
//store image names
String backImage, graphImage;

void setup()
{
  size(800, 600);
  background(255);
  
  //load in datasets from files
  loadMovieData();
  
  option = 0;
  subOption = 0;
  graphOption = 1;
  backImage = "menuBackground.jpg";
  graphImage = "graphBackground.jpg";
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
  String[] options = {"1.Barchart", "2.Trend", "3.Area"};
  Menu mainScreen = new Menu("Main", options, backImage);
  mainScreen.generate();
}

//the singular field options where you can see each field of data as a trend graph, bar chart or area graph
void option1()
{
  PImage graphBack = loadImage(graphImage);
  ArrayList<Integer> data = new ArrayList<Integer>();
  String verTitle = "", mainTitle = "";
  
  switch(subOption)
  {
    //main menu for this option
    case 0:
    {
      String[] options = {"1.Budget", "2.Gross", "3.Critic", "4.Audience", "5.Runtime"};
      Menu optionScreen = new Menu("Single Aspects", options, backImage);
      optionScreen.generate();
      break;
    }
    //the budget field option
    case 1:
    {
      for(int i = 0; i < movies.size(); i++)
      {
        int m = movies.get(i).budget;
        data.add(m);
      }
      verTitle = "(in hundred thousands)";
      mainTitle = "Budget";
      break;
    }
    //the gross income field option
    case 2:
    {
      for(int i = 0; i < movies.size(); i++)
      {
        int m = movies.get(i).gross;
        data.add(m);
      }
      verTitle = "(in millions)";
      mainTitle = "Gross";
      break;
    }
    //the critic rating field option
    case 3:
    {    
      for(int i = 0; i < movies.size(); i++)
      {
        int m = movies.get(i).criticRating;
        data.add(m);
      }
      mainTitle = "Critic Rating";
      break;
    }
    //the audience rating field option
    case 4:
    {    
      for(int i = 0; i < movies.size(); i++)
      {
        int m = movies.get(i).audienceRating;
        data.add(m);
      }
      mainTitle = "Audience Rating";
      break;
    }
    //the runtime field option
    case 5:
    {    
      for(int i = 0; i < movies.size(); i++)
      {
        int m = movies.get(i).runtime;
        data.add(m);
      }
      verTitle = "(in minutes)";
      mainTitle = "Runtime";
      break;
    }
  }//end switch
  
  if(subOption != 0)    //checks that one of the options were chosen
  {
    image(graphBack, 0, 0, width, height);
    switch(graphOption)
    {
      //drawing the trend graph
      case 1: 
      {
        Trend g1 = new Trend();
        g1.drawAxis();
        g1.drawText(data, verTitle, mainTitle);
        g1.drawTrendGraph(data, color(255, 0, 0));
        break;
      }
      //drawing the bar chart
      case 2: 
      {
        BarChart g1 = new BarChart();
        g1.drawAxis();
        g1.drawText(data, verTitle, mainTitle);
        g1.drawBarChart(data, color(255, 0, 0));
        break;
      }
      //drawing the area
      case 3: 
      {
        //area graph will go here
        break;
      }
    }//end switch
  }//end if
}//end option1()

void option2()
{
  switch(subOption)
  {
    case 0:
    {
      String[] options = {"1.Gross", "2.Budget"};
      Menu optionScreen = new Menu("TrendGraphs", options, backImage);
      optionScreen.generate();
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
      
      Trend g1 = new Trend();
      g1.drawAxis();
      g1.drawText(data, "(in millions)", "gross");
      g1.drawTrendGraph(data, color(255, 0, 0));
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
      
      Trend g1 = new Trend();
      g1.drawAxis();
      g1.drawText(data, "(in hundred thousands)", "budget");
      g1.drawTrendGraph(data, color(255, 0, 0));
      break;
    }
  }
  /*switch(graphOption)
      {
        case 1: {startYear = 0; endYear = 10; break;}
        case 2: {startYear = 11; endYear = 20; break;}
        case 3: {startYear = 21; endYear = 30; break;}
        case 4: {startYear = 31; endYear = 40; break;}
        case 5: {startYear = 41; endYear = 50; break;}
        case 6: {startYear = 51; endYear = 60; break;}
        case 7: {startYear = 61; endYear = 70; break;}
        case 8: {startYear = 71; endYear = 80; break;}
      }*/
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
        case '4': {subOption = 4; break;}
        case '5': {subOption = 5; break;}
        case '6': {subOption = 6; break;}
      }
    }
    /*if(subOption > 0 && option == 2)  //for decade comparisons
    {
      switch(key)
      {
        case '0': {subOption = 0; graphOption = 1; break;}
        case '1': {graphOption = 1; break;}
        case '2': {graphOption = 2; break;}
        case '3': {graphOption = 3; break;}
        case '4': {graphOption = 4; break;}
        case '5': {graphOption = 5; break;}
        case '6': {graphOption = 6; break;}
        case '7': {graphOption = 7; break;}
        case '8': {graphOption = 8; break;}
      }
    }*/
    if(subOption > 0 && option == 1)  //for changing graph styles
    {
      switch(key)
      {
        case '0': {subOption = 0; graphOption = 1; break;}
        case '1': {graphOption = 1; break;}
        case '2': {graphOption = 2; break;}
        //case '3': {graphOption = 3; break;}
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
