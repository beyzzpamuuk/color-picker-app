import 'package:flutter/material.dart';

class ColorDisplay extends StatelessWidget {
  const ColorDisplay({
    super.key,
    required this.selectedColor,
    required this.isCircular,
  });

  final Color selectedColor;
  final bool isCircular;

  @override
  Widget build(BuildContext context) {
   final deviceSize = MediaQuery.of(context).size;
   final container_Size = deviceSize.shortestSide * 0.4;
    return Container(
      width: container_Size,
      height: container_Size,

      decoration: BoxDecoration(
        color: selectedColor,
        borderRadius: BorderRadius.circular(isCircular ? container_Size/2 : 10),
        boxShadow: [
          BoxShadow(
            color: selectedColor.withOpacity(0.5),
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
    );
  }
}
