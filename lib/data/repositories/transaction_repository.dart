import 'package:zlix_id/domain/entities/result.dart';
import 'package:zlix_id/domain/entities/transaction.dart';

abstract interface class TransactionRepository {
  Future<Result<Transaction>> createTransaction({required Transaction transaction}); //untuk membuat transaksi baru
  Future<Result<List<Transaction>>> getUserTransactions({required String uid}); //untuk mengabil daftar transaksi berdasarkan user id
}