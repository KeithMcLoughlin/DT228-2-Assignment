//array list that hold all the different data types
ArrayList<Movie> movies = new ArrayList<Movie>();

//variables used for navigating menus
int option, subOption, graphOption;
//store image names
String backImage, graphImage;

Projector p;

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
  p = new Projector(35, 80, 50, 25);
}

void draw()
{ 
  background(255);

  //menu options
  switch(option)
  {
    case 0: {mainScreen(); break;}
    case 1: {option1(); break;}
    case 2: {option2(); break;}
    case 3: {option3(); break;}
  }
}

//loading in the dataset
void loadMovieData()
{
  String[] lines = loadStrings("movie_details.csv");
  for (String s : lines) 
  {
     Movie m = new Movie(s);
     movies.add(m);
  }
}

//the main menu screen
void mainScreen()
{
  String[] options = {"1.Singular Data", "2.Comparisons", "3.Top 10's"};
  Menu mainScreen = new Menu("Main", options, backImage);
  mainScreen.generate();
}

//the singular field option where you can see each field of data as a trend graph, bar chart or area graph
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
      verTitle = "(out of 100)";
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
      verTitle = "(out of 100)";
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
  
  if(subOption != 0)    //checks that one of the options was chosen
  {
    //gets the labels to be displayed on the horizontal axis of the graphs
    ArrayList<Integer> horLabels = new ArrayList<Integer>();
    for(int i = 0; i < movies.size(); i++)
    {
      int m = movies.get(i).year;
      horLabels.add(m);
    }
    
    image(graphBack, 0, 0, width, height);
    switch(graphOption)
    {
      //drawing the trend graph
      case 1: 
      {
        Trend g1 = new Trend();
        g1.drawAxis();
        g1.drawText(data, horLabels, verTitle, mainTitle, false);
        g1.drawTrendGraph(data, color(255, 0, 0));
        g1.drawAvgLine(data);
        break;
      }
      //drawing the bar chart
      case 2: 
      {
        BarChart g1 = new BarChart();
        g1.drawAxis();
        g1.drawText(data, horLabels,  verTitle, mainTitle, false);
        g1.drawBarChart(data, color(0, 0, 255));
        g1.drawAvgLine(data);
        //g1.filmBars(data);
        break;
      }
      //drawing the area
      case 3: 
      {
        Area g1 = new Area();
        g1.drawAxis();
        g1.drawText(data, horLabels,  verTitle, mainTitle, false);
        g1.drawAreaGraph(data, color(0, 255, 0));
        g1.drawAvgLine(data);
        break;
      }
    }//end switch
    
    textSize(15);
    fill(0);
    //display different graph options on the bottom
    text("1.Trend Graph", width * 0.25f, height * 0.99f);
    text("2.Bar Chart", width * 0.5f, height * 0.99f);
    text("3.Area Graph", width * 0.75f, height * 0.99f);
  }//end if
}//end option1()

