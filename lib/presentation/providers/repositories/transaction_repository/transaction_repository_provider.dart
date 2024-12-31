import 'package:zlix_id/data/firebase/firebase_repository.dart';
import 'package:zlix_id/data/repositories/transaction_repository.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'transaction_repository_provider.g.dart';

@riverpod
TransactionRepository transactionRepository(TransactionRepositoryRef ref) =>
    FirebaseTransactionRepository();
