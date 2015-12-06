class TextGraph extends Graph
{
  /*int budgetSum, grossSum;
  
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
    
    float textGap = height / genreList.size() + 1;
    int maxSize = 80;
    float ratio = maxSize / calculateMax(gross);
    
    for(int i = 0; i < genreList.size(); i++)
    {
      textSize(gross.get(i) * ratio);
      println(gross.get(i) * ratio);
      text(genreList.get(i), width / 2, (textGap * i) + 10);
    }
  }
  
  void sortGenre(StringList genre, ArrayList gross)
  {
    int temp = 0;
    ArrayList<String> genres = new ArrayList<String>();
    
    for(int i = 0; i < genre.size(); i++)
    {
      int max = i;
      for(int j = i + 1; j < genre.size(); j++)
      {
        if(gross.get(j) > gross.get(max))
        {
          max = j;
        }
      }
      temp = gross.get(i);
      gross.set(i, gross.get(max));
      gross.set(max, temp);
      genres.add(genre.get(max));
    }
  }*/
}
