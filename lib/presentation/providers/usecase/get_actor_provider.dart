import 'package:zlix_id/domain/usecases/get_actor/get_actor.dart';
import 'package:zlix_id/presentation/providers/repositories/movie_repository/movie_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_actor_provider.g.dart';

@riverpod
GetActor getActor(GetActorRef ref) => GetActor(movieRepository: ref.watch(movieRepositoryProvider));