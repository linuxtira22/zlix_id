import 'package:zlix_id/data/repositories/movie_repository.dart';
import 'package:zlix_id/domain/entities/movie.dart';
import 'package:zlix_id/domain/entities/result.dart';
import 'package:zlix_id/domain/usecases/get_movie_list/get_movie_list_params.dart';
import 'package:zlix_id/domain/usecases/usecase.dart';

class GetMovieList implements Usecase<Result<List<Movie>>, GetMovieListParam> {
  final MovieRepository _movieRepository;

  GetMovieList({required MovieRepository movieRepository}) : _movieRepository = movieRepository;
  
  @override
  Future<Result<List<Movie>>> call(GetMovieListParam params) async {
    // var movieResult = switch (params.category) {
    //   MovieListCategories.nowPlaying => await _movieRepository.getNowPlaying(page: params.page),
    //   MovieListCategories.upcoming => await _movieRepository.getUpComing(page: params.page),
    // };

    var movieResult;

    // Cek kategori dan dapatkan hasil dari repository
    if (params.category == MovieListCategories.nowPlaying) {
      movieResult = await _movieRepository.getNowPlaying(page: params.page);
    } else if (params.category == MovieListCategories.upcoming) {
      movieResult = await _movieRepository.getUpComing(page: params.page);
    }

    // Pastikan bahwa movieResult tidak null
    if (movieResult == null) {
      return Result.failed("Movie result is null");
    }

    return switch (movieResult) {
      Success(value: final movies) => Result.success(movies),
      Failed(:final message) => Result.failed(message),
      _ => Result.failed("Unknown error") // ini tambahan
    };
  }
} 