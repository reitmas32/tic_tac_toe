import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  CustomButton({
    super.key,
    required this.color,
    required this.shadowColor,
    required this.lable,
    this.onTap,
    this.width = 400,
    this.fontSize = 15,
    this.padding = const EdgeInsets.symmetric(vertical: 5),
    this.borderRadius,
  });

  final Color color;
  final Color shadowColor;
  final String lable;
  final VoidCallback? onTap;
  final double width;
  final double fontSize;
  final EdgeInsets padding;
  BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 12,
      ),
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: padding,
          width: width,
          decoration: BoxDecoration(
              color: color,
              borderRadius: borderRadius ?? BorderRadius.circular(5.0),
              boxShadow: [
                BoxShadow(
                  color: shadowColor,
                  offset: const Offset(
                    0,
                    5,
                  ),
                  blurStyle: BlurStyle.solid,
                ),
              ]),
          child: Center(
            child: Text(
              lable,
              style: GoogleFonts.outfit(
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 26, 42, 51),
                  fontSize: fontSize),
            ),
          ),
        ),
      ),
    );
  }
}