//the option where you can see many comparisons between the data
void option2()
{
  ArrayList<Integer> data = new ArrayList<Integer>();
  ArrayList<Integer> data2 = new ArrayList<Integer>();
  PImage graphBack = loadImage(graphImage);
  switch(subOption)
  {
    case 0:
    {
      //main menu for this option
      String[] options = {"1.Budget to Gross", "2.Aud to Critic", "3.Genre to B/G", "4.Aud to Runtime"};
      Menu optionScreen = new Menu("Comparisons", options, backImage);
      optionScreen.generate();
      break;
    }
    case 1:
    {
      //does a trend compare graph between gross and budget
      image(graphBack, 0, 0, width, height);
      for(int i = 0; i < movies.size(); i++)
      {
        int b = movies.get(i).budget;
        int g = movies.get(i).gross;
        data.add(b);
        data2.add(g);
      }
      
      ArrayList<Integer> horLabels = new ArrayList<Integer>();
      for(int i = 0; i < movies.size(); i++)
      {
        int m = movies.get(i).year;
        horLabels.add(m);
      }
      
      textSize(15);
      fill(255, 0, 0);
      text("Budget = Red", width * 0.25f, height * 0.99f); 
      fill(0, 0, 255);
      text("Gross = Blue", width * 0.5f, height * 0.99f);
      
      Trend g1 = new Trend(8, 22);
      g1.drawAxis();
      g1.drawComparisonText(data, data2, horLabels, "(in hundred thousands)", "(in millions)", "Budget to Gross", false);
      g1.drawCompTrend(data, data2, color(255, 0, 0), color(0, 0, 255));
      
      break;
    }
    case 2:
    {
      //bar chart compare graph between critic and audience rating where
      //you can choose which group of ten years you want displayed
      image(graphBack, 0, 0, width, height);
      int startYear = 0, endYear = 10;
      
      //each of these keys correspond to a set of ten years e.g case 2 is the 2nd group of ten years
      switch(graphOption)
      {
        case 1: {startYear = 0; endYear = 10; break;}
        case 2: {startYear = 10; endYear = 20; break;}
        case 3: {startYear = 20; endYear = 30; break;}
        case 4: {startYear = 30; endYear = 40; break;}
        case 5: {startYear = 40; endYear = 50; break;}
        case 6: {startYear = 50; endYear = 60; break;}
        case 7: {startYear = 60; endYear = 70; break;}
        case 8: {startYear = 70; endYear = 80; break;}
      }
      
      for(int i = 0; i < movies.size(); i++)
      {
        int b = movies.get(i).criticRating;
        int g = movies.get(i).audienceRating;
        data.add(b);
        data2.add(g);
      }
      
      ArrayList<Integer> horLabels = new ArrayList<Integer>();
      for(int i = startYear; i < endYear; i++)
      {
        int m = movies.get(i).year;
        horLabels.add(m);
      }
      
      //displays which bars correspond to which field
      textSize(15);
      fill(255, 0, 0);
      text("Critic Rating = Red", width * 0.25f, height * 0.99f); 
      fill(0, 255, 0);
      text("Audience Rating = Green", width * 0.5f, height * 0.99f);
      
      //drawing of the bar chart and the comparison bars
      BarChart g1 = new BarChart(startYear, endYear, 10, 10);
      g1.drawAxis();
      g1.drawText(data, horLabels, "(Rating out of 100)", "Critic to Audience", true);
      g1.drawBarChart(data, color(255, 0, 0));
      g1.comparisonBars(data2, color(0, 255, 0));
      break;
    }
    case 3:
    {
      //text graph in relation to genre - budget/gross
      background(#7EF25F);
      TextGraph g1 = new TextGraph();
      g1.drawTextGraph(movies);
      
      break;
    }
    case 4:
    {
      //scatter plot compare the runtime of a movie to the audience rating of it
      image(graphBack, 0, 0, width, height);
      for(int i = 0; i < movies.size(); i++)
      {
        int a = movies.get(i).audienceRating;
        int r = movies.get(i).runtime;
        data.add(a);
        data2.add(r);
      }
      
      int[] labels = new int[movies.size()];  //array used to store all the runtimes to be sorted and used for the horizontal axis labels
      ArrayList<Integer> horLabels = new ArrayList<Integer>();
      for(int i = 0; i < movies.size(); i++)
      {
        labels[i] = movies.get(i).runtime;
      }
      labels = sort(labels);
      for(int i = 0; i < movies.size(); i++)
      {
        int m = labels[i];
        horLabels.add(m);
      }
      
      //drawing the scatter plot graph
      Scatter g1 = new Scatter();
      g1.drawAxis();
      g1.drawText(data, horLabels, "(Rating out of 100)", "Aud to Runtime", false);
      g1.drawScatterPlot(data, data2);
      break;
    }
  }
}

void option3()
{
  ArrayList<Integer> data = new ArrayList<Integer>();
  String field = "";
  
  switch(subOption)
  {
    case 0:
    {
      //main menu for this option
      String[] options = {"1.Budget", "2.Gross", "3.Critic Rating", "4.Audience Rating", "5.Runtime"};
      Menu optionScreen = new Menu("Top 10's", options, backImage);
      optionScreen.generate();
      break;
    }
    case 1:
    {
      //get the budgets for the top 10 list
      for(int i = 0; i < movies.size(); i++)
      {
        int m = movies.get(i).budget;
        data.add(m);
      }
      field = "BUDGET";
      break;
    }
    case 2:
    {
      //get the gross incomes for the top 10 list
      for(int i = 0; i < movies.size(); i++)
      {
        int m = movies.get(i).gross;
        data.add(m);
      }
      field = "GROSS";
      break;
    }
    case 3:
    {
      //get the critic ratings for the top 10 list
      for(int i = 0; i < movies.size(); i++)
      {
        int m = movies.get(i).criticRating;
        data.add(m);
      }
      field = "CRITIC";
      break;
    }
    case 4:
    {
      //get the audience ratings for the top 10 list
      for(int i = 0; i < movies.size(); i++)
      {
        int m = movies.get(i).audienceRating;
        data.add(m);
      }
      field = "AUDIENCE";
      break;
    }
    case 5:
    {
      //get the runtimes for the top 10 list
      for(int i = 0; i < movies.size(); i++)
      {
        int m = movies.get(i).runtime;
        data.add(m);
      }
      field = "RUNTIME";
      break;
    }
  }
  
  if(subOption != 0)    //checks that one of the options were chosen
  {
    background(0);
    p.render();
    p.update();
    //create the top 10 list
    top10Display(data, field);
  }
}

/*checks for where you are in the menus and changes different variables in relation to
  where you are and what key was pressed*/
void keyPressed()
{
    if(option > 0 && subOption == 0)  //for all main menus
    {
      switch(key)
      {
        case '0': {option = 0; break;}
        case '1': {subOption = 1; break;}
        case '2': {subOption = 2; break;}
        case '3': {subOption = 3; break;}
        case '4': {subOption = 4; break;}
        case '5': {subOption = 5; break;}
      }
    }
    if(subOption == 2 && option == 2)  //for decade comparisons
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
    }
    if(subOption != 2 && option == 2)  //for text graphs
    {
      switch(key)
      {
        case '0': {subOption = 0; graphOption = 1; break;}
        case '1': {graphOption = 1; break;}
        case '2': {graphOption = 2; break;}
      }
    }
    if(subOption > 0 && option == 1)  //for changing graph styles
    {
      switch(key)
      {
        case '0': {subOption = 0; graphOption = 1; break;}
        case '1': {graphOption = 1; break;}
        case '2': {graphOption = 2; break;}
        case '3': {graphOption = 3; break;}
      }
    }
    if(subOption > 0 && option == 3)  //for top 10's
    {
      switch(key)
      {
        case '0': {subOption = 0; break;}
      }
    }
    if(option == 0)  //for the main menu screen
    {
      switch(key)
      {
        case '1': {option = 1; break;}
        case '2': {option = 2; break;}
        case '3': {option = 3; break;}
      }
    }
}

