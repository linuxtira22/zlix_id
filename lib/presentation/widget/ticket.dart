import 'package:flutter/material.dart';
import 'package:zlix_id/domain/entities/transaction.dart';
import 'package:zlix_id/presentation/widget/network_image_card.dart';

class Ticket extends StatelessWidget {
  final Transaction transaction;

  const Ticket({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('asfafasssssssssssssssssssssssssss'),
        // width: double.infinity,
        // decoration: BoxDecoration(
        //     color: const Color(0xFF252836),
        //     borderRadius: BorderRadius.circular(10)),
        // child:
        //     Text(transaction.title),
        //     Column(
        //   children: [
        //     Container(
        //       width: double.infinity,
        //       padding: EdgeInsets.all(10),
        //       decoration: BoxDecoration(
        //         color: Colors.grey.shade800,
        //         borderRadius: BorderRadius.only(
        //           topLeft: Radius.circular(10),
        //           topRight: Radius.circular(10),
        //         ),
        //       ),
        //       child: Text(
        //         transaction.id.toString(),
        //         style: TextStyle(
        //           fontSize: 10,
        //           fontWeight: FontWeight.bold,
        //         ),
        //       ),
        //     ),
        //     Row(
        //       crossAxisAlignment: CrossAxisAlignment.start,
        //       children: [
        //         Padding(
        //           padding: EdgeInsets.all(10),
        //           child: NetworkImageCard(
        //             width: 75,
        //             height: 114,
        //             imageUrl:
        //                 'https://image.tmdb,org/t/p/w500${transaction.transactionImage}',
        //                 fit: BoxFit.cover,
        //           ),
        //         ),
        //         Expanded(child: Container(padding: EdgeInsets.all(10),))
        //       ],
        //     )
        //   ],
        // ),
        );
  }
}
