/*class TextGraph
{
  void drawTextGraph(ArrayList<Movie> data)
  {
    StringList genreList = new StringList();
    int budgetSum = 0, grossSum = 0;
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
        if(data.get(i).genre == genreList.get(i))
        {
          budgetSum += data.get(i).budget;
          grossSum += data.get(i).gross;
          counter++;
        }
      }
      budget.add(budgetSum / counter);
      gross.add(grossSum / counter);
    }
    
    float textGap = height / genreList.size();
    int maxSize = 50;
    for(int i = 0; i < genreList.size(); i++)
    {
      
      text(genreList.get(i), 10, (textGap * i) + 10);
    }
  }
}*/
