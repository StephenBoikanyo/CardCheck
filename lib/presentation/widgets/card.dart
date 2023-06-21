
import 'package:flutter/material.dart';
import 'package:card_check/presentation/utils/constants.dart';

class CardWidget extends StatelessWidget {
  final String cardNumber;
  final String cardHolder;
  final String expiryDate;

  CardWidget({
    required this.cardNumber,
    required this.cardHolder,
    required this.expiryDate,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: AssetImage('assets/images/customcard.png'),
        ),
        borderRadius: BorderRadius.circular(40.0),
        boxShadow: [
          BoxShadow(
            color: Colors.white.withOpacity(0.5),
            spreadRadius: 4,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 20,right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 100),
            Text(
              cardNumber,
              style: largeText.copyWith(color: Colors.white)
            ),
            SizedBox(height: 10.0),
            Row(
              children: [
                Expanded(
                  child: Text(
                    cardHolder,
                    style: mediumText.copyWith(color: Colors.white)
                  ),
                ),
                Text(
                  'Expiry Date: $expiryDate',
                  style: smallText.copyWith(color: Colors.white)
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}