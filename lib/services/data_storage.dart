import 'package:shared_preferences/shared_preferences.dart';

class DataStorage {


  static Future<List<Map<String, String>>> loadStoredData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
   final List<String>? storedData = prefs.getStringList('storedData');

    if (storedData != null) {
      return storedData.map((String data) {
        final values = data.split(',');
        return {
          'name': values[0],
          'cardNumber': values[1],
          'provider': values[2],
          'date' : values[3],
          'time' : values[5],
          'expiryDate': values[6],
          'cvv' : values[4],
        };
      }).toList();
    }

    return [];
  }

  static Future<void> storeData(
      String name,String cardNumber,String provider,String date, String time,String expiryDate,String cvv ,) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String newData = '$name,$cardNumber,$provider,$date,$time,$expiryDate,$cvv';

    List<String>? storedData = prefs.getStringList('storedData');
    if (storedData != null) {
      storedData.add(newData);
      await prefs.setStringList('storedData', storedData);
    } else {
      await prefs.setStringList('storedData', [newData]);
    }
  }
}
