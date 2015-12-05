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
  p = new Projector(100, 100);
}

void draw()
{ 
  background(255);

  switch(option)
  {
    case 0: {mainScreen(); break;}
    case 1: {option1(); break;}
    //case 2: {option2(); break;}
    //case 3: {option3(); break;}
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
        g1.drawText(data, horLabels, verTitle, mainTitle);
        g1.drawTrendGraph(data, color(255, 0, 0));
        break;
      }
      //drawing the bar chart
      case 2: 
      {
        BarChart g1 = new BarChart();
        g1.drawAxis();
        g1.drawText(data, horLabels,  verTitle, mainTitle);
        g1.drawBarChart(data, color(0, 0, 255));
        //g1.filmBars(data);
        break;
      }
      //drawing the area
      case 3: 
      {
        Area g1 = new Area();
        g1.drawAxis();
        g1.drawText(data, horLabels,  verTitle, mainTitle);
        g1.drawAreaGraph(data, color(0, 255, 0));
        break;
      }
    }//end switch
    textSize(15);
    fill(0);
    text("1.Trend Graph", width * 0.25f, height * 0.99f);
    text("2.Bar Chart", width * 0.5f, height * 0.99f);
    text("3.Area Graph", width * 0.75f, height * 0.99f);
  }//end if
}//end option1()
/*
//the option where you can see many comparisons between the data
void option2()
{
  ArrayList<Integer> data = new ArrayList<Integer>();
  ArrayList<Integer> data2 = new ArrayList<Integer>();
  switch(subOption)
  {
    case 0:
    {
      String[] options = {"1.Budget to Gross", "2.Audience to Critic", "3.Genre to Budget/Gross", "4.Audience to Runtime"};
      Menu optionScreen = new Menu("Comparisons", options, backImage);
      optionScreen.generate();
      break;
    }
    case 1:
    {
      for(int i = 0; i < movies.size(); i++)
      {
        int b = movies.get(i).budget;
        int g = movies.get(i).gross;
        data.add(b);
        data2.add(g);
      }
      Trend g1 = new Trend();
      g1.drawAxis();
      g1.drawText(data, "(in millions)", "Budget to Gross");
      g1.drawTrendGraph(data, color(255, 0, 0));
      g1.drawTrendGraph(data2, color(0, 0, 255));
      
      break;
    }
    case 2:
    {
      int startYear = 0, endYear = 10;
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
      BarChart g1 = new BarChart(startYear, endYear);
      g1.drawAxis();
      g1.drawText(data, "(Rating out of 100)", "Critic to Audience");
      g1.drawBarChart(data, color(255, 0, 0));
      g1.comparisonBars(data2, color(0, 255, 0));
      break;
    }
    case 3:
    {
      p.render();
      p.update();
      
      break;
    }
    case 4:
    {
      background(255);
      
      break;
    }
  }
}
*//*
void option3()
{
  ArrayList<Integer> data = new ArrayList<Integer>();
  String field = "";
  
  switch(subOption)
  {
    case 0:
    {
      String[] options = {"1.Budget", "2.Gross", "3.Critic Rating", "4.Audience Rating", "5.Runtime"};
      Menu optionScreen = new Menu("Top 10's", options, backImage);
      optionScreen.generate();
      break;
    }
    case 1:
    {
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
    //image(graphBack, 0, 0, width, height);
    background(0);
    top10Display(data, field);
  }
}
*/
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
    if(subOption > 0 && option == 2)  //for decade comparisons
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
    if(subOption > 0 && option == 3)
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

void top10Display(ArrayList<Integer> data, String lastField)
{
  int[] pos = calculateOrder(data);
  float textSpace = width / 6.0f;
  float gap = height / 12.0f;
  String limitString;
  int limit = 20;
  
  fill(255);
  textAlign(CENTER);
  textSize(20);
  text("YEAR", textSpace, gap);
  text("TITLE", textSpace * 2.5, gap);
  text("GENRE", textSpace * 4, gap);
  text(lastField, textSpace * 5, gap);
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
    
    text(movies.get(pos[i]).year, textSpace, gap * (i+2));
    text(limitString, textSpace * 2.5, gap * (i+2));
    text(movies.get(pos[i]).genre, textSpace * 4, gap * (i+2));
    text(data.get(pos[i]), textSpace * 5, gap * (i+2));
  }
}
 
int[] calculateOrder(ArrayList<Integer> data)
{
  int[] positions = new int[10];
  int[] temp = new int[data.size()];
  for(int i = 0; i < data.size(); i++)
  {
    temp[i] = data.get(i);
  }
  
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
  return positions;
}
