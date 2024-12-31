//untuk membuat USER
import 'dart:io';

import 'package:zlix_id/domain/entities/result.dart';
import 'package:zlix_id/domain/entities/user.dart';

abstract interface class UserRepository {
  Future<Result<User>> createUser({
    required String uid,
    required String email,
    required String name,
    String? photoUrl,
    int balace = 0,
  });

  Future<Result<User>> getUser({required String uid});
  Future<Result<User>> updateUser({required User user});
  Future<Result<int>> getUserBalance({required String uid}); // apakah harus uid = balance
  Future<Result<User>> updateUserBalace(
      {required String uid, required int balace});
  Future<Result<User>> uploadProfilePicture(
      {required User user, required File imageFile});
}
