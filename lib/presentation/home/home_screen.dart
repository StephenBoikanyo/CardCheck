import 'package:card_check/presentation/home/add_card_screen.dart';
import 'package:flutter/material.dart';
import 'package:card_check/presentation/utils/constants.dart';
import 'package:card_check/presentation/widgets/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:card_check/services/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class HomeScreen extends StatefulWidget {
  static const String id = 'HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<Map<String, String>> _storedData = [];

  @override
  void initState() {
    super.initState();
    _loadStoredData();
  }

  void _loadStoredData() async {
    List<Map<String, String>> storedData = await DataStorage.loadStoredData();
    setState(() {
      _storedData = storedData;
    });
  }

  @override
  Widget build(BuildContext context) {
    var name = 'Naledi';
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      drawer: const Drawer(),
      body: Column(
        children: [
          const SizedBox(height: 20,),
          Expanded(
              child: Column(
            children: [
              Text('${greeting()}, $name!',style: largeText,),
              const SizedBox(height: 10,),
              Text('You have no registered cards in your wallet.',
                style: smallText.copyWith(color: const Color(0xff4F4F4F)),),

              Container(
                height: 500,
                child: ListView.builder(
                  itemCount: _storedData.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      leading: CircleAvatar(
                              backgroundColor: Color(0xffDF6B00),
                          child: FaIcon(FontAwesomeIcons.ccAmex)),
                      title: Text('Name: ${_storedData[index]['name']}'),
                      subtitle: Text(
                        'Last Name: ${_storedData[index]['lastName']}\nCard Number: ${_storedData[index]['cardNumber']}',
                      ),
                    );
                  },
                ),
              ),









            ],
          )),
          RoundedPrimaryButton(label: 'Add a card',
              onPressed: () => Navigator.pushNamed(context, AddCardScreen.id)),
          const SizedBox(height: 20,),
        ],
      ),
    );

  }
}
