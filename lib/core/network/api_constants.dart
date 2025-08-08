class ApiConstants {
  const ApiConstants._();
  static const String apiBaseUrl = 'https://api.themoviedb.org/3/';
  static const String imageBaseUrl = 'https://image.tmdb.org/t/p/w500/';
  static const String apiNowPlayingMovies = 'movie/now_playing';
  static const String apiPopularMovies = 'movie/popular';
  static const String apiTopRatedMovies = 'movie/top_rated';
  static const String apiMovieSimilar = 'movie/{movie_id}/similar';
  static const String apiMovieRecommendations =
      'movie/{movie_id}/recommendations';
  static const String apiUpcomingMovies = 'movie/upcoming';
  static const String apiMovieDetails = 'movie/{movie_id}';
  static const String apiSearchMovies = 'search/movie';
    static String imageUrl(String s) {
    return "https://image.tmdb.org/t/p/w500$s";
  }
  static const String apiAiringTodayTvShows = 'tv/airing_today';
  static const String apiPopularTvShows = 'tv/popular';
  static const String apiTopRatedTvShows = 'tv/top_rated';
  static const String apiTvShowDetails = 'tv/{tv_show_id}';
  static const String apiTvShowSimilar = 'tv/{tv_show_id}/similar';
  static const String apiTvShowRecommendations = 'tv/{tv_show_id}/recommendations';
}

class ApiErrors {
  static const String networkError = 'Network error';
  static const String unauthorizedError = 'Unauthorized access';
  static const String notFoundError = 'Resource not found';
  static const String serverError = 'Server error';
  static const String unknownError = 'An unknown error occurred';
  static const String timeoutError = 'Request timed out';
  static const String badRequestError = 'Bad request';
  static const String forbiddenError = 'Forbidden access';
}
