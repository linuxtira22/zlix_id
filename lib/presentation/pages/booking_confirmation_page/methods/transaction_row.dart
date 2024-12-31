import 'package:flutter/material.dart';
import 'package:zlix_id/presentation/misc/methods.dart';

Widget transactionRow({
  required String title,
  required String value,
  required double witdh,
}) =>
    Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 110,
            child: Text(
              title,
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
          horizontalSpace(20),
          SizedBox(
            width: witdh - 110 - 20,
            child: Text(value),
          )
        ],
      ),
    );
