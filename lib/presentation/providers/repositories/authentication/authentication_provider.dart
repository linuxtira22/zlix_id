import 'package:zlix_id/data/firebase/firebase_authentication.dart';
import 'package:zlix_id/data/repositories/autentication.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'authentication_provider.g.dart';

@riverpod
Authentication authentication(AuthenticationRef ref) =>
    FirebaseAuthentication();