void top10Display(ArrayList<Integer> data, String lastField)
{
  int[] pos = calculateOrder(data);  //get the order of the top 10 positions
  float textSpace = width / 6.0f;
  float gap = height / 12.0f;
  String limitString;  //used for titles that are too long and will display a sub string of it
  int limit = 20;
  
  fill(255);
  textAlign(CENTER);
  textSize(20);
  //headings
  text("YEAR", textSpace, gap);
  text("TITLE", textSpace * 2.5, gap);
  text("GENRE", textSpace * 4, gap);
  text(lastField, textSpace * 5, gap);
  
  //checking if the movie title is too long
  for(int i = 0; i < pos.length; i++)
  {
    if((movies.get(pos[i]).title).length() > limit)
    {
      limitString = (movies.get(pos[i]).title).substring(0, limit);
    }
    else
    {
      limitString = movies.get(pos[i]).title;
    }
    
    //displaying the fields of each movie
    text(i+1 + ".", textSpace * 0.5f, gap * (i+2));
    text(movies.get(pos[i]).year, textSpace, gap * (i+2));
    text(limitString, textSpace * 2.5, gap * (i+2));
    text(movies.get(pos[i]).genre, textSpace * 4, gap * (i+2));
    text(data.get(pos[i]), textSpace * 5, gap * (i+2));
  }
}
 
/*used to calculate the order of the top 10 of a particular field*/
int[] calculateOrder(ArrayList<Integer> data)
{
  int[] positions = new int[10];
  int[] temp = new int[data.size()];
  
  //put all of the value in a temp array
  for(int i = 0; i < data.size(); i++)
  {
    temp[i] = data.get(i);
  }
  
  //find each max value
  for(int i = 0; i < 10; i++)
  {
    int max = 0;
    for(int j = 0; j < data.size(); j++)
    {
      if(temp[j] >= temp[max])
      {
        max = j;
      }
    }
    positions[i] = max;
    temp[max] = 0;  //change its value so it will find the next biggest value
  }
  return positions;  //return the positions of where the top 10 elements are
}
