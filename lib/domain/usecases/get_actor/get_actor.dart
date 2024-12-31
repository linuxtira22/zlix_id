import 'package:zlix_id/data/repositories/movie_repository.dart';
import 'package:zlix_id/domain/entities/actor.dart';
import 'package:zlix_id/domain/entities/result.dart';
import 'package:zlix_id/domain/usecases/get_actor/get_actor_params.dart';
import 'package:zlix_id/domain/usecases/usecase.dart';

class GetActor implements Usecase<Result<List<Actor>>, GetActorParams> {
  final MovieRepository _movieRepository;

  GetActor({required MovieRepository movieRepository}) : _movieRepository = movieRepository;
  
  @override
  Future<Result<List<Actor>>> call(GetActorParams params) async {
    var actorListResult = await _movieRepository.getActors(id: params.movieId);

    return switch (actorListResult) {
      Success(value: final actorList) => Result.success(actorList),
      Failed(:final message) => Result.failed(message)
    };
  }
}