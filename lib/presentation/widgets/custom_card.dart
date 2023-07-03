import 'package:flutter/material.dart';
import 'package:card_check/presentation/utils/constants.dart';

class HomeCard extends StatelessWidget {
  final String cardNumber;
  final String cardHolder;
  final String expiryDate;

  HomeCard({required this.cardNumber,required this.expiryDate,required this.cardHolder});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            /*shadowColor: Colors.blueAccent,*/
            elevation: 20,
            child: ClipPath(
              clipper: ShapeBorderClipper(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15))),
              child: Container(
                  height: 200,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/cardbackground.jpg"),
                        fit: BoxFit.cover,
                      )),
                  padding: EdgeInsets.fromLTRB(20,20,20,20),
                  child: Column(
                    children: <Widget>[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          const  SizedBox(width: 100,),
                          Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Image.asset(
                                    'assets/images/cardchip.png',
                                    width: 25,
                                    height: 25,
                                  ),
                                  Image.asset(
                                    'assets/images/contactlesslogo.png',
                                    width: 50,
                                    height: 50,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(cardNumber,
                              style: mediumText.copyWith(color: Colors.deepOrange,letterSpacing: 5),),
                        ],
                      ),
                      const SizedBox(height: 30,),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Column(
                              children: <Widget>[
                                Text('Card Holder',
                                    style: smallText.copyWith(color: Colors.white)),
                                Text(cardHolder,
                                    style: mediumText.copyWith(color: Colors.deepOrange)),
                              ],
                            ),
                          ),
                        const  SizedBox(width: 100,),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text('Expiry Date',
                                    style: smallText.copyWith(color: Colors.white)),
                                Text(expiryDate,
                                    style: mediumText.copyWith(color: Colors.deepOrange)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  )),
            ),
          ),
        ],
      ),
    );
  }
}