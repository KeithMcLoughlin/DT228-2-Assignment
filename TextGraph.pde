class TextGraph extends Graph
{
  int budgetSum, grossSum;
  
  TextGraph()
  {
    budgetSum = 0;
    grossSum = 0;
  }
  
  void drawTextGraph(ArrayList<Movie> data)
  {
    StringList genreList = new StringList();
    int counter = 0;
    ArrayList<Integer> budget = new ArrayList<Integer>();
    ArrayList<Integer> gross = new ArrayList<Integer>();
    
    for(int i = 0; i < data.size(); i++)
    {
      if(genreList.hasValue(data.get(i).genre) == false)
      {
        genreList.append(data.get(i).genre);
      }
    }
    
    for(int i = 0; i < genreList.size(); i++)
    {
      budgetSum = 0;
      grossSum = 0;
      counter = 0;
      
      for(int j = 0; j < data.size(); j++)
      {
        if(data.get(j).genre.equals(genreList.get(i)) == true)
        {
          budgetSum += data.get(j).budget;
          grossSum += data.get(j).gross;
          counter++;
        }
      }
      budget.add(budgetSum / counter);
      gross.add(grossSum / counter);
    }
    
    float textGap = height / (genreList.size() + 1);
    int maxSize = 80;
    float ratio = 0;

    switch(graphOption){
    case 1: 
    {
      ratio = maxSize / calculateMax(gross);
      ArrayList<String> genres = sortGenre(genreList, gross);
      for(int i = 0; i < genres.size(); i++)
      {
        textSize(gross.get(i) * ratio);
        if(mouseY > (textGap * i) && mouseY < (textGap * (i+1)))
        {
          textSize(10);
          text("Avg Gross: " + gross.get(i) + " million", mouseX + 10, mouseY);
          textSize(maxSize + 2);
        }
        text(genres.get(i), width / 2, (textGap * i) + 80);
      }
      break;
    }
    case 2:
    {
      ratio = maxSize / calculateMax(budget);
      ArrayList<String> genres = sortGenre(genreList, budget);
      for(int i = 0; i < genres.size(); i++)
      {
        textSize(budget.get(i) * ratio);
        if(mouseY > (textGap * i) && mouseY < (textGap * (i+1)))
        {
          textSize(10);
          text("Avg Budget: " + budget.get(i) + " hundred thousand", mouseX + 10, mouseY);
          textSize(maxSize + 2);
        }
        text(genres.get(i), width / 2, (textGap * i) + 80);
      }
      break;
    }
    }//end switch
  }
  
  ArrayList<String> sortGenre(StringList genre, ArrayList<Integer> data)
  {
    ArrayList<String> genres = new ArrayList<String>();
    int[] g = new int[data.size()];
    int[] temp = new int[data.size()];
    for(int i = 0; i < data.size(); i++)
    {
      temp[i] = data.get(i);
    }
    
    for(int i = 0; i < genre.size(); i++)
    {
      int max = 0;
      for(int j = 0; j < data.size(); j++)
      {
        if(temp[j] >= temp[max])
        {
          max = j;
        }
      }
      g[i] = temp[max];
      genres.add(genre.get(max));
      temp[max] = 0;
    }
    for(int i = 0; i < data.size(); i++)
    {
      data.set(i, g[i]);
    }
    return genres;
  }
}
