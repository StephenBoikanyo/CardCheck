import 'package:card_check/presentation/home/add_card_screen.dart';
import 'package:card_check/presentation/home/banned_countries.dart';
import 'package:card_check/presentation/utils/constants.dart';
import 'package:card_check/presentation/widgets/widgets.dart';
import 'package:card_check/services/services.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class HomeScreen extends StatefulWidget {
  static const String id = 'HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Map<String, String>>> _storedDataFuture;

  @override
  void initState() {
    super.initState();
    _loadStoredData();
  }

  Future<void> _loadStoredData() async {
    setState(() {
      _storedDataFuture = DataStorage.loadStoredData();
    });
  }

  @override
  Widget build(BuildContext context) {
    var name = 'Naledi';
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 16,top: 8),
          child: InkWell(
            onTap: () => Navigator.pushNamed(context, BannedCountriesScreen.id),
              child: FaIcon(FontAwesomeIcons.gear,size: 20,)),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FutureBuilder<List<Map<String, String>>>(
                future: _storedDataFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return const Text('Error loading data');
                  } else {
                    final _storedData = snapshot.data ?? [];

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${greeting()}, $name!',
                          style: largeText,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        // A Card Carousel to view saved cards
                        SizedBox(
                          height: 230,
                          width: 500,
                          child: Center(
                            child: PageView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: _storedData.length,
                              itemBuilder: (context, index) {
                                final cardNumber =
                                _storedData[index]['cardNumber'].toString();
                                final cardHolder =
                                    '${_storedData[index]['name']}';
                                final expiryDate =
                                _storedData[index]['expiryDate'].toString();

                                return customcard(
                                  cardNumber: cardNumber,
                                  cardHolder: cardHolder,
                                  expiryDate: expiryDate,
                                );
                              },
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text('Swipe to view your saved cards', style: smallText.copyWith(fontSize: 10),textAlign: TextAlign.end,),
                            const SizedBox(width: 10,),
                            FaIcon(FontAwesomeIcons.rightLeft ,size: 10,)
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          'Registered Card Sessions',
                          style: mediumText,
                        ),
                        Container(
                          height: _storedData.isEmpty ? null : 300,
                          child: _storedData.isEmpty
                              ?  Center(
                            child: Text(
                              'There are currently no cards saved',
                              style: mediumText.copyWith(color: Colors.red),
                            ),
                          )
                              : ListView.builder(
                            itemCount: _storedData.length,
                            itemBuilder: (BuildContext context, int index) {
                              return ListTile(
                                leading: CircleAvatar(
                                  backgroundColor: const Color(0xffDF6B00),
                                  child: _storedData[index]['provider'] ==
                                      'Mastercard'
                                      ? FaIcon(FontAwesomeIcons.ccMastercard)
                                      : _storedData[index]['provider'] ==
                                      'Visa'
                                      ? FaIcon(FontAwesomeIcons.ccVisa)
                                      : _storedData[index]['provider'] ==
                                      'Amex'
                                      ? FaIcon(
                                      FontAwesomeIcons.ccAmex)
                                      : null,
                                ),
                                title: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '${_storedData[index]['cardNumber']}',
                                      style: smallText,
                                    ),
                                  ],
                                ),
                                subtitle: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Date: ${_storedData[index]['date']}',
                                      style: smallText.copyWith(
                                          color: Colors.green),
                                    ),
                                    Text(
                                      'Time: ${_storedData[index]['time']}',
                                      style: smallText.copyWith(
                                          color: Colors.green),
                                    )
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    );
                  }
                },
              ),
              const SizedBox(
                height: 20,
              ),

              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.zero,
        child: Align(
          alignment: Alignment.bottomCenter,
          child:  RoundedPrimaryButton(
            label: 'Add a card',
            onPressed: () {
              Navigator.pushNamed(context, AddCardScreen.id).then((_) {
                _loadStoredData();
              });
            },
          ),
        ),
      ),
    );
  }
}
