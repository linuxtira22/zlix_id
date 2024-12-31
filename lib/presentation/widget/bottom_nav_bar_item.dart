// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class BottomNavBarItem extends StatelessWidget {
  final int index;
  final bool isSelected;
  final String title;
  final String image;
  final String selectedImage;

  const BottomNavBarItem(
      {super.key,
      required this.index,
      required this.isSelected,
      required this.title,
      required this.image,
      required this.selectedImage});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 25,
          height: 25,
          child: Image.asset(isSelected ? selectedImage : image), // kalau isSelected true maka SelectedImage : kalau false maka image; 
        ),
        Text(
          title,
          style: TextStyle(
            fontSize: 9,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}