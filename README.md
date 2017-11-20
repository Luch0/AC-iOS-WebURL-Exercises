# Web URL Exercises

## Organizing Structure

- Create a Tab Bar Controller.  
- Each Tab in the Tab Bar Controller should be a Navigation Controller
- The Navigation Controller should have a View Controller with a Table View as its Root View Controller
- Each View Controller should have a Search Bar that requests different data when the user hits the search button
- Selecting a cell in the Table View should segue to a Detail View Controller with additional information.

## Parsing Data

- Below are the endpoints to hit.  Use the APIRequestManager from class to turn a URL into raw Data.  Use either Codable or Downcasting to convert the raw Data into your model.


## Exercises

Hit each of the following endpoints and create a new tab with a Table View, a Search Bar and a Detail View Controller using Codable or Downcasting.

1. [Billboard Song API](http://billboard.modulo.site/search/song?q=YOURTERMHERE) - Search for songs with a name matching the search term.
2. [Open Weather API](https://openweathermap.org/) - Search for cities matching a name or zip code
3. [Pokemon Cards](http://api.pokemontcg.io/v1/cards) - Search for Pokemon cards with a name matching the search term.