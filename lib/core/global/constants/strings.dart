 


import 'package:sof/data/model/movie_model.dart';

/// The following values are set to be globally accessed.
/// The movieList will contain the list of movies gotten from
/// the Movie Database Function
List<Movie> movieList = [];
List<Movie> favoriteMovieList = [];

/// The String table is the name of the movie
/// stored in the local database
const String movieTable = 'movies';

class ApiPath {
  static const String endpoint = 'https://wookie.codesubmit.io/movies';
  static const String authorization = 'Bearer Wookie2021';
  static const String tempImage = 'https://turkcealtyazi.org/images/poster/6285944.jpg';
}

/// The Class UiText provides Strings in case
/// Local Lang. Localization is implemented the strings can easily be accessed
//
class UiText {
  static const String buttonBookmarkAdd = 'Add to bookmark';
  static const String buttonBookmarkAddedToBm = 'Added to bookmark';
  static const String buttonBmRemove = 'Remove from bookmark';
  static const String buttonFromBmRemove = 'From bookmark removed';
  static const String appTitle = 'SOF';
  static const String userTitle = 'Users';
  static const String bookmarkTitle = 'Bookmarks';
}

