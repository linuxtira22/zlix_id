import 'package:zlix_id/data/repositories/movie_repository.dart';
import 'package:zlix_id/domain/entities/actor.dart';
import 'package:zlix_id/domain/entities/movie.dart';
import 'package:zlix_id/domain/entities/movie_detail.dart';
import 'package:zlix_id/domain/entities/result.dart';
import 'package:dio/dio.dart';

class TmdbMovieRepository implements MovieRepository {
  final Dio? _dio;
  final String _accessToken =
      "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlMDJhMDJjZTQwMzY1OWQ1Njk3MzI0NTdhMGUyODlmMiIsIm5iZiI6MTcyNDQxMzcxNy4zNzksInN1YiI6IjY2Yzg3NzE1NmU2YmVlZjU2MmVhZDZmNSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.7vZH1oeB9JnXsW3XDf3IPZHPS_0CkgpYUbaYZ0bDfUg";

  late final Options _options = Options(headers: {
    'Authorization': 'Bearer $_accessToken',
    'accept': 'application/json'
  });

  TmdbMovieRepository({Dio? dio}) : _dio = dio ?? Dio();

  @override
  Future<Result<List<Actor>>> getActors({required int id}) async {
    try {
      final response = await _dio!.get(
          'https://api.themoviedb.org/3/movie/$id/credits?language=en-US',
          options: _options);
      final results = List<Map<String, dynamic>>.from(response.data['cast']);

      return Result.success(results.map((e) => Actor.fromJSON(e)).toList());
    } on DioException catch (e) {
      return Result.failed('${e.message}');
    }
  }

  @override
  Future<Result<MovieDetail>> getDetail({required int id}) async {
    try {
      final response = await _dio!.get(
          'https://api.themoviedb.org/3/movie/$id?language=en-US',
          options: _options);

      return Result.success(MovieDetail.fromJSON(response.data));
    } on DioException catch (e) {
      return Result.failed('${e.message}');
    }
  }

  @override
  Future<Result<List<Movie>>> getNowPlaying({int page = 1}) async =>
      _getMovies(_MovieCategory.nowPlaying.toString(), page: page);
  // apakah ada kesalahan

  @override
  Future<Result<List<Movie>>> getUpComing({int page = 1}) async =>
      _getMovies(_MovieCategory.upcoming.toString(), page: page);

  Future<Result<List<Movie>>> _getMovies(String category,
      {int page = 1}) async {
    try {
      final response = await _dio!.get(
          'https://api.themoviedb.org/3/movie/$category?language=en-US&page=$page',
          options: _options);

      final results = List<Map<String, dynamic>>.from(response.data['results']);

      return Result.success(results.map((e) => Movie.fromJSON(e)).toList());
    } on DioException catch (e) {
      return Result.failed('${e.message}');
    }
  }
}

enum _MovieCategory {
  nowPlaying('now_playing'),
  upcoming('upcoming');

  final String _instring;

  const _MovieCategory(String inString) : _instring = inString;

  @override
  String toString() => _instring;
}
