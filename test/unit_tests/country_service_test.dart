import 'package:card_check/services/services.dart';
import 'package:test/test.dart';

void main() {
  group('CountryList', () {
    test('addCountry adds the country to the list', () {
      final countryList = CountryList();
      countryList.addCountry('New Country');

      expect(countryList.countries, contains('New Country'));
    });

    test('addCountry adds the country to the banned countries list if index is greater than or equal to 15', () {
      final countryList = CountryList();
      countryList.addCountry('United States');

      expect(countryList.bannedCountries, contains('United States'));
    });

    test('removeCountry removes the country from the list', () {
      final countryList = CountryList();
      countryList.removeCountry('Mexico');

      expect(countryList.countries, isNot(contains('Mexico')));
    });

    test('removeCountry removes the country from the banned countries list', () {
      final countryList = CountryList();
      countryList.removeCountry('Spain');

      expect(countryList.bannedCountries, isNot(contains('Spain')));
    });
  });
}
