import 'package:zlix_id/data/firebase/firebase_user_repository.dart';
import 'package:zlix_id/data/repositories/transaction_repository.dart';
import 'package:zlix_id/domain/entities/result.dart';
import 'package:zlix_id/domain/entities/transaction.dart';

import 'package:cloud_firestore/cloud_firestore.dart' as firestore;

class FirebaseTransactionRepository implements TransactionRepository {
  final firestore.FirebaseFirestore _firebaseFirestore;

  FirebaseTransactionRepository(
      {firestore.FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore =
            firebaseFirestore ?? firestore.FirebaseFirestore.instance;

  @override
  Future<Result<Transaction>> createTransaction(
      {required Transaction transaction}) async {
        firestore.CollectionReference<Map<String, dynamic>> transactions = _firebaseFirestore.collection('transaction');

        try{
          var balanceResult = 
            await FirebaseUserRepository().getUserBalance(uid: transaction.uid);

          if(balanceResult.isSuccess){
            int previousBalace = balanceResult.resultValue!;

            if(previousBalace - transaction.total >= 0) {
              await transactions.doc(transaction.id).set(transaction.toJson());

              var result = await transactions.doc(transaction.id).get(); 
              if(result.exists) {
                await FirebaseUserRepository().updateUserBalace(uid: transaction.uid, balace: previousBalace - transaction.total);

                return Result.success(Transaction.fromJson(result.data()!));
              } else {
                return const Result.failed('Failed to create transaction data');
              }
            } else {
              return const Result.failed('Insufficient balance');
            }
          } else {return const Result.failed('Failed to create transaction data');}

        } catch (e) {
          return Result.failed('Failed to create transaction data');
        }
      }

  @override
  Future<Result<List<Transaction>>> getUserTransactions({required String uid}) async {
    firestore.CollectionReference<Map<String, dynamic>> transactions = _firebaseFirestore.collection('Transaction'); 

    try { 
      var result = await transactions.where('uid' , isEqualTo: uid).get();

      if(result.docs.isEmpty) {
        return Result.success(
          result.docs.map((e) => Transaction.fromJson(e.data())).toList()
        );
      } else {
        return const Result.success([]);
      }
    } catch (e) {
      return const Result.failed('Failed to get transaction');
    }
  }
}

extension on firestore.CollectionReference<Map<String, dynamic>> {
  get uid => null;
}
