import 'package:the_movie_box/core/client/api_client.dart';
import 'package:the_movie_box/core/config/api_config.dart';
import 'package:the_movie_box/data/model/movie_details.dart';
import 'package:the_movie_box/data/model/movie_model.dart';
import 'package:the_movie_box/main.dart';

class MovieRepository {
  MovieRepository();
  final apiClient = getIt<ApiClient>();
  Future<List<Show>> fetchMovieResults({
    int page = 1,
  }) async {
    try {
      List<Show> movieMovieResultList = [];
      var body = {
        "include_adult": false,
        "include_video": false,
        "language": "en-US",
        "page": page,
        "sort_by": "popularity.desc"
      };
      final res = await apiClient.get(APIEndPoint.discoverMovies,
          queryParameters: body);
      res.data['results']
          .map((e) => movieMovieResultList.add(Show.fromJson(e)))
          .toList();
      return movieMovieResultList;
    } catch (e) {
      rethrow;
    }
  }

  Future<MovieDetails> fetchMovieDetails(int movieID) async {
    try {
      var body = {"language": "en-US"};
      final res = await apiClient.get("${APIEndPoint.movieDetails}/$movieID",
          queryParameters: body);
      return MovieDetails.fromJson(res.data);
    } catch (e) {
      rethrow;
    }
  }
}
