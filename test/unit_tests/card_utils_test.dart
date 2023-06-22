import 'package:card_check/services/services.dart';
import 'package:test/test.dart';

void main() {
  group('CardUtils', () {
    test('getCardProvider returns correct provider for card numbers', () {
      expect(CardUtils.getCardProvider('341234567890123'), 'Amex');
      expect(CardUtils.getCardProvider('371234567890123'), 'Amex');
      expect(CardUtils.getCardProvider('5112345678901234'), 'Mastercard');
      expect(CardUtils.getCardProvider('5212345678901234'), 'Mastercard');
      expect(CardUtils.getCardProvider('5312345678901234'), 'Mastercard');
      expect(CardUtils.getCardProvider('5412345678901234'), 'Mastercard');
      expect(CardUtils.getCardProvider('5512345678901234'), 'Mastercard');
      expect(CardUtils.getCardProvider('4112345678901234'), 'Visa');
    });

    test('isValidCardLength returns true for valid card lengths', () {
      expect(CardUtils.isValidCardLength('Amex', '341234567890123'), isTrue);
      expect(CardUtils.isValidCardLength('Amex', '371234567890123'), isTrue);
      expect(CardUtils.isValidCardLength('Mastercard', '5112345678901234'), isTrue);
      expect(CardUtils.isValidCardLength('Mastercard', '5212345678901234'), isTrue);
      expect(CardUtils.isValidCardLength('Visa', '4112345678901234'), isTrue);
    });

    test('isValidCardLength returns false for invalid card lengths', () {
      expect(CardUtils.isValidCardLength('Amex', '34123456789012'), isFalse);
      expect(CardUtils.isValidCardLength('Amex', '37123456789012345'), isFalse);
      expect(CardUtils.isValidCardLength('Mastercard', '51123456789012345'), isFalse);
      expect(CardUtils.isValidCardLength('Mastercard', '52123456789012'), isFalse);
      expect(CardUtils.isValidCardLength('Visa', '411234567890123'), isFalse);
    });
  });
}
