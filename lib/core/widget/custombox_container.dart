import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomBoxContainer extends StatelessWidget {
  final String text;
  final String imagePath;
  final Color bgColor;
  final Color solidColor;
  final double outlineStrokeWidth;

  const CustomBoxContainer({
    Key? key,
    required this.text,
    required this.imagePath,
    required this.bgColor,
    required this.solidColor,
    required this.outlineStrokeWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: solidColor,
            width: outlineStrokeWidth,
          ),
        ),
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            SvgPicture.asset(imagePath),
            const SizedBox(width: 8),
            Text(
              text,
              style: TextStyle(
                  color: solidColor, fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
