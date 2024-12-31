import 'package:zlix_id/data/repositories/transaction_repository.dart';
import 'package:zlix_id/domain/entities/result.dart';
import 'package:zlix_id/domain/entities/transaction.dart';
import 'package:zlix_id/domain/usecases/get_transaction/get_transaction_param.dart';
import 'package:zlix_id/domain/usecases/usecase.dart';

class GetTransactions
    implements Usecase<Result<List<Transaction>>, GetTransactionParam> {
  final TransactionRepository _transactionRepository;

  GetTransactions({required TransactionRepository transactionRepository})
      : _transactionRepository = transactionRepository;

  @override
  Future<Result<List<Transaction>>> call(GetTransactionParam params) async {
    var transactionListResult =
        await _transactionRepository.getUserTransactions(uid: params.uid);

    return switch (transactionListResult) {
      Success(value: final transactionList) => Result.success(transactionList),
      Failed(:final message) => Result.failed(message)
    };
  }
}
