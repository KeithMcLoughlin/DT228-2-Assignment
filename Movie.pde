class Movie
{
  //fields
  int year;
  String title;
  String genre;
  int budget;
  int gross;
  int runtime;
  int criticRating;
  int audienceRating;
  
  //paramiterised constructor
  Movie(String line)
  {
    String[] fields = line.split(",");
    
    year = Integer.parseInt(fields[0]);
    title = fields[1];
    genre = fields[2];
    budget = (Integer.parseInt(fields[3])) / 100000;  //in one hundred thousands
    gross = (int)((Long.parseLong(fields[4])) / 1000000);  //must read it in as a long, then convert it into number of millions and make it an int 
    runtime = Integer.parseInt(fields[5]);
    criticRating = Integer.parseInt(fields[6]);
    audienceRating = Integer.parseInt(fields[7]);
  }
}
