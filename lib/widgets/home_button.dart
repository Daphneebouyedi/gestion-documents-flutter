import 'package:flutter/material.dart';
import 'package:flutter_application_1/theme.dart'; // Re-added theme import

class HomeButton extends StatelessWidget {
  final String image;
  final String label;
  final VoidCallback onTap;
  final double imageHeight;

  const HomeButton({
    required this.image,
    required this.label,
    required this.onTap,
    this.imageHeight = 52,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: whiteColor, // Reverted to whiteColor
      borderRadius: BorderRadius.circular(18),
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: lightGray, width: 1.2), // Reverted to lightGray
          ),
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded( // Make the image expanded
                child: Image.asset(image, fit: BoxFit.contain), // Use BoxFit.contain to fit the image
              ),
            ],
          ),
        ),
      ),
    );
  }
}
