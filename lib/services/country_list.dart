

class CountryList {
  final List<String> allCountries = [
    'Brazil',
    'Russia',
    'India'
    'South Africa',
    'Botswana',
    'Afghanistan',
    'Albania',
    'Algeria',
    'Andorra',
    'Angola',
    'Antigua and Barbuda',
    'Argentina',
    'Armenia',
    'Australia',
    'Austria',
    'Azerbaijan',
    'Bahamas',
    'Bahrain',
    'Bangladesh',
    'Barbados',
    'Belarus',
    'Belgium',
    'Belize',
    'Benin',
    'Bhutan',
    'Bolivia',
    'Bosnia and Herzegovina',
    'Botswana',
    'Brazil',
    'Brunei',
    'Bulgaria',
  ];

  List<String> countries = [];

    Future<List<String>> getCountryList() async {
    await Future.delayed(Duration(seconds: 2)); // Simulating a delay to show async nature of Dart

    return countries;
  }

  void generateCountryList() {
    countries = List.from(allCountries);
    if (countries.length > 15) {
      for (int i = 15; i < countries.length; i++) {
        countries[i] = 'Banned ${countries[i]}';
      }
    }
    countries = countries.sublist(0, (20 < countries.length ? 20 : countries.length) as int);
  }

  void appendCountry(String country) {
    if (countries.length < 20) {
      countries.add(country);
    }
  }
}
