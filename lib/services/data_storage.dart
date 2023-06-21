import 'package:shared_preferences/shared_preferences.dart';

class DataStorage {


  static Future<List<Map<String, String>>> loadStoredData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? storedData = prefs.getStringList('storedData');

    if (storedData != null) {
      return storedData.map((String data) {
        List<String> values = data.split(',');
        return {
          'name': values[0],
          'lastName': values[1],
          'cardNumber': values[2],
          'provider': values[3],
          'date' : values[4],
          'time' : values[5],

        };
      }).toList();
    }

    return [];
  }

  static Future<void> storeData(
      String name, String lastName,  String cardNumber,String provider,String date, String time) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String newData = '$name,$lastName,$cardNumber,$provider,$date,$time';

    List<String>? storedData = prefs.getStringList('storedData');
    if (storedData != null) {
      storedData.add(newData);
      await prefs.setStringList('storedData', storedData);
    } else {
      await prefs.setStringList('storedData', [newData]);
    }
  }
}
