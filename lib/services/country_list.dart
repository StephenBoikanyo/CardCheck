

class CountryList {

  CountryList() {
    countries = [
      'Brazil',
      'Russia',
      'India',
      'China',
      'South Africa',
      'Albania',
      'Argentina',
      'Australia',
      'Canada',
      'Denmark',
      'Egypt',
      'France',
      'Germany',
      'Italy',
      'Japan',
      'Mexico',
      'Netherlands',
      'Peru',
      'Spain',
      'United Kingdom',
      'Afghanistan',
    ];

    bannedCountries = countries.sublist(15);

  }


  void addCountry(String country) {
    countries.add(country);
    if (countries.indexOf(country) >= 15) {
      bannedCountries.add(country);
    }
  }

  void removeCountry(String country) {
    countries.remove(country);
    bannedCountries.remove(country);
  }

  late List<String> countries;
  late List<String> bannedCountries;
}