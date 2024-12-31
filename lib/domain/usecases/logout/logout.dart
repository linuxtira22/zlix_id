import 'package:zlix_id/data/repositories/autentication.dart';
import 'package:zlix_id/domain/usecases/usecase.dart';

import 'package:zlix_id/domain/entities/result.dart';

class Logout implements Usecase<Result<void>, void> {
  final Authentication _authentication;

  Logout({required Authentication authentication})
      : _authentication = authentication;

  @override
  Future<Result<void>> call(void _) {
    return _authentication.logout();
  }
}
