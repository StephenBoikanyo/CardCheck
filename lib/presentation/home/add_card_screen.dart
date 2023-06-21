import 'package:flutter/material.dart';
import 'package:card_check/presentation/utils/constants.dart';
import 'package:card_check/presentation/widgets/widgets.dart';
import 'package:card_check/services/services.dart';
import 'package:intl/intl.dart';

class AddCardScreen extends StatefulWidget {
  static const String id = 'AddCardScreen';
  @override
  State<AddCardScreen> createState() => _AddCardScreenState();
}

class _AddCardScreenState extends State<AddCardScreen> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _cardNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final CountryList countryService = CountryList();

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          automaticallyImplyLeading: true,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  'Add a new card',
                  style: largeText,
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  fieldLabel: 'Card holder name',
                  fieldController: _nameController,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  fieldLabel: 'Card holder last name',
                  fieldController: _lastNameController,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  fieldLabel: 'Card Number',
                  fieldController: _cardNumberController,
                ),
                const SizedBox(
                  height: 20,
                ),







                // Row(
                //   children: [
                //     Expanded(child: CustomTextField(fieldLabel: 'MM/YY')),
                //     const SizedBox(width: 20,),
                //     Expanded(child: CustomTextField(fieldLabel: 'CVV')),
                //   ],
                // ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    RoundedPrimaryButton(
                      label: 'Submit',
                      onPressed: () {
                        String cardNumber = _cardNumberController.text;
                        String provider = CardUtils.getCardProvider(cardNumber);
                        if (CardUtils.isValidCardLength(provider, cardNumber)) {
                          String date =
                              DateFormat.yMMMd().format(DateTime.now());
                          String? time = DateFormat.jm().format(DateTime.now());

                          DataStorage.storeData(
                              _nameController.text,
                              _lastNameController.text,
                              cardNumber,
                              provider,
                              date,
                              time);
                          _nameController.clear();
                          _lastNameController.clear();
                          _cardNumberController.clear();
                        } else {
                          // Show an error message or perform appropriate action
                          print('Invalid card number length!');
                        }
                      },
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    RoundedPrimaryButton(
                      label: 'Scan',
                      onPressed: () async {
                        List<Map<String, String>> storedData =
                            await DataStorage.loadStoredData();
                        print(storedData);
                      },
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
