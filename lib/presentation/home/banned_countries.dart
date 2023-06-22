import 'package:card_check/presentation/widgets/custom_textfield.dart';
import 'package:card_check/presentation/widgets/rounded_primary_button.dart';
import 'package:flutter/material.dart';
import 'package:card_check/services/services.dart';
import 'package:card_check/presentation/utils/constants.dart';


class BannedCountriesScreen extends StatefulWidget {

  static const String id = 'BannedCountriesScreen';

  @override
  _BannedCountriesScreenState createState() => _BannedCountriesScreenState();
}

class _BannedCountriesScreenState extends State<BannedCountriesScreen> {
  CountryList countryList = CountryList();
  TextEditingController countryController = TextEditingController();

  void addCountry() {
    String country = countryController.text;
   countryList.addCountry(country);
    countryController.clear();
    setState(() {});
  }

  void removeCountry() {
    String country = countryController.text;
    countryList.removeCountry(country);
    countryController.clear();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16,right: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text(
                'Banned Countries',
                style: largeText
              ),
              Container(
                height: 500,
                child: ListView.builder(
                  itemCount: countryList.bannedCountries.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(countryList.bannedCountries[index],style: mediumText,),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20,),
              CustomTextField(fieldLabel: 'Enter country', fieldController: countryController),
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RoundedPrimaryButton(label: 'Add ', onPressed: addCountry),
                  RoundedPrimaryButton(label: 'Remove', onPressed: removeCountry)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
