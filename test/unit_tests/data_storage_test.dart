import 'package:card_check/services/data_storage.dart';
import 'package:test/test.dart';
import 'package:shared_preferences/shared_preferences.dart';


void main() {
  group('DataStorage', () {
    SharedPreferences.setMockInitialValues({}); // Set up mock SharedPreferences

    test('loadStoredData returns empty list when no data is stored', () async {
      final List<Map<String, String>> storedData = await DataStorage.loadStoredData();
      expect(storedData, isEmpty);
    });

    test('storeData stores data correctly', () async {
      const name = 'John Doe';
      const cardNumber = '1234567890';
      const provider = 'Visa';
      const date = '2022-01-01';
      const time = '12:00 PM';
      const expiryDate = '01/23';
      const cvv = '123';

      await DataStorage.storeData(name, cardNumber, provider, date, time, expiryDate, cvv);

      final List<Map<String, String>> storedData = await DataStorage.loadStoredData();
      expect(storedData, hasLength(1));
      expect(storedData[0]['name'], equals(name));
      expect(storedData[0]['cardNumber'], equals(cardNumber));
      expect(storedData[0]['provider'], equals(provider));
      expect(storedData[0]['date'], equals(date));
      expect(storedData[0]['time'], equals(time));
      expect(storedData[0]['expiryDate'], equals(expiryDate));
      expect(storedData[0]['cvv'], equals(cvv));
    });
  });
}
