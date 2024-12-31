import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zlix_id/presentation/providers/transaction_data/transaction_data_provider.dart';
import 'package:zlix_id/presentation/widget/ticket.dart';

class TicketPage extends ConsumerWidget {
  const TicketPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return 
    ListView(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(24, 24, 24, 100),
          child: Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: ref.watch(transactionDataProvider).when(
    data: (transactions) {
      // Menambahkan print untuk menampilkan data transaksi
      print('Data transaksi: $transactions');
      
      // Menyaring dan mengurutkan transaksi
      var filteredTransactions = transactions
          .where((element) =>
              element.title != 'Top Up' &&
              element.watchingTime! >= DateTime.now().millisecondsSinceEpoch)
          .toList()
        ..sort(
          (a, b) => a.watchingTime!.compareTo(b.watchingTime!),
        );
      
      // Menampilkan transaksi yang sudah difilter
      print('Filtered transactions: $filteredTransactions');
      
      // Mengembalikan list widget berdasarkan transaksi
      return filteredTransactions
          .map((transaction) => Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Text('apakah ini error'),
              ))
          .toList();
    },
    error: (error, stackTrace) => [const Text('frfs')],
    loading: () => const [CircularProgressIndicator()],
  ),
),
          
        ),
        Text('asdasd')
      ],
    );
  }
}
