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
  final  TextEditingController _nameController = TextEditingController();
  final  TextEditingController _cardNumberController = TextEditingController();
  final  TextEditingController _cvvController   = TextEditingController();
  final  TextEditingController _expiryDateController = TextEditingController();

  //Card Submission Logic
  void _checkAndSaveCard() async {
    final cardNumber = _cardNumberController.text;
    final provider = CardUtils.getCardProvider(cardNumber);

    if (!CardUtils.isValidCardLength(provider, cardNumber)) {
      _showAlertDialog('Invalid Card Number', 'The entered card number is invalid.');
      return;
    }

    final storedData = await DataStorage.loadStoredData();

    if (storedData.any((data) => data['cardNumber'] == cardNumber)) {
      _showAlertDialog('Card Already Added', 'The entered card has already been added.');
      _clearFields();
      return;
    }

    final date = DateFormat.yMMMd().format(DateTime.now());
    final time = DateFormat.jm().format(DateTime.now());

    DataStorage.storeData(
      _nameController.text,
      cardNumber,
      provider,
      date,
      time,
      _expiryDateController.text,
      _cvvController.text,
    );

    _clearFields();

    Navigator.pop(context);
  }

  void _showAlertDialog(String title, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            ElevatedButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  void _clearFields() {
    _nameController.clear();
    _cardNumberController.clear();
    _cvvController.clear();
    _expiryDateController.clear();
  }




  @override
  Widget build(BuildContext context) {
    final cardUtils = CardUtils();
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.black),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
               const  Text(
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
                  fieldLabel: 'Card number',
                  fieldController: _cardNumberController,
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(child: CustomTextField(fieldLabel: 'MM/YY',fieldController: _expiryDateController,)),
                    const SizedBox(width: 20,),
                    Expanded(child: CustomTextField(fieldLabel: 'CVV',fieldController: _cvvController,)),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),

                Row(
                  children: [
                    RoundedPrimaryButton(
                      label: 'Submit',
                      onPressed: _checkAndSaveCard
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    RoundedPrimaryButton(
                      label: 'Scan',
                      onPressed: () => cardUtils.scanCard(
                          _cardNumberController,
                          _expiryDateController)

                    )
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
