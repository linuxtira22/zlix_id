import 'package:zlix_id/domain/entities/actor.dart';
import 'package:zlix_id/domain/entities/result.dart';
import 'package:zlix_id/domain/usecases/get_actor/get_actor.dart';
import 'package:zlix_id/domain/usecases/get_actor/get_actor_params.dart';
import 'package:zlix_id/presentation/providers/usecase/get_actor_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'actor_provider.g.dart';

@riverpod
Future<List<Actor>> actors(ActorsRef ref, {required int movieId}) async{
  GetActor getActor = ref.read(getActorProvider);

  var actorResult = await getActor(GetActorParams(movieId: movieId));

  return switch (actorResult) {
    Success(value: final actors) => actors,
    Failed(message: _) => const[]
  };
} 