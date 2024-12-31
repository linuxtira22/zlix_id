import 'dart:io';

import 'package:zlix_id/data/repositories/user_repository.dart';
import 'package:zlix_id/domain/entities/result.dart';
import 'package:zlix_id/domain/entities/user.dart';

class DummyUserRepository implements UserRepository{
  @override
  Future<Result<User>> createUser({required String uid, required String email, required String name, String? photoUrl, int balace = 0}) {
    // TODO: implement createUser
    throw UnimplementedError();
  }

  @override
  Future<Result<User>> getUser({required String uid}) async {
    await Future.delayed(Duration(seconds: 1));

    return Result.success(User(uid: uid, email: 'dummy@dummy.com', name: 'dummy'));
  }

  @override
  Future<Result<int>> getUserBalance({required String uid}) {
    // TODO: implement getUserBalance
    throw UnimplementedError();
  }

  @override
  Future<Result<User>> updateUser({required User user}) {
    // TODO: implement updateUser
    throw UnimplementedError();
  }

  @override
  Future<Result<User>> updateUserBalace({required String uid, required int balace}) {
    // TODO: implement updateUserBalace
    throw UnimplementedError();
  }

  @override
  Future<Result<User>> uploadProfilePicture({required User user, required File imageFile}) {
    // TODO: implement uploadProfilePicture
    throw UnimplementedError();
  }
}