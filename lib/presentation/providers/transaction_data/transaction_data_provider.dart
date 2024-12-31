import 'package:flutter/foundation.dart';
import 'package:zlix_id/domain/entities/result.dart';
import 'package:zlix_id/domain/entities/transaction.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:zlix_id/domain/entities/user.dart';
import 'package:zlix_id/domain/usecases/get_transaction/get_transaction.dart';
import 'package:zlix_id/domain/usecases/get_transaction/get_transaction_param.dart';
import 'package:zlix_id/presentation/providers/usecase/get_transactions_provider.dart';
import 'package:zlix_id/presentation/providers/user_data/user_data_provider.dart';


part 'transaction_data_provider.g.dart';

@Riverpod(keepAlive: true)
class TransactionData extends _$TransactionData {
  @override
  Future<List<Transaction>> build() async {
    User? user = ref.read(userDataProvider).valueOrNull;

    if (user != null) {
      state = const AsyncLoading();

      GetTransactions getTransactions = ref.read(getTransactionProvider);

      var result = await getTransactions(GetTransactionParam(uid: user.uid));
print('dfffaa'+ result.toString());
      if (result case Success(value: final transactions)) {
        return transactions;
      }
    }

    return const [];
  }

  Future<void> refreshTransactionData() async {
    User? user = ref.read(userDataProvider).valueOrNull;

    if (user != null) {
      state = const AsyncLoading();

      GetTransactions getTransactions = ref.read(getTransactionProvider);

      var result = await getTransactions(GetTransactionParam(uid: user.uid));

      switch (result) {
        case Success(value: final transaction):
          state = AsyncData(transaction);
        case Failed(:final message):
          state = AsyncError(FlutterError(message), StackTrace.current);
          state = AsyncData(state.valueOrNull ?? const []);
      }
    }
  }
}
