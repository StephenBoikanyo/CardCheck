import 'package:credit_card_scanner/credit_card_scanner.dart';
import 'package:flutter/cupertino.dart';

class CardUtils {


  //Function to determine card provider
  static String getCardProvider(String cardNumber) {
    if (cardNumber.startsWith('34') || cardNumber.startsWith('37')) {
      return 'Amex';
    } else if (cardNumber.startsWith('51') ||
        cardNumber.startsWith('52') ||
        cardNumber.startsWith('53') ||
        cardNumber.startsWith('54') ||
        cardNumber.startsWith('55')) {
      return 'Mastercard';
    } else if (cardNumber.startsWith('4')) {
      return 'Visa';
    }
    return 'Unknown';
  }

  // function to validate card
  static bool isValidCardLength(String provider, String cardNumber) {
    int length = cardNumber.length;
    if (provider == 'Amex') {
      return length == 15;
    } else if (provider == 'Mastercard' || provider == 'Visa') {
      return length == 16;
    }
    return false;
  }

  // Function to scan a card
  Future<void> scanCard( TextEditingController cardNumberController,TextEditingController expiryDateController) async {
    CardScanOptions scanOptions = CardScanOptions(
      scanCardHolderName: false,
    );

    CardDetails? cardDetails = await CardScanner.scanCard(scanOptions: scanOptions);

    if (cardDetails != null) {
      cardNumberController.text = cardDetails.cardNumber;
      expiryDateController.text = cardDetails.expiryDate;

    }
  }

}