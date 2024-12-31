import 'package:zlix_id/domain/usecases/get_transaction/get_transaction.dart';
import 'package:zlix_id/presentation/providers/repositories/transaction_repository/transaction_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_transactions_provider.g.dart';
//ada sedikit masalah
@riverpod
GetTransactions getTransaction(GetTransactionRef ref) => GetTransactions(
    transactionRepository: ref.watch(transactionRepositoryProvider));
