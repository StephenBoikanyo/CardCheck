import 'package:flutter/material.dart';
import 'package:card_check/presentation/utils/constants.dart';

class RoundedPrimaryButton extends StatelessWidget {
  late final String label;
 late final VoidCallback onPressed;

  RoundedPrimaryButton({required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(50,20,50,20),
          child: Text(label, style: mediumText.copyWith(color: Colors.white)),
        ),
      ),
    );
  }
}
